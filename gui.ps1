function send_ssh {
    $uname = $txtUname.Text
    $pword = $txtPword.Text
    $rhost = $txtHost.Text

    $lblStatus.Text = "[+] Input Collected"

    plink -ssh $rhost -l $uname -pw $pword sh /simple.sh #you should be able to replace this with the Posh ssh module and get the same results

    $lblStatus.Text = "[+] Process Complete"
}

$plinkpath = "C:\Program Files'\Putty_0.68_x64\plink.exe"
Set-Alias plink $plinkpath

if ($args[0] = "-g") {
    $frmGui = New-Object System.Windows.Forms.Form
    $frmGui.Text = "Simple GUI"
    $frmGui.Width = "300"
    $frmGui.Height = "300"

    $lblUname = New-Object System.Windows.Forms.Label
    $lblUname.Text = "Username"
    $lblUname.Location = "20, 40"
    $lblUname.Size = "50, 20"

    $txtUname = New-Object System.Windows.Forms.TextBox
    $txtUname.Location = "100, 40"
    $txtUname.Size = "200, 20"

    $lblpword = New-Object System.Windows.Forms.Label
    $lblpword.Text = "SSH password"
    $lblpword.Location = "20, 80"
    $lblpword.Size = "50,20"

    $txtPword = New-Object System.Windows.Forms.MaskedTextBox
    $txtPword.PasswordChar = "*"
    $txtPword.Location = "100, 80"
    $txtPword.Size = "200, 20"

    $lblHost = New-Object System.Windows.Forms.Label
    $lblHost.Text = "Remote IP"
    $lblHost.Location = "20, 80"
    $lblHost.Size = "50,20"

    $txtHost = New-Object System.Windows.Forms.TextBox
    $txtHost.Location = "100, 120"
    $txtHost.Size = "200,20"

    $btnOK = New-Object System.Windows.Forms.Button
    $btnOK.Text = "OK"
    $btnOK.Location = "100, 160"
    $btnOK.Size = "100, 50"

    $lblStatus = New-Object System.Windows.Forms.Label
    $lblStatus.Text = "[+] This is where I want output"
    $lblStatus.Location = "10, 200"
    $lblStatus.Size = "300, 20"

    $frmGui.Controls.Add($lblUname)
    $frmGui.Controls.Add($txtUname)
    $frmGui.Controls.Add($lblPword)
    $frmGui.Controls.Add($txtPword)
    $frmGui.Controls.Add($lblHost)
    $frmGui.Controls.Add($txtHost)
    $frmGui.Controls.Add($btnOk)
    $frmGui.Controls.Add($lblStatus)

    $btnOK.Add_Click({Send_ssh})

    $frmGui.ShowDialog()

} else {
    $uname = Read-Host "ssh username"
    $pword = Read-Host "ssh password" -AsSecureString
    $rhost = Read-Host "Remote IP"

    Write-Host "[+] Input Collected"
    plink -ssh $rhost -l $uname -pw $pword sh /simple.sh #you should be able to replace this with the Posh ssh module and get the same results
    Write-Host "[+] Process complete"
}
