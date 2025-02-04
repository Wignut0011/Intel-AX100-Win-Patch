$BT = Get-PnpDevice -FriendlyName "*Intel(R) Wireless Bluetooth(R)*"

if ($BT.Status -ne 'OK'){
	$BT | Disable-PnpDevice -confirm:$false

	$BT | Enable-PnpDevice -confirm:$false
}

# Get-PnpDevice -FriendlyName "*Intel(R) Wireless Bluetooth(R)*" | Disable-PnpDevice -confirm:$false

# Get-PnpDevice -FriendlyName "*Intel(R) Wireless Bluetooth(R)*" | Enable-PnpDevice -confirm:$false
