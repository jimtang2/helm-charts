{{- define "certs.localhost" }}
apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
  name: localhost-tls-cert
  namespace: {{ .Release.Namespace }}
  labels:
    {{- include "chart.labels" . | nindent 4 }}
  annotations:
    helm.sh/resource-policy: keep
spec:
  secretName: localhost-tls-cert
  duration: 8760h
  renewBefore: 720h
  commonName: localhost
  dnsNames:
    {{- toYaml .Values.dns.localhost | nindent 4 }}
  issuerRef:
    name: localhost
    kind: ClusterIssuer
    group: cert-manager.io
{{- end }}

{{- define "certs.lab9-studio" }}
apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
  name: lab9-studio-tls-cert
  namespace: {{ .Release.Namespace }}
  labels:
    {{- include "chart.labels" . | nindent 4 }}
  annotations:
    helm.sh/resource-policy: keep
spec:
  secretName: lab9-studio-tls-cert
  duration: 8760h
  renewBefore: 720h
  commonName: lab9.studio
  dnsNames:
    {{- toYaml .Values.dns.lab9 | nindent 4 }}
  issuerRef:
    name: lab9-studio
    kind: ClusterIssuer
    group: cert-manager.io
{{- end }}

{{- define "certs.jimtang-me" }}
apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
  name: jimtang-me-tls-cert
  namespace: {{ .Release.Namespace }}
  labels:
    {{- include "chart.labels" . | nindent 4 }}
  annotations:
    helm.sh/resource-policy: keep
spec:
  secretName: jimtang-me-tls-cert
  duration: 8760h
  renewBefore: 720h
  commonName: jimtang.me
  dnsNames:
    {{- toYaml .Values.dns.jimtang | nindent 4 }}
  issuerRef:
    name: jimtang-me
    kind: ClusterIssuer
    group: cert-manager.io
{{- end }}