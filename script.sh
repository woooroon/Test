#login to azure
az login --use-device-code
#create new resource group
az group create --name MyTestGroup --location eastus
az vm create \
  --resource-group MyTestGroup \
  --name MyTestVM \
  --image UbuntuLTS \
  --admin-username linuxuser \
  --size Standard_B1s \
  --generate-ssh-keys \
  --public-ip-sku Standard
#install nginx on vm
az vm run-command invoke \
   --resource-group MyTestGroup \
   --name MyTestVM \
   --command-id RunShellScript \
   --scripts "sudo apt-get update && sudo apt-get install -y nginx"
#open http port on vm
az vm open-port --port 80 --resource-group MyTestGroup --name MyTestVM


