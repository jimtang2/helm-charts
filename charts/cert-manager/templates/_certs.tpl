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
  - 127.0.0.1
  - ::1
  - localhost
  - nginx.localhost
  - audiobook.localhost
  - torrent.localhost
  - jackett.localhost
  - headlamp.localhost
  - keycloak.localhost
  - flux.localhost
  - elasticsearch.localhost
  - kibana.localhost
  - grafana.localhost
  - alertmanager.localhost
  - prometheus.localhost
  - logstash.localhost
  - argocd.localhost
  - mail.localhost
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
  - "login.lab9.studio"
  - "auth.lab9.studio"
  - "www.lab9.studio"
  - "lab9.studio"
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
  - "login.jimtang.me"
  - "auth.jimtang.me"
  - "www.jimtang.me"
  - "jimtang.me"
  issuerRef:
    name: jimtang-me
    kind: ClusterIssuer
    group: cert-manager.io
{{- end }}