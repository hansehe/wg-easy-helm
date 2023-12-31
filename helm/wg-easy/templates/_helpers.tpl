{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "wg-easy.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "wg-easy.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "wg-easy.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "wg-easy.labels" -}}
helm.sh/chart: {{ include "wg-easy.chart" . }}
{{ include "wg-easy.selectorLabels" . }}
app.kubernetes.io/version: "{{ include "wg-easy.wg-easyVersion" . }}"
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Version is either the Chart's AppVersion or the image versionOverride, if specified
*/}}
{{- define "wg-easy.wg-easyVersion" -}}
{{- if ne .Values.image.versionOverride "*" -}}
{{- .Values.image.versionOverride -}}
{{- else -}}
{{ .Chart.AppVersion }}
{{- end -}}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "wg-easy.selectorLabels" -}}
app.kubernetes.io/name: {{ include "wg-easy.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "wg-easy.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "wg-easy.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}
