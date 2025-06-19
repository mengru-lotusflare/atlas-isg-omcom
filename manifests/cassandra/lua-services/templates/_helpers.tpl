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
{{/* Check if current subchart matches target */}}
{{- define "isTargetSubchart" -}}
{{- $subchart := .subchart | default "" -}}
{{- $target := .target | default "" -}}
{{- eq $subchart $target -}}
{{- end -}}
