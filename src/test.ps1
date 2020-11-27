# [void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")

# $objNotifyIcon = New-Object System.Windows.Forms.NotifyIcon 

# $objNotifyIcon.Icon = "E:\git_project\yuanliwei.github.io\favicon.ico"
# $objNotifyIcon.BalloonTipIcon = "Error" 
# $objNotifyIcon.BalloonTipText = "A file needed to complete the operation could not be found." 
# $objNotifyIcon.BalloonTipTitle = "File Not Found"
# $objNotifyIcon.Visible = $True 
# $objNotifyIcon.ShowBalloonTip(1)

# [powershell脚本创建Windows 10通知，弹出后它会消失](https://www.thinbug.com/q/39344752)
# param([String]$prodName)    
# [Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] > $null
# [Windows.UI.Notifications.ToastNotification, Windows.UI.Notifications, ContentType = WindowsRuntime] > $null
# [Windows.Data.Xml.Dom.XmlDocument, Windows.Data.Xml.Dom.XmlDocument, ContentType = WindowsRuntime] > $null

# $ToastTemplate = '
# <toast launch="app-defined-string">
#     <visual>
#         <binding template="ToastGeneric">
#             <text>'+$prodName+'</text>
#         </binding>
#     </visual>
# </toast>'

# Write-Output $ToastTemplate;

# $currTime = (Get-Date).AddSeconds(10);
# "currTime : " + $currTime

# $xml = New-Object Windows.Data.Xml.Dom.XmlDocument
# $xml.LoadXml($toastXml.OuterXml)

# $schedNotification = New-Object Windows.UI.Notifications.ToastNotification($xml)
# $schedNotification.SuppressPopup = $True
# $notifier = [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier($prodName)
# $notifier.Show($schedNotification)

# $schedNotification = New-Object Windows.UI.Notifications.ScheduledToastNotification($xml, $currTime)
# $notifier.AddToSchedule($schedNotification)









# [Generating Windows 10 Notifications With PowerShell](https://den.dev/blog/powershell-windows-notification/)
function Show-Notification {
    [cmdletbinding()]
    Param (
        [string]
        $ToastTitle,
        [string]
        [parameter(ValueFromPipeline)]
        $ToastText
    )

    [Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] > $null
    $Template = [Windows.UI.Notifications.ToastNotificationManager]::GetTemplateContent([Windows.UI.Notifications.ToastTemplateType]::ToastText02)

    $RawXml = [xml] $Template.GetXml()
    ($RawXml.toast.visual.binding.text|where {$_.id -eq "1"}).AppendChild($RawXml.CreateTextNode($ToastTitle)) > $null
    ($RawXml.toast.visual.binding.text|where {$_.id -eq "2"}).AppendChild($RawXml.CreateTextNode($ToastText)) > $null

    $SerializedXml = New-Object Windows.Data.Xml.Dom.XmlDocument
    $SerializedXml.LoadXml($RawXml.OuterXml)

    $Toast = [Windows.UI.Notifications.ToastNotification]::new($SerializedXml)
    $Toast.Tag = "PowerShell"
    $Toast.Group = "PowerShell"
    $Toast.ExpirationTime = [DateTimeOffset]::Now.AddMinutes(1)

    $Notifier = [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier("PowerShell")
    $Notifier.Show($Toast);
}
