==================================================================================
|| *** Hướng dẫn thêm "Run with PowerShell (Admin)" vào chuột phải để chạy		   || 
|| 	   file .ps1 với quyền admin.												                         ||
|| *** Chạy từng lệnh phía dưới 1 để thực hiện									                 ||
|| *** Rất tiếc vì sự bất tiện này, nhưng tôi chưa tìm được cách để để đưa 		   ||
|| 	   các tập hợp lệnh này vào file Tools.ps1. 								                 ||
===================================================================================

New-PSDrive HKCR Registry HKEY_CLASSES_ROOT

New-Item 'HKCR:\Microsoft.PowerShellScript.1\Shell\Run with PowerShell (Admin)'

New-Item 'HKCR:\Microsoft.PowerShellScript.1\Shell\Run with PowerShell (Admin)\Command'

Set-ItemProperty 'HKCR:\Microsoft.PowerShellScript.1\Shell\Run with PowerShell (Admin)\Command' '(Default)' '"C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" "-Command" ""& {Start-Process PowerShell.exe -ArgumentList ''-ExecutionPolicy RemoteSigned -File \"%1\"'' -Verb RunAs}"'

