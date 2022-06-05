$locationHome = "West Europe"

Get-AzVMImagePublisher -Location $locationHome | Select-Object PublisherName

$pubName = "Canonical"

Get-AzVMImageOffer -Location $locationHome -PublisherName $pubName | select Offer

$offerName = "UbuntuServer"

Get-AzVMImageSku -Location $locationHome -PublisherName $pubName -Offer $offerName | select Skus

$sku = "19_10-daily-gen2"


Get-AzVMImage -Location $locationHome -PublisherName $pubName -Offer $offerName -Skus $sku