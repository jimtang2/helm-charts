{{- define "issuers.localhost" }}
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: localhost
  labels:
    {{- include "chart.labels" . | nindent 4 }}
  annotations:
    helm.sh/resource-policy: keep
spec:
  ca:
    secretName: mkcert-ca
{{- end }}

{{- define "issuers.lab9-studio" }}
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: lab9-studio
  labels:
    {{- include "chart.labels" . | nindent 4 }}
  annotations:
    helm.sh/resource-policy: keep
spec:
  acme:
    server: https://acme-v02.api.letsencrypt.org/directory
    email: me@lab9.studio
    privateKeySecretRef:
      name: lab9-studio-tls-key
    solvers:
    - dns01:
        cloudflare:
          apiTokenSecretRef:
            name: cloudflare-api-token
            key: token
{{- end }}

{{- define "issuers.jimtang-me" }}
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: jimtang-me
  labels:
    {{- include "chart.labels" . | nindent 4 }}
  annotations:
    helm.sh/resource-policy: keep
spec:
  acme:
    server: https://acme-v02.api.letsencrypt.org/directory
    email: me@jimtang.me
    privateKeySecretRef:
      name: jimtang-me-tls-key
    solvers:
    - dns01:
        cloudflare:
          apiTokenSecretRef:
            name: cloudflare-api-token
            key: token
{{- end }}
