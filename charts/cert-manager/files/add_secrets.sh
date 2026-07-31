#!/usr/bin/env bash
NAMESPACE=net
NAMESPACE_EXIST=$(kubectl get ns -o name | grep $NAMESPACE)
if [ ${#NAMESPACE_EXIST} -eq 0 ]; then
  kubectl create ns $NAMESPACE
fi

CLOUDFLARE_ZONE_ID=f2ceb9b66f8ef2f917597d4a2741606d
CLOUDFLARE_ACCOUNT_ID=25cb2fc23154857a5fd65cdfc19eb996
CLOUDFLARE_API_TOKEN=cfut_MBojbV9ICvq3k5AnQSgiGSbuKTbKbdQgIkijEXCg0e9c384e
CLOUDFLARE_SECRET=cloudflare-api-token
CLOUDFLARE_SECRET_EXIST=$(kubectl get secret -n $NAMESPACE -o name | grep $CLOUDFLARE_SECRET)
if [ ! ${#CLOUDFLARE_SECRET_EXIST} -eq 0 ]; then
  kubectl delete secret $CLOUDFLARE_SECRET -n $NAMESPACE
fi
kubectl create secret generic $CLOUDFLARE_SECRET \
    --from-literal api-token=$CLOUDFLARE_API_TOKEN \
    -n $NAMESPACE

MKCERT_SECRET=mkcert-ca-key-pair
MKCERT_SECRET_EXIST=$(kubectl get secret -n $NAMESPACE -o name | grep $MKCERT_SECRET)
if [ ! ${#MKCERT_SECRET_EXIST} -eq 0 ]; then
  kubectl delete secret $MKCERT_SECRET -n $NAMESPACE
fi
kubectl create secret tls $MKCERT_SECRET \
  --key "$(mkcert -CAROOT)/rootCA-key.pem" \
  --cert "$(mkcert -CAROOT)/rootCA.pem" \
  --namespace $NAMESPACE