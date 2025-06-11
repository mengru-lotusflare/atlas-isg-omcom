{{/*
Expand the name of the chart.
*/}}
{{- define "app.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "app.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "app.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}
{{/*
Add image tag to the chart labels
*/}}
{{- define "app.tag" -}}
lotusflare.com/tag: {{ .Values.image.tag }}
{{- end -}}

{{/*
  App repo label.
*/}}
{{- define "app.repoLabel" -}}
lotusflare.com/repo: lua
{{- end }}

{{/*
  NodeSelector
*/}}
{{- define "app.nodeSelector" -}}
{{- if .Values.global.useLotusFlareEnvOverrides }}
nodeSelector:
  group-name: worker-group-lfapps
{{- else }}
{{- with .Values.nodeSelector }}
nodeSelector:
  {{- toYaml . | nindent 2 }}
{{- end }}
{{- end }}
{{- end -}}

{{/*
  Tolerations
*/}}
{{- define "app.tolerations" -}}
{{- with .Values.tolerations }}
tolerations:
  {{- toYaml . | nindent 2 }}
{{- end }}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "app.labels" -}}
helm.sh/chart: {{ include "app.chart" . }}
{{ include "app.ownerLabel" . }}
{{ include "app.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
App owner label
*/}}
{{- define "app.ownerLabel" -}}
{{- if .Values.appOwner -}}
lotusflare.com/owner: {{ .Values.appOwner }}
{{- end -}}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "app.selectorLabels" -}}
app.kubernetes.io/name: {{ include "app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
{{/*
Selector labels canary
*/}}
{{- define "app.selectorLabels-canary" -}}
app.kubernetes.io/name: {{ include "app.name" . }}-primary
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Cronjob labels, doesn't include selector to avoid traffic getting routed to cron pod
*/}}
{{- define "app.cronLabels" -}}
helm.sh/chart: {{ include "app.chart" . }}
app.kubernetes.io/name: {{ include "app.name" . }}-cron
{{ include "app.ownerLabel" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Defines Kubernetes service name
*/}}
{{- define "app.serviceName" -}}
"{{- include "app.fullname" . }}"
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "app.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "app.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Return the appropriate apiVersion for cronjob APIs.
*/}}
{{- define "cronjob.apiVersion" -}}
{{- print "batch/v1" }}
{{- end -}}

{{/*
Returns the external secret keys.
*/}}
"externalSecretKeys":
{{- define "external.secret.template" -}}
{{ $externalSecretKeys := list }}
{{- range $operator, $keys := .Values.config.external_secret.keys }}
{{- range $index, $key := $keys }}
{{- $formattedKey := regexReplaceAll "[.-]" $key "_" }}
{{- $externalSecretKeys = print "\"" $key "\"" ":" "{{ ." $formattedKey " | toJson }}" | append $externalSecretKeys }}
{{- end }}
{{- end }}
{{- join "," $externalSecretKeys -}}
{{- end -}}
