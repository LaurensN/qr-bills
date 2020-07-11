[![Build Status](https://travis-ci.com/damoiser/qr-bills.svg?branch=master)](https://travis-ci.com/damoiser/qr-bills)

QR-Bills gem for implementing swiss payements.

## Notes
Please note that **no checks are peformed to validate IBAN and references (like Creditor Reference)**.
These checks are required to be perfomed by the running application.

## Installation
```
gem install qr-bills
```
## Usage

```
# get the QR Params
params = QRBills.get_qr_params

# fill the params, for example
params[:qrcode_filepath] = "#{Dir.pwd}/tmp/qrcode-html.png"
params[:bill_params][:creditor][:iban] = "CH93 0076 2011 6238 5295 7"
params[:bill_params][:creditor][:address][:type] = "S"
params[:bill_params][:creditor][:address][:name] = "Compagnia di assicurazione forma & scalciante"
params[:bill_params][:creditor][:address][:line1] = "Via cantonale"
params[:bill_params][:creditor][:address][:line2] = "24"
params[:bill_params][:creditor][:address][:postal_code] = "3000"
params[:bill_params][:creditor][:address][:town] = "Lugano"
params[:bill_params][:creditor][:address][:country] = "CH"
params[:bill_params][:amount] = 12345.15
params[:bill_params][:currency] = "CHF"
params[:bill_params][:debtor][:address][:type] = "S"
params[:bill_params][:debtor][:address][:name] = "Foobar Barfoot"
params[:bill_params][:debtor][:address][:line1] = "Via cantonale"
params[:bill_params][:debtor][:address][:line2] = "25"
params[:bill_params][:debtor][:address][:postal_code] = "3001"
params[:bill_params][:debtor][:address][:town] = "Comano"
params[:bill_params][:debtor][:address][:country] = "CH"
params[:bill_params][:reference] = "RF89MTR81UUWZYO48NY55NP3"
params[:bill_params][:reference_type] = "SCOR"
params[:bill_params][:additionally_information] = "pagamento riparazione monopattino"

# generate the QR Bill
bill = QRBills.new(params)

# bill format is given in the params, standard is html
# bill has the following format: 
#    bill = { 
#      params: params,
#      output: "output" 
#    }

```

## References
* https://www.paymentstandards.ch/dam/downloads/ig-qr-bill-en.pdf
* https://www.paymentstandards.ch/en/shared/know-how/faq/qr.html
* https://www.kmu.admin.ch/kmu/it/home/consigli-pratici/questioni-finanziarie/contabilita-e-revisione/introduzione-della-qr-fattura.html
* https://www.paymentstandards.ch/dam/downloads/drehbuch-rechnung-steller-empfaenger-it.pdf

## TODO

* add "empty" QR-Bill
* improve tests
* add other outputs formats
* improve params validations

## License
MIT