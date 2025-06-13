{{- range $name, $app := .Values }}
{{- if and (not (hasPrefix "_" $name)) (not (hasPrefix "." $name)) (kindIs "map" $app) }}
{{- if $app.deployment }}
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ $name }}
  annotations:
    {{- toYaml $.Values.annotations | nindent 4 }}
  labels:
    app.kubernetes.io/name: {{ $name }}
    app.kubernetes.io/instance: {{ $.Release.Name }}
    app.kubernetes.io/managed-by: {{ $.Release.Service }}
    app: {{ $name }}
spec:
  replicas: {{ $app.deployment.replicaCount | default 1 }}
  selector:
    matchLabels:
      app: {{ $name }}
  template:
    metadata:
      labels:
        app: {{ $name }}
        lotusflare.com/tag: {{ $app.deployment.image.tag }}
    spec:
      {{- with $app.deployment.imagePullSecrets }}
      imagePullSecrets:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      volumes:
        - name: tmp-volume
          emptyDir: {}
        - name: config-volume
          configMap:
            name: {{ $name }}
        {{- if $app.deployment.config.external_secret.enabled }}
        - name: external-secret-volume
          secret:
            secretName: {{ $name }}-secret
        {{- end }}
      containers:
        - name: {{ $name }}
          image: "{{ $app.deployment.image.repository }}:{{ $app.deployment.image.tag | default $.Chart.AppVersion }}"
          imagePullPolicy: {{ $app.deployment.image.pullPolicy }}
          volumeMounts:
            - name: tmp-volume
              mountPath: /tmp
            - name: config-volume
              mountPath: /mnt/lua/config.lua
              subPath: config.lua
              readOnly: true
            {{- if $app.deployment.config.external_secret.enabled }}
            - name: external-secret-volume
              mountPath: /mnt/lua/secrets.lua
              subPath: secrets.lua
              readOnly: true
            {{- end }}
          resources:
            {{- toYaml $app.deployment.resources | nindent 12 }}
          env:
            - name: K8S_POD_ID
              valueFrom:
                fieldRef:
                  fieldPath: metadata.name
            - name: IMAGE_TAG
              value: {{ $app.deployment.image.tag | quote }}
            {{- if $app.deployment.env }}
            {{- toYaml $app.deployment.env | nindent 12 }}
            {{- end }}
          ports:
            - name: http
              containerPort: {{ $app.deployment.containerPort }}
          livenessProbe:
          {{- toYaml $.Values.livenessProbe | nindent 12 }}
          {{- if $.Values.readinessProbe }}
          readinessProbe:
          {{- toYaml $.Values.readinessProbe | nindent 12 }}
          {{- end }}
          {{- if $.Values.startupProbe }}
          startupProbe:
          {{- toYaml $.Values.startupProbe | nindent 12 }}
          {{- end }}
          {{- with $app.deployment.lifecycle }}
          lifecycle:
            {{- toYaml . | nindent 12 }}
          {{- end }}
          {{- end }}
{{- end }}
{{- end }}
