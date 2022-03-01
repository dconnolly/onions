#gcloud builds submit --tag europe-docker.pkg.dev/onions-342500/onions/bridge

ID=$RANDOM
NAME="tor-obfsv4-bridge-$ID"

gcloud compute instance-templates create-with-container $NAME \
  --container-image europe-docker.pkg.dev/onions-342500/onions/bridge:latest \
  --container-env OR_PORT="8080",PT_PORT="80",EMAIL="" \
  --machine-type n2d-standard-2 \
  --shielded-secure-boot \
  --tags allow-8080,http-server,https-server
