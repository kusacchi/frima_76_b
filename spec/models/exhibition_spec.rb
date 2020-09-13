require 'rails_helper'

RSpec.describe Exhibition, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  
  describe '#create' do

    it "nameが空ならNG" do
      exhibition = build(:exhibition, name: nil)
      exhibition.valid?
      expect(exhibition.errors[:name]).to include("を入力してください")
    end

    it "explanatoryが空ならNG" do
      exhibition = build(:exhibition, explanatory: nil)
      exhibition.valid?
      expect(exhibition.errors[:explanatory]).to include("を入力してください")
    end

    it "costが空ならNG" do
      exhibition = build(:exhibition, cost: nil)
      exhibition.valid?
      expect(exhibition.errors[:cost]).to include("を入力してください")
    end

    it "prefecture_codeが空ならNG" do
      exhibition = build(:exhibition, prefecture_code: nil)
      exhibition.valid?
      expect(exhibition.errors[:prefecture_code]).to include("を入力してください")
    end

    it "dayが空ならNG" do
      exhibition = build(:exhibition, day: nil)
      exhibition.valid?
      expect(exhibition.errors[:day]).to include("を入力してください")
    end

    it "priceが空ならNG" do
      exhibition = build(:exhibition, price: nil)
      exhibition.valid?
      expect(exhibition.errors[:price]).to include("を入力してください")
    end

    it "user_idが空ならNG" do
      exhibition = build(:exhibition, user_id: nil)
      exhibition.valid?
      expect(exhibition.errors[:user_id]).to include("を入力してください")
    end

    it "category_idが空ならNG" do
      exhibition = build(:exhibition, category_id: nil)
      exhibition.valid?
      expect(exhibition.errors[:category_id]).to include("を入力してください")
    end

    it "statusが空ならNG" do
      exhibition = build(:exhibition, status: nil)
      exhibition.valid?
      expect(exhibition.errors[:status]).to include("を入力してください")
    end


    it "imageが空ならNG" do
      image = build(:image, image: nil)
      image.valid?
      expect(image.errors[:image]).to include("を入力してください")
    end

  end
end
