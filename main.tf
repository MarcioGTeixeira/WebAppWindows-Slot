terraform{
  backend"azurerm"{}
}

provider "azurerm" {
  features {}

}

module "webapp" {
  source     = "./modules/webapp/infra"
  rg         = "rg-name-ambiente"
  location   = "brazilsouth"
  plan       = "service-plan-ambiente"
  os_type    = "Windows"
  sku_name   = "P1v2"
  appservice = "appservice-name-ambiente"
  slot_name  = "slot-name-ambiente"
  tags = {
    Name     = "terraform-"
    Ambiente = "dev"
  }

}

