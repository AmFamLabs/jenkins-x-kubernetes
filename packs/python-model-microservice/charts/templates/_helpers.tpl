{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a DNS record name
*/}}
{{- define "custom_hostname" -}}
{{- $env := ternary ".preview" (ternary ".staging" "" (contains "staging" .Release.Namespace)) (contains "-pr-" .Release.Namespace) -}}
{{/*
$pr will be something like "-pr-8" for preview and "" otherwise
*/}}
{{- $pr := regexFind "-pr-[1-9]*" .Release.Namespace -}}
{{- $service := list .Values.service.name $pr $env | join "" | trunc 63 -}}
{{- printf "%s.arturo.ai" $service -}}
{{- end -}}

{{/*
Create a DNS record name
*/}}
{{- define "provided_hostname" -}}
{{- $service := list .Values.service.name .Release.Namespace | join "." -}}
{{- printf "%s.arturo.ai" $service -}}
{{- end -}}
