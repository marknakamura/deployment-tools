# raleigh issa workshop laptop software
$app_list = "googlechrome", "virtualbox", "notepadplusplus", "winscp", "python"

foreach ( $app in $app_list ) {
        choco install -y $app
}