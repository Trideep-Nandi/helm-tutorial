{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "helm-tutorial.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "helm-tutorial.selectorLabels" -}}
app.kubernetes.io/name: {{ .Chart.Name}}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "helm-tutorial.labels" -}}
helm.sh/chart: {{ include "helm-tutorial.chart" . }}
{{ include "helm-tutorial.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Create a fullname helper
*/}}
{{- define "helm-tutorial.fullname" -}}
{{- $name := .Chart.Name -}}
{{- if .Values.nameOverride -}}
  {{- $name = .Values.nameOverride -}}
{{- end -}}
{{- $fullname := printf "%s-%s" .Release.Name $name | trunc 48 | trimSuffix "-" }}
{{- print $fullname }}
{{- end }}
