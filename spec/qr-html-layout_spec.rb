require 'qr-bills/qr-html-layout'

RSpec.configure do |config|
  config.before(:each) do
    @params = QRParams.get_qr_params
    @params[:bill_params][:qrcode_filepath] = "#{Dir.pwd}/tmp/qrcode-html.png"
    @params[:bill_params][:creditor][:iban] = "CH9300762011623852957"
    @params[:bill_params][:creditor][:address][:type] = "S"
    @params[:bill_params][:creditor][:address][:name] = "Compagnia di assicurazione forma & scalciante"
    @params[:bill_params][:creditor][:address][:line1] = "Via cantonale"
    @params[:bill_params][:creditor][:address][:line2] = "24"
    @params[:bill_params][:creditor][:address][:postal_code] = "3000"
    @params[:bill_params][:creditor][:address][:town] = "Lugano"
    @params[:bill_params][:creditor][:address][:country] = "CH"
    @params[:bill_params][:amount] = 12345.15
    @params[:bill_params][:currency] = "CHF"
    @params[:bill_params][:debtor][:address][:type] = "S"
    @params[:bill_params][:debtor][:address][:name] = "Foobar Barfoot"
    @params[:bill_params][:debtor][:address][:line1] = "Via cantonale"
    @params[:bill_params][:debtor][:address][:line2] = "25"
    @params[:bill_params][:debtor][:address][:postal_code] = "3001"
    @params[:bill_params][:debtor][:address][:town] = "Comano"
    @params[:bill_params][:debtor][:address][:country] = "CH"
    @params[:bill_params][:reference] = "RF89MTR81UUWZYO48NY55NP3"
    @params[:bill_params][:reference_type] = "SCOR"
    @params[:bill_params][:additionally_information] = "pagamento riparazione monopattino"
  end

  config.before(:all) do
    FileUtils.mkdir_p "#{Dir.pwd}/tmp/"
  end
end


RSpec.describe "QRHTMLLayout" do
  describe "layout generation" do
    it "generates successfully the html layout + qr code" do
      expect{layout = QRHTMLLayout.create(@params)}.not_to raise_error

      # to test the result "manually"
      IO.binwrite("#{Dir.pwd}/tmp/html-layout.png", layout.to_s)
    end
  end
end