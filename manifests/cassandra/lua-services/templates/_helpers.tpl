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
  Check if the current subchart matches the target
  Returns "true" or "false" as a string
  */}}
  {{- define "isTargetSubchart" -}}
  {{- $subchart := .subchart | default "" -}}
  {{- $target := .target | default "" -}}
  {{- if eq $subchart $target -}}
  {{- "true" -}}
  {{- else -}}
  {{- "false" -}}
  {{- end -}}
  {{- end -}}
  
  {{/* Control which subcharts are enabled based on subchart parameter */}}
  {{- define "lua-services.init" -}}
  {{- if .Values.onlyEnableSelectedSubchart }}
    {{- range $name, $subchart := .Subcharts }}
      {{- if ne $name $.Values.subchart }}
        {{- $_ := set $subchart.Values "enabled" false }}
      {{- else }}
        {{- $_ := set $subchart.Values "enabled" true }}
      {{- end }}
    {{- end }}
  {{- end }}
  {{- end -}}
  
  {{/* Call the initialization function */}}
  {{- template "lua-services.init" . -}}
