require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do 
    @purchase = build(:purchase)
  end
      it "addressが空だとNG" do
        @purchase.address = ""
        expect(@purchase.valid?).to eq(false)
      end

      it "cityが空だとNG" do
        @purchase.city = ""
        expect(@purchase.valid?).to eq(false)
      end

      it "user_idが空だとNG" do
        @purchase.user_id = ""
        expect(@purchase.valid?).to eq(false)
      end

      it "prefecture_codeが空だとNG" do
        @purchase.prefecture_code = ""
        expect(@purchase.valid?).to eq(false)
      end


      it "post_codeが空だとNG" do
        @purchase.post_code = ""
        expect(@purchase.valid?).to eq(false)
      end
end
