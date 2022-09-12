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

Create root certificate

```powershell
"C:\Program Files (x86)\Windows Kits\10\bin\10.0.22000.0\x64\makecert.exe" -n "CN=PowerShell Local Certificate Root" -a sha256 -eku 1.3.6.1.5.5.7.3.3 -r -sv root.pvk root.cer -ss Root -sr localMachine
```

Create signing certificate

```powershell
"C:\Program Files (x86)\Windows Kits\10\bin\10.0.22000.0\x64\makecert.exe" -pe -n "CN=PowerShell User" -ss MY -a sha256 -eku 1.3.6.1.5.5.7.3.3 -iv root.pvk -ic root.cer
```

Sign your profile

```powershell
 Set-AuthenticodeSignature "$Home\Documents\WindowsPowerShell\Profile.ps1" @(Get-ChildItem cert:\CurrentUser\My -codesign)[0]
```
