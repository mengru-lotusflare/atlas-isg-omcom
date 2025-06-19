{{/*
  Available cluster list - returns a properly formatted JSON structure
*/}}
{{- define "available.cluster.list" -}}
{{- $clusters := list -}}
{{- if not (eq (int .Values.deployment.replicaCount | default 1) 0) -}}
{{- $clusters = append $clusters "default" -}}
{{- end -}}
{{- range $clusterName, $clusterConfig := .Values.clusters | default dict -}}
{{- if $clusterConfig.enabled -}}
{{- $clusters = append $clusters $clusterName -}}
{{- end -}}
{{- end -}}
{ "available-clusters": {{ $clusters | toJson }} }
{{- end -}}

 {{/*
   Cluster application configs, created as a dictionary because of checksum calculation.
 */}}
 {{- define "cluster.app.configs" -}}
 {{- $defaultDependenciesConfig := include "app.dependencies.config" . | fromYaml }}
 {{- $allClusters := merge $.Values.clusters (dict "default" (dict "config" $.Values.config)) }}
 {{- range $clusterName, $entireClusterConfig := $allClusters }}
 {{- $clusterConfig := $entireClusterConfig.config | default dict }}
 {{- $clusterAppConfig := ((get $.Values.clusters $clusterName) | default dict ).config | default dict }}
 {{- $clusterAppConfigWithDefaults := merge $clusterAppConfig $clusterConfig $.Values.config $defaultDependenciesConfig }}
 {{ $clusterName }}:
 {{- toYaml $clusterAppConfigWithDefaults | nindent 2 }}
 {{- end }}
 {{- end -}}
