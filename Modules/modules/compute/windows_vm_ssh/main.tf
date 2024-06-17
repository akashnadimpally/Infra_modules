resource "azurerm_windows_virtual_machine" "win_vm" {
  count = var.vm_count
  name                = "${var.windows_vm_name}${count.index}"
  resource_group_name = var.rg_name
  location            = var.location_name
  size                = var.size_name
  admin_username      = var.admin_user
  admin_password      = var.admin_pass
  network_interface_ids = [var.nic_id[count.index],]

  os_disk {
    caching              = var.cache_os_disk
    storage_account_type = var.storage_acc_type_os_disk
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = var.src_image_ref_sku_name
    version   = "latest"
  }

  identity {
    type         = var.identity_type
    identity_ids = [(var.identity_type == "UserAssigned" || var.identity_type == "SystemAssigned, UserAssigned") ? var.uami_ids : null]
  }
}

resource "azurerm_virtual_machine_extension" "winrRMAnsible" {
  count                = var.vm_count
  name                 = "hostname-${count.index}"
  virtual_machine_id   = azurerm_windows_virtual_machine.win_vm[count.index].id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"

  settings = <<SETTINGS
    {
    "commandToExecute": "powershell -ExecutionPolicy Unrestricted -File /Users/akash/Desktop/Alpha/tf_modules/scripts/ConfigureRemotingForAnsibleWindows.ps1"
    }
  SETTINGS
}

resource "azurerm_virtual_machine_extension" "python" {
  count                = var.vm_count
  name                 = "phostname-${count.index}"
  virtual_machine_id   = azurerm_windows_virtual_machine.win_vm[count.index].id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"

  settings = <<SETTINGS
    {
        "commandToExecute": "iwr -Uri https://www.python.org/ftp/python/3.9.7/python-3.9.7-amd64.exe -OutFile $env:TEMP\\python-installer.exe; Start-Process -FilePath $env:TEMP\\python-installer.exe -ArgumentList '/quiet InstallAllUsers=1 PrependPath=1' -Wait -PassThru"
    }
SETTINGS
depends_on = [ azurerm_virtual_machine_extension.winrRMAnsible ]
}

# resource "azurerm_virtual_machine_extension" "ssh" {
#   count                = var.vm_count
#   name                 = "hostname-${count.index}"
#   virtual_machine_id   = azurerm_windows_virtual_machine.win_vm[count.index].id
#   publisher            = "Microsoft.Compute"
#   type                 = "CustomScriptExtension"
#   type_handler_version = "1.9"

#   settings = <<SETTINGS
#     {
#         "commandToExecute": "powershell.exe -Command \"Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0; Start-Service sshd; Set-Service -Name sshd -StartupType Automatic; New-Item -Path C:\\Users\\adminuser\\.ssh -ItemType Directory -Force; $publicKey = 'AAAAB3NzaC1yc2EAAAADAQABAAACAQCdIfqNt1rwoOiQ+55b00ldDVK4n5JayLeuACHADEeeQAGRImIpGHIxRB8I57tYFbKIz/jq/0hpW7guKQuvJYoIUDZdaQVMjXpGl35l2QCpfmpph4iyfa3Ir/1psyG3b3bT+F764PuBBUT/Go89GvmMk45XdMX1QTdWqTybrzN1VLVYGaYYMxo3LOydSi3lsKeIVyz1/T38muj4PpyVGWFUkJIkwpzebgcfgdxXv1T/9XmwHC189mTG6/3p/YCPzHrgZ+rS1MDXrU0NNZBtMj/UIClZeYS/Of8PPYwNK2JE+Wv5pBhFcg8OKgJ0n8fPOAI91Ye1soprbDpYQHCGSSrOjbpVstKXsZ60/lQz8ut92RCqoEdUzf507GPGSwouiQmfc/7cP9+CyL3ZeXTM/xr6SeRvjPGI81+fix2GLXAIUQRTWJZcJmQEdyMr7BhsYdJud4TozMIWJbaLqgvRt8ILUAWjZ+Uo4k83M9qAsmb3DvKlovWMIaObtlFGN/iplQ3i4koMSl9Kpw04GDdoqxWq5pM8+M/TLruDZIp8QpYG+h41zgrjCO1J9jHHGFx6ifXkFSyXYb61R4pqxuRLVF/e5gFmyy8RW+ZlpXNk0Cui9vN0ublhHfiR6EXfo6RDA7unwhs4NX4ZvSKhdKTzd/e9buDSwronvL4B1nVkWk6+IQ== root@Akashs-Air.lan'; Set-Content -Path C:\\Users\\adminuser\\.ssh\\authorized_keys -Value $publicKey; New-NetFirewallRule -Name sshd -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22\""
#     }
# SETTINGS

