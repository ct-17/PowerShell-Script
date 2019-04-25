$path = pwd
$choices = [System.Management.Automation.Host.ChoiceDescription[]] @("&Y","&N")
while ($true){
    Write-Host "0. Thoat."
    Write-Host "1. Tat May."
    Write-Host "2. Xem Mat khau wifi."
    Write-Host "3. Xem dia chi ip may minh."
    Write-Host "4. Khoi phuc may tinh ve mac dinh."
    Write-Host "5. Chan trang web bat ki."
    Write-Host "6. Sua loi Wifi bi cham than vang."
    Write-Host "======================================================================================"
    $all = Read-Host -Prompt 'Nhap vao tuy chin cua ban'
    Write-Host "======================================================================================"

    if ($all -eq 0){
        exit    
    }
    elseif ($all -eq 1){
        $phut = Read-Host -Prompt 'Nhap so phut'
        $giay = [int]($phut)*60
        Write-Host "======================================================================================"
        shutdown -s -f -t $giay
        Write-Host "May se tat sau $phut phut nua... "
        
    }
    elseif ($all -eq 2){
        (netsh wlan show profiles) | Select-String “\:(.+)$” | %{$name=$_.Matches.Groups[1].Value.Trim(); $_} | %{(netsh wlan show profile name=”$name” key=clear)} | Select-String “Key Content\W+\:(.+)$” | %{$pass=$_.Matches.Groups[1].Value.Trim(); $_} | %{[PSCustomObject]@{ PROFILE_NAME=$name;PASSWORD=$pass }} | Format-Table -AutoSize
        }
    elseif ($all -eq 3){
        (Get-WmiObject -Class Win32_NetworkAdapterConfiguration -Filter 'ipenabled = "true"').IPAddress
    }
    elseif ($all -eq 4){
        systemreset -cleanpc
    }
    elseif ($all -eq 5){
	$user = $env:UserName
	$file_host = "$env:windir\System32\drivers\etc\hosts"
        $website = Read-Host -Prompt 'Nhap ten trang web(vd: facebook.com)'
	if ($website -eq "facebook.com"){
		$text = "127.0.0.1 facebook.com `n127.0.0.1 www.facebook.com `n127.0.0.1 login.facebook.com `n127.0.0.1 www.login.facebook.com `n 127.0.0.1 fbcdn.net `n127.0.0.1 www.fbcdn.net `n127.0.0.1 fbcdn.com `n127.0.0.1 www.fbcdn.com `n127.0.0.1 static.ak.fbcdn.net `n127.0.0.1 static.ak.connect.facebook.com `n127.0.0.1 connect.facebook.net `n127.0.0.1 www.connect.facebook.net `n127.0.0.1 apps.facebook.com `n::1 facebook.com `n::1 www.facebook.com `n::1 login.facebook.com `n::1 www.login.facebook.com `n::1 fbcdn.net `n::1 www.fbcdn.net `n::1 fbcdn.com `n::1 www.fbcdn.com `n::1 static.ak.fbcdn.net `n::1 static.ak.connect.facebook.com `n::1 connect.facebook.net `n::1 www.connect.facebook.net `n::1 apps.facebook.com `n::1 edge-star6-shv-02-ams2.facebook.com"
	}
	elseif ($website -eq "youtube.com"){
		$text = "0.0.0.0	host.youtube.com `n0.0.0.0	mx.youtube.com `n0.0.0.0	admin.youtube.com `n0.0.0.0	devel.youtube.com `n0.0.0.0	stats.youtube.com `n0.0.0.0	http.youtube.com `n0.0.0.0	mx0.youtube.com `n0.0.0.0	administration.youtube.com `n0.0.0.0	development.youtube.com `n0.0.0.0	svn.youtube.com `n0.0.0.0	id.youtube.com `n0.0.0.0	mx1.youtube.com `n0.0.0.0	ads.youtube.com `n0.0.0.0	devsql.youtube.com `n0.0.0.0	syslog.youtube.com `n0.0.0.0	adserver.youtube.com `n0.0.0.0	images.youtube.com `n0.0.0.0	mysql.youtube.com `n0.0.0.0	devtest.youtube.com `n0.0.0.0	info.youtube.com `n0.0.0.0	news.youtube.com `n0.0.0.0	alerts.youtube.com `n0.0.0.0	dhcp.youtube.com `n0.0.0.0	test1.youtube.com `n0.0.0.0	internal.youtube.com `n0.0.0.0	noc.youtube.com `n0.0.0.0	alpha.youtube.com `n0.0.0.0	direct.youtube.com `n0.0.0.0	test2.youtube.com `n0.0.0.0	internet.youtube.com `n0.0.0.0	ns.youtube.com `n0.0.0.0	ap.youtube.com `n0.0.0.0	dmz.youtube.com `n0.0.0.0	testing.youtube.com `n0.0.0.0	intra.youtube.com `n0.0.0.0	ns0.youtube.com `n0.0.0.0	apache.youtube.com `n0.0.0.0	dns.youtube.com `n0.0.0.0	upload.youtube.com `n0.0.0.0	intranet.youtube.com `n0.0.0.0	ns1.youtube.com `n0.0.0.0	app.youtube.com `n0.0.0.0	dns0.youtube.com `n0.0.0.0	vm.youtube.com `n0.0.0.0	ipv6.youtube.com `n0.0.0.0	ns2.youtube.com `n0.0.0.0	apps.youtube.com `n0.0.0.0	dns1.youtube.com `n0.0.0.0	vnc.youtube.com `n0.0.0.0	lab.youtube.com `n0.0.0.0	ns3.youtube.com `n0.0.0.0	appserver.youtube.com `n0.0.0.0	dns2.youtube.com `n0.0.0.0	ldap.youtube.com `n0.0.0.0	aptest.youtube.com `n0.0.0.0	download.youtube.com `n0.0.0.0	vpn.youtube.com `n0.0.0.0	linux.youtube.com `n0.0.0.0	ops.youtube.com `n0.0.0.0	auth.youtube.com `n0.0.0.0	en.youtube.com `n0.0.0.0	web.youtube.com `n0.0.0.0	local.youtube.com `n0.0.0.0	oracle.youtube.com `n0.0.0.0	backup.youtube.com `n0.0.0.0	erp.youtube.com `n0.0.0.0	web2test.youtube.com `n0.0.0.0	log.youtube.com `n0.0.0.0	owa.youtube.com `n0.0.0.0	beta.youtube.com `n0.0.0.0	eshop.youtube.com `n0.0.0.0	whois.youtube.com `n0.0.0.0	pbx.youtube.com `n0.0.0.0	blog.youtube.com `n0.0.0.0	exchange.youtube.com `n0.0.0.0	wiki.youtube.com `n0.0.0.0	www.youtube.com `n0.0.0.0	s3.youtube.com `n0.0.0.0	f5.youtube.com `n0.0.0.0	secure.youtube.com `n0.0.0.0	chat.youtube.com `n0.0.0.0	fileserver.youtube.com `n0.0.0.0	www2.youtube.com `n0.0.0.0	server.youtube.com `n0.0.0.0	citrix.youtube.com `n0.0.0.0	firewall.youtube.com `n0.0.0.0	xml.youtube.com `n0.0.0.0	main.youtube.com `n0.0.0.0	shop.youtube.com `n0.0.0.0	cms.youtube.com `n0.0.0.0	forum.youtube.com `n0.0.0.0	manage.youtube.com `n0.0.0.0	sip.youtube.com `n0.0.0.0	corp.youtube.com `n0.0.0.0	mgmt.youtube.com `n0.0.0.0	crs.youtube.com `n0.0.0.0	mirror.youtube.com `n0.0.0.0	sql.youtube.com `n0.0.0.0	cvs.youtube.com `n0.0.0.0	git.youtube.com `n0.0.0.0	mobile.youtube.com `n0.0.0.0	squid.youtube.com `n0.0.0.0	database.youtube.com `n0.0.0.0	gw.youtube.com `n0.0.0.0	help.youtube.com `n0.0.0.0	monitor.youtube.com `n0.0.0.0	ssh.youtube.com `n0.0.0.0	db.youtube.com `n0.0.0.0	mssql.youtube.com `n0.0.0.0	ssl.youtube.com `n0.0.0.0	demo.youtube.com `n0.0.0.0	helpdesk.youtube.com `n0.0.0.0	mta.youtube.com `n0.0.0.0	dev.youtube.com `n0.0.0.0	home.youtube.com `n"
	}
	else{
		$text = "127.0.0.1 $website"
	}
	Add-Content $file_host "$text"
	Write-Host "Da chan thanh cong website: $website " 
    }
    elseif ($all -eq 6){
	Write-Host "Dang xoa DHCP cu..." 
        ( Get-WmiObject -List | Where-Object -FilterScript {$_.Name -eq 'Win32_NetworkAdapterConfiguration'} ).ReleaseDHCPLeaseAll()
	Write-Host "Dang xin lai DHCP moi..." 
	( Get-WmiObject -List | Where-Object -FilterScript {$_.Name -eq 'Win32_NetworkAdapterConfiguration'} ).RenewDHCPLeaseAll()
    }
    $choice = $Host.UI.PromptForChoice("Ban co muon thuoc hien cac lenh khac?","",$choices,0)
    if ( $choice -ne 0 ) {
       break
     }
     cls
}