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


{{/*
  Include a static file from a subchart when the subchart is selected
*/}}
{{- define "lua-services.includeStaticFile" -}}
{{- $subchart := .subchart -}}
{{- $filepath := .filepath -}}
{{- $currentSubchart := .currentSubchart -}}
{{- if eq $subchart $currentSubchart -}}
{{- $.Files.Get $filepath -}}
{{- end -}}
{{- end -}}