# }

# resource "azurerm_virtual_machine_extension" "ssh" {
#   count                = var.vm_count
#   name                 = "hostname-${count.index}"
#   virtual_machine_id   = azurerm_windows_virtual_machine.win_vm[count.index].id
#   publisher            = "Microsoft.Compute"
#   type                 = "CustomScriptExtension"
#   type_handler_version = "1.9"

#   settings = <<SETTINGS
#     {
#         "commandToExecute": "powershell.exe -Command \"Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0; Start-Service sshd; Set-Service -Name sshd -StartupType Automatic; New-Item -Path C:\\Users\\adminuser\\.ssh -ItemType Directory -Force; $publicKey = 'AAAAB3NzaC1yc2EAAAADAQABAAACAQCdIfqNt1rwoOiQ+55b00ldDVK4n5JayLeuACHADEeeQAGRImIpGHIxRB8I57tYFbKIz/jq/0hpW7guKQuvJYoIUDZdaQVMjXpGl35l2QCpfmpph4iyfa3Ir/1psyG3b3bT+F764PuBBUT/Go89GvmMk45XdMX1QTdWqTybrzN1VLVYGaYYMxo3LOydSi3lsKeIVyz1/T38muj4PpyVGWFUkJIkwpzebgcfgdxXv1T/9XmwHC189mTG6/3p/YCPzHrgZ+rS1MDXrU0NNZBtMj/UIClZeYS/Of8PPYwNK2JE+Wv5pBhFcg8OKgJ0n8fPOAI91Ye1soprbDpYQHCGSSrOjbpVstKXsZ60/lQz8ut92RCqoEdUzf507GPGSwouiQmfc/7cP9+CyL3ZeXTM/xr6SeRvjPGI81+fix2GLXAIUQRTWJZcJmQEdyMr7BhsYdJud4TozMIWJbaLqgvRt8ILUAWjZ+Uo4k83M9qAsmb3DvKlovWMIaObtlFGN/iplQ3i4koMSl9Kpw04GDdoqxWq5pM8+M/TLruDZIp8QpYG+h41zgrjCO1J9jHHGFx6ifXkFSyXYb61R4pqxuRLVF/e5gFmyy8RW+ZlpXNk0Cui9vN0ublhHfiR6EXfo6RDA7unwhs4NX4ZvSKhdKTzd/e9buDSwronvL4B1nVkWk6+IQ== root@Akashs-Air.lan'; Set-Content -Path C:\\Users\\adminuser\\.ssh\\authorized_keys -Value $publicKey; New-NetFirewallRule -Name sshd -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22\""
#     }
# SETTINGS

# }

# resource "azurerm_virtual_machine_extension" "python" {
#   count                = var.vm_count
#   name                 = "phostname-${count.index}"
#   virtual_machine_id   = azurerm_windows_virtual_machine.win_vm[count.index].id
#   publisher            = "Microsoft.Compute"
#   type                 = "CustomScriptExtension"
#   type_handler_version = "1.9"

#   settings = <<SETTINGS
#     {
#         "commandToExecute": "iwr -Uri https://www.python.org/ftp/python/3.9.7/python-3.9.7-amd64.exe -OutFile $env:TEMP\\python-installer.exe; Start-Process -FilePath $env:TEMP\\python-installer.exe -ArgumentList '/quiet InstallAllUsers=1 PrependPath=1' -Wait -PassThru"
#     }
# SETTINGS
# depends_on = [ azurerm_virtual_machine_extension.ssh ]
# }

# Replace `your_public_ssh_key` with your actual SSH public key.


/* resource "azurerm_virtual_machine_extension" "win_vm_ext" {
  name                 = "IIS"
  virtual_machine_id   = azurerm_windows_virtual_machine.win_vm.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"

  settings = <<SETTINGS
    {
      "commandToExecute" : "powershell Install-WindowsFeature -name Web-Server,Web-Asp-Net45,NET-Framework-Features -IncludeManagementTools"
    }
  SETTINGS

} */

/* resource "azurerm_virtual_machine_extension" "win_vm_ext2" {
  name                 = "DeploymentGroup"
  virtual_machine_id   = azurerm_windows_virtual_machine.win_vm.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"

  settings = <<SETTINGS
  {
    "fileUris": ["https://gitlab.com/rohit104/summer2023_akashnadimpally_azure_terraform/-/raw/main/scripts/ADO_DG.ps1?ref_type=heads"],
    "commandToExecute": "powershell -ExecutionPolicy Unrestricted -File ADO_DG.ps1"
  }
  SETTINGS

  depends_on = [ azurerm_virtual_machine_extension.win_vm_ext ]
}
 */




