output "appurl" {
  value = "https://${module.webapp.app_url}"
}

output "appslot" {
  value = "https://${module.webapp.app_slot}"

}