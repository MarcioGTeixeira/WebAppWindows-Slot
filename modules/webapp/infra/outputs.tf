output "app_url" {
  value =azurerm_windows_web_app.appservice.default_hostname
}

output "app_slot" {
  value = azurerm_windows_web_app_slot.slot.default_hostname
  
}