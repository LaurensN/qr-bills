require 'qr-bills'

RSpec.describe QRBills do
  describe "init" do
    it "raise an exception if the bill kind is not set" do
      expect{QRBills.new({})}.to raise_error("QR-bill invalid parameters: bill type param not set")
    end
  
    it "raise an exception if the bill kind is not valid" do
      expect{QRBills.new({bill_type: "bad"})}.to raise_error("QR-bill invalid parameters: invalid parameters")
    end
  end
end