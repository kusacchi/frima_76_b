require 'rails_helper'

RSpec.describe User, type: :model do
  before do 
    @user = build(:user)
  end

    it "nicknameが空だとNG" do
      @user.nickname = ""
      expect(@user.valid?).to eq(false)
    end

    it 'emailが空だとNG' do
      @user.email = ''
      expect(@user.valid?).to eq(false)
    end

    it "emailに@がないとNG" do
      @user.email = "user.ac.jp"
      expect(@user.valid?).to eq(false)
    end

    it "emailに.がないとNG" do
      @user.email = "user@acjp"
      expect(@user.valid?).to eq(false)
    end

    it "emailが重複しているとNG" do
      @user.email = "hiro@example.com"
      @user.valid?
      expect(@user.errors[:email])
    end

    it "passwordがないとNG" do
      @user.password = ""
      expect(@user.valid?).to eq(false)
    end

    it "passwordが6文字以下だとNG" do
      @user.password = "passwo"
      expect(@user.valid?).to eq(false)
    end


    it "birthdayが空だとNG" do
      @user.birthday = ""
      expect(@user.valid?).to eq(false)
    end

    it "first_nameが空だと登録できない" do
      @user.first_name = ""
      expect(@user.valid?).to eq(false)
    end

    it "family_nameが空だと登録できない" do
      @user.family_name = ""
      expect(@user.valid?).to eq(false)
    end

    it "first_name_kanaが空だと登録できない" do
      @user.first_name_kana = ""
      expect(@user.valid?).to eq(false)
    end

    it "family_name_kanaが空だと登録できない" do
      @user.family_name_kana = ""
      expect(@user.valid?).to eq(false)
    end

end


