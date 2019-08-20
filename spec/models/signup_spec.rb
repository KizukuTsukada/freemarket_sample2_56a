require 'rails_helper'

describe User do
  describe '#registration' do
    it "nicknameが空だと登録できない" do
      user = new(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to.include("入力してください")
    end

    it "emailが空だと登録できない" do
      user = new(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to.include("入力してください")
    end

    it "passwordが空だと登録できない" do
      user = new(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to.include("入力してください")
    end

    it "password_confirmationが空だと登録できない" do
      user = new(:user, password_confirmation: nil)
      user.valid?
      expect(user.errors[:password_confirmation]).to.include("入力してください")
    end
  end
end


describe Profile do
  describe '#registration' do
    it "family_name_kanjiが空だと登録できない" do
      user = new(:profile, family_name_kanji: nil)
      user.valid?
      expect(user.errors[:family_name_kanji]).to.include("入力してください")
    end

    it "family_name_kanaが空だと登録できない" do
      user = new(:profile, family_name_kana: nil)
      user.valid?
      expect(user.errors[:family_name_kana]).to.include("入力してください")
    end

    it "birth_yearが空だと登録できない" do
      user = new(:profile, birth_year: nil)
      user.valid?
      expect(user.errors[:birth_year]).to.include("入力してください")
    end

    it "birth_monthが空だと登録できない" do
      user = new(:profile, birth_month: nil)
      user.valid?
      expect(user.errors[:birth_month]).to.include("入力してください")
    end

    it "birth_dayが空だと登録できない" do
      user = new(:profile, birth_day: nil)
      user.valid?
      expect(user.errors[:birth_day]).to.include("入力してください")
    end
  end


  describe '#sms_confirmation' do
    it "phone_numberが空だと登録できない" do
      user = new(:profile, phone_number: nil)
      user.valid?
      expect(user.errors[:phone_number]).to.include("入力してください")
    end
  end


  describe '#delivery_address' do
    it "postal_codeが空だと登録できない" do
      user = new(:profile, postal_code: nil)
      user.valid?
      expect(user.errors[:postal_code]).to.include("入力してください")
    end

    it "prefecturesが空だと登録できない" do
      user = new(:profile, prefectures: nil)
      user.valid?
      expect(user.errors[:prefectures]).to.include("入力してください")
    end

    it "cityが空だと登録できない" do
      user = new(:profile, city: nil)
      user.valid?
      expect(user.errors[:city]).to.include("入力してください")
    end

    it "address1が空だと登録できない" do
      user = new(:profile, address1: nil)
      user.valid?
      expect(user.errors[:address1]).to.include("入力してください")
    end
  end
end