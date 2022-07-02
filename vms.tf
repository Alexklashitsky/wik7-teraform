##########################################################
#                        scale set                       #
########################################################## 
resource "azurerm_virtual_machine_scale_set" "scaleSet" {
  name                = "vmscaleset"
  location            = var.location
  resource_group_name = azurerm_resource_group.week6.name
  upgrade_policy_mode = "Manual"

  sku {
    name     = "Standard_DS1_v2"
    tier     = "Standard"
    capacity = var.vm_count
  }

  storage_profile_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  storage_profile_os_disk {
    name              = ""
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_profile_data_disk {
    lun           = 0
    caching       = "ReadWrite"
    create_option = "Empty"
    disk_size_gb  = 10
  }

  os_profile {
    computer_name_prefix = "vmlab"
    admin_username       = var.admin_user
    admin_password       = var.secret
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  network_profile {
    name    = "terraformnetworkprofile"
    primary = true

    ip_configuration {
      name                                   = "IPConfiguration"
      subnet_id                              = module.network.public_subnet_id
      load_balancer_backend_address_pool_ids = [azurerm_lb_backend_address_pool.backendPool.id]
      primary                                = true
    }
  }

}
########################################################################################
#                                     elastic scale                                    #
########################################################################################
resource "azurerm_monitor_autoscale_setting" "AutoscaleSetting" {
  name                = "myAutoscaleSetting"
  resource_group_name = azurerm_resource_group.week6.name
  location            = var.location
  target_resource_id  = azurerm_virtual_machine_scale_set.scaleSet.id

  profile {
    name = "defaultProfile"

    capacity {
      default = var.vm_count
      minimum = var.vm_count
      maximum = 5

    }

    rule {
      metric_trigger {
        metric_name        = "Percentage CPU"
        metric_resource_id = azurerm_virtual_machine_scale_set.scaleSet.id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "GreaterThan"
        threshold          = 75
        metric_namespace   = "microsoft.compute/virtualmachinescalesets"
        dimensions {
          name     = "AppName"
          operator = "Equals"
          values   = ["App1"]
        }
      }

      scale_action {
        direction = "Increase"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT1M"
      }
    }

    rule {
      metric_trigger {
        metric_name        = "Percentage CPU"
        metric_resource_id = azurerm_virtual_machine_scale_set.scaleSet.id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "LessThan"
        threshold          = 25
      }

      scale_action {
        direction = "Decrease"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT1M"
      }
    }
  }

}

#############################################################################################
#                    Create virtual machine terminal for manging                            #
#############################################################################################
resource "azurerm_linux_virtual_machine" "terminal" {
  name                  = "terminal"
  location              = var.location
  resource_group_name   = azurerm_resource_group.week6.name
  network_interface_ids = [module.network.terminal_net_interface_id]
  size                  = "Standard_F2"
  os_disk {
    name                 = "myOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }


  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  computer_name                   = "terminal"
  admin_username                  = var.admin_user
  admin_password                  = var.secret
  disable_password_authentication = false

}


# resource "azurerm_linux_virtual_machine" "terminal" {
#   name                  = "app"
#   location              = var.location
#   resource_group_name   = azurerm_resource_group.week6.name
#   network_interface_ids = [module.network.terminal_net_interface_id]
#   size                  = "Standard_DS1_v2"
#   os_disk {
#     name                 = "myOsDisk"
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }


#   source_image_reference {
#     publisher = "Canonical"
#     offer     = "UbuntuServer"
#     sku       = "18.04-LTS"
#     version   = "latest"
#   }

#   computer_name                   = "app"
#   admin_username                  = var.admin_user
#   admin_password                  = var.secret
#   disable_password_authentication = false

# }
