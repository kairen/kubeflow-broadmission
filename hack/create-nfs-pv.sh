#!/bin/sh


export SERVER=${SERVER:-"localhost"}

for i in {1..20}; do
cat <<EOF | kubectl create -f -
apiVersion: v1
kind: PersistentVolume
metadata:
  name: user${i}-pv
spec:
  capacity:
    storage: 10Gi
  accessModes:
    - ReadWriteOnce
  persistentVolumeReclaimPolicy: Recycle
  nfs:
    path: /nfs-data/user${i}
    server: ${SERVER}
EOF
done
