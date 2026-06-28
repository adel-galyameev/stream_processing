{{- define "orders-chart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "orders-chart.fullname" -}}
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

{{- define "orders-chart.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "orders-chart.labels" -}}
helm.sh/chart: {{ include "orders-chart.chart" . }}
{{ include "orders-chart.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "orders-chart.selectorLabels" -}}
app.kubernetes.io/name: {{ include "orders-chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "orders-chart.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "orders-chart.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "microservice.name" -}}
{{- .name }}
{{- end }}

{{- define "microservice.labels" -}}
app: {{ .name }}
{{- end }}

{{- define "postgresql.labels" -}}
app: {{ .Values.postgresql.name }}
{{- end }}

{{- define "zookeeper.labels" -}}
app: {{ .Values.zookeeper.name }}
{{- end }}

{{- define "kafka.labels" -}}
app: {{ .Values.kafka.name }}
{{- end }}
