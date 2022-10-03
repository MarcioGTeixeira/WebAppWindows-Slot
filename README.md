# WebAppWindows-Slot
 ## Módulo de Infraestrutura (iac) Terraform - WebApp Windows Slot - com pipeline de CI em azure DevOps.
 - Módulo WebAppWindows com Slot  
 - para utilizar o módulo, basta apenas trocar os nomes das váriaveis(**rg, location, plan, os_type, sku_name, appservice, slot_name, tags**) no arquivo main.tf do diretório root.
Pode ser utilizado, um arquivo terraform.tfvars para substituição das variavéis sem modificação do código,
conforme exemplo: terraform apply -var-file="terraform.tfvars"
ao final da implantação, temos o output com a url do site e do slot.  

####  descrição
- Pode ser Usado para testar e validar a aplicação, antes de mudar para o ambiente de produção.  
Pode ser usado como um balanceador de carga, separando os users em diferentes ambientes, exemplo: teste , produção.   


### Configuração do arquivo azurepipelines.yaml
A pipeline utiliza um self-hosted agent , podendo ser alterada para utilizar um Microsfot-hosted agents
Obs: Para utilização do BridgeCrew, é necessário ter uma conta criada e referenciar a API Key conforme task, e também pode ser utilizado como módulo, sendo referenciado no arquivo main.tf

module "bridgecrew-read" {
source = "bridgecrewio/bridgecrew-azure-read-only/azure"
org_name = "acme"
bridgecrew_token = "YOUR_TOKEN"
}

A pipeline executa os seguintes Steps:  
instala a última versão do terraform  
inicializa o terraform  
valida as configurações  
instala o python  
instala o BridgeCrew e efetua análise de vulnerabilidade  
publica o módulo em artefato
