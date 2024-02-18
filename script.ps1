Invoke-WebRequest -UseBasicParsing -Uri "https://www.ura.gov.sg/property-market-information/pmiSearchResidentialStatisticsforNonLandedPrivateResidentialPropertiesDownload" `
    > -Method "POST" `
    > -WebSession $session `
    > -Headers @{
    > "Accept"="text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7"
    >   "Accept-Encoding"="gzip, deflate, br"
    >   "Accept-Language"="en-GB,en;q=0.9,en-US;q=0.8,fr;q=0.7,de;q=0.6"
    >   "Cache-Control"="max-age=0"
    >   "Origin"="https://www.ura.gov.sg"
    >   "Referer"="https://www.ura.gov.sg/property-market-information/pmiResidentialRentalStatisticsForNonLanded"
    >   "Sec-Fetch-Dest"="document"
    >   "Sec-Fetch-Mode"="navigate"
    >   "Sec-Fetch-Site"="same-origin"
    >   "Sec-Fetch-User"="?1"
    >   "Upgrade-Insecure-Requests"="1"
    >   "sec-ch-ua"="`"Not A(Brand`";v=`"99`", `"Microsoft Edge`";v=`"121`", `"Chromium`";v=`"121`""
    >   "sec-ch-ua-mobile"="?0"
    >   "sec-ch-ua-platform"="`"Windows`""
    > 
} `
    > -ContentType "application/x-www-form-urlencoded" `
    > -Body "resultPerPage=20&displayResult=true&displayResultHeader=true&loadAnalysis=true&displayAnalysis=false&displayChart=true&displayAnalysisFilters=true&dashboardDisplay=false&panelNo=&panelId=&panelName=&locationDetails=%5B%22postalDistrict%22%2C%22D03+%2F+Queenstown%2C+Tiong+Bahru%22%5D&refQuarter=2008Q4&page=0&gotoPage=1&tableDisplay=collapseColumn&sortBy=2&sortAsc=1&downloadType=downloadCSV&selectColumn=1&selectColumn=2&selectColumn=3&selectColumn=4&selectColumn=5&selectColumn=6&_selectColumn=1&_csrf=f2388a18-6d81-4d5c-8bc8-26e60ce2279f" -OutFile d3_2008Q4.csv
