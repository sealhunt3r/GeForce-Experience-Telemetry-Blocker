# Declare host rules
$nvidiaHosts = @(
	"0.0.0.0 accounts.nvgs.nvidia.cn",
	"0.0.0.0 accounts.nvgs.nvidia.com",
	"0.0.0.0 activation-dc1.gfe.nvidia.com",
	"0.0.0.0 activation.gfe.nvidia.com",
	"0.0.0.0 api.commune.ly",
	"0.0.0.0 assets.nvidiagrid.net",
	"0.0.0.0 dns1.p07.nsone.net",
	"0.0.0.0 dns1.p09.nsone.net",
	"0.0.0.0 dns2.p07.nsone.net",
	"0.0.0.0 dns2.p09.nsone.net",
	"0.0.0.0 dns3.p07.nsone.net",
	"0.0.0.0 dns4.p07.nsone.net",
	"0.0.0.0 events-dc1.gfe.nvidia.com",
	"0.0.0.0 events.gfe.nvidia.com",
	"0.0.0.0 gfe.nvidia.com",
	"0.0.0.0 gfswl.geforce.com",
	"0.0.0.0 gfwsl.geforce.com",
	"0.0.0.0 hqemgate07.nvidia.com",
	"0.0.0.0 hqemgate08.nvidia.com",
	"0.0.0.0 hqemgate09.nvidia.com",
	"0.0.0.0 hqemgate10.nvidia.com",
	"0.0.0.0 images.nvidia.com",
	"0.0.0.0 images.nvidiagrid.net",
	"0.0.0.0 img.nvidiagrid.net",
	"0.0.0.0 login.nvgs.nvidia.cn",
	"0.0.0.0 login.nvgs.nvidia.com",
	"0.0.0.0 ls.dtrace.nvidia.com",
	"0.0.0.0 ns5.dnsmadeeasy.com",
	"0.0.0.0 ns6.dnsmadeeasy.com",
	"0.0.0.0 ns7.dnsmadeeasy.com",
	"0.0.0.0 nvidia.tt.omtrdc.net",
	"0.0.0.0 nvidiahk.nvidia.com",
	"0.0.0.0 ota-downloads.nvidia.com",
	"0.0.0.0 ota.nvidia.com",
	"0.0.0.0 rds-assets.nvidia.com",
	"0.0.0.0 services.gfe.nvidia.com",
	"0.0.0.0 telemetry-dc1.gfe.nvidia.com",
	"0.0.0.0 telemetry-dce.gfe.nvidia.com",
	"0.0.0.0 telemetry.gfe",
	"0.0.0.0 telemetry.gfe.nvidia.com",
    "0.0.0.0 telemetry.nvidia.com"
)

# Set file paths
$file = "C:\Windows\System32\drivers\etc\hosts"
$tempfile = "C:\Windows\System32\drivers\etc\temp_hosts"

# Rename the hosts file to allow writing to it
Rename-Item -Path $file -NewName $tempfile

# Get an array of lines from the hosts file
$hostfile = Get-Content $tempfile

# Loop through our host rules
foreach ($entry in $nvidiaHosts) {
    # Check if our host file contains the rules
    if ($hostfile -notcontains "$entry") {
        # Add the rule to the array if it doesn't
        $hostfile += "$entry"
    }
}

# Write our array to the hosts file
Set-Content -Path $tempfile -Value $hostfile -Force

# Rename the temporary file back to hosts
Move-Item -Path $tempfile -Destination $file -Force
