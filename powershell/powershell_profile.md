# Powershell Profile 

## Git Functions

```powerhsell
# $Home\Documents\WindowsPowerShell\Profile.ps1
# $Home\Documents\PowerShell\Profile.ps1

function gitwip
{
  git status
  git add -u
  git commit -m wip
  git push
}

function gitfix
{
  git status
  git add -u
  git commit -m fix
  git push
}

```

## PowerShell Profile Signing

1. Create root certificate

```powershell
"C:\Program Files (x86)\Windows Kits\10\bin\10.0.22000.0\x64\makecert.exe" -n "CN=PowerShell Local Certificate Root" -a sha256 -eku 1.3.6.1.5.5.7.3.3 -r -sv root.pvk root.cer -ss Root -sr localMachine
```

2. Create signing certificate

```powershell
"C:\Program Files (x86)\Windows Kits\10\bin\10.0.22000.0\x64\makecert.exe" -pe -n "CN=PowerShell User" -ss MY -a sha256 -eku 1.3.6.1.5.5.7.3.3 -iv root.pvk -ic root.cer
```

3. Sign PowerShell profile

```powershell
Set-AuthenticodeSignature "$Home\Documents\WindowsPowerShell\Profile.ps1" @(Get-ChildItem cert:\CurrentUser\My -codesign)[0]
# or
Set-AuthenticodeSignature "$Home\Documents\PowerShell\Profile.ps1" @(Get-ChildItem cert:\CurrentUser\My -codesign)[0]
```

## Alternative way for Profile Signing

1. Generate certificate

```powershell
$cert = New-SelfSignedCertificate -DnsName "$env:USERNAME" -FriendlyName "MyCodeSigningCertificate" -CertStoreLocation "cert:\CurrentUser\My" -Type CodeSigningCert -NotAfter (Get-Date).AddYears(10)
```

2. Export certificate

```powershell
Export-PfxCertificate -Cert $cert -FilePath "$env:USERPROFILE\my_certificate.pfx" -Password (ConvertTo-SecureString -String "YourPassword" -Force -AsPlainText)
```

3. Install certificate

```powershell
Import-PfxCertificate -FilePath "$env:USERPROFILE\my_certificate.pfx" -CertStoreLocation Cert:\CurrentUser\Root -Password (ConvertTo-SecureString -String "YourPassword" -Force -AsPlainText)
```

4. Initially, and whenever code is modified, re-sign with:

```powershell
Set-AuthenticodeSignature -FilePath "$HOME\Documents\PowerShell\Profile.ps1" (Get-ChildItem Cert:\CurrentUser\My\<your-certificate-ID>)
# or
Set-AuthenticodeSignature -FilePath "$HOME\Documents\WindowsPowerShell\Profile.ps1" (Get-ChildItem Cert:\CurrentUser\My\<your-certificate-ID>)
```
