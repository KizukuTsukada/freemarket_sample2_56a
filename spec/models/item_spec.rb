require 'rails_helper'
describe Item do
  describe '#create' do
    it "nameが空だと登録できない" do
      item = new(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to.include("入力してください")
    end

    it "imageが空だと登録できない" do
      item = new(:image, name: nil)
      item.valid?
      expect(item.errors[:image]).to.include("ファイルを選択してください")
    end

    it "priceが空だと登録できない" do
      item = new(:item, pricd: nil)
      item.valid?
      expect(item.errors[:pice]).to.include("入力してください")
    end

    it "statusが空だと登録できない" do
      item = new(:item, status: nil)
      item.valid?
      expect(item.errors[:status]).to.include("入力してください")
    end

    it "pay_wayを選択しないと登録できない" do
      item = new(:item, pay_way: nil)
      item.valid?
      expect(item.errors[:pay_way]).to.include("選択してください")
    end

    it "deliver_wayを選択しないと登録できない" do
      item = new(:item, deliver_way: nil)
      item.valid?
      expect(item.errors[:deliver_way]).to.include("入力してください")
    end

    it "deliver_dateを選択しないと登録できない" do
      item = new(:item, deliver_date: nil)
      item.valid?
      expect(item.errors[:deliver_date]).to.include("入力してください")
    end

    it "deliver_feeを選択しないと登録できない" do
      item = new(:item, deliver_fee: nil)
      item.valid?
      expect(item.errors[:deliver_fee]).to.include("入力してください")
    end

    it "detailが空だと登録できない" do
      item = new(:item, detail: nil)
      item.valid?
      expect(item.errors[:detail]).to.include("入力してください")
    end

    it "situationを選択しないと登録できない" do
      item = new(:item, situation: nil)
      item.valid?
      expect(item.errors[:situation]).to.include("入力してください")
    end

    it "上記のカラムが全て存在すれば登録できる" do
      item = new(:item)
      expect(item).to be_valid
    end

    it "nameが15文字なら登録できる" do
      item = new(:item, name: "あいうえおあいうえおあいうえお")
      expect(item).to be_valid
    end

    it "nameが15文字なら登録できない" do
      item = new(:item, name: "ああいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえお")
      item.valid?
      expect(item.errors[:name]).to include("は15文字以内で入力してください")
    end

    it "nameが100文字なら登録できる" do
      item = new(:item, name: "あいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえお")
      expect(item).to be_valid
    end

    it "detailが100文字なら登録できない" do
      item = new(:item, detail: "ああいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえお")
      item.valid?
      expect(item.errors[:detail]).to include("は100文字以内で入力してください")
    end

    it "priceが数字でなければ登録できない" do
      item = new(:item, price: "a")
      item.valid?
      expect(item.errors[:price]).to include("数値で入力してください")
    end

    it "priceが99999なら登録できる" do
      item = build(:item, price: 999999)
    expect(item).to be_valid
    end

    it "priceが1000000なら登録できない" do
      item = build(:item, price: 1000000)
      item.valid?
      expect(item.errors[:price]).to include("は999999以下の値にしてください")
    end
  end

  describe Item do
    describe '#edit' do
      it "nameが空だと登録できない" do
        item = new(:item, name: nil)
        item.valid?
        expect(item.errors[:name]).to.include("入力してください")
      end
  
      it "imageが空だと登録できない" do
        item = new(:image, name: nil)
        item.valid?
        expect(item.errors[:image]).to.include("ファイルを選択してください")
      end
  
      it "priceが空だと登録できない" do
        item = new(:item, pricd: nil)
        item.valid?
        expect(item.errors[:pice]).to.include("入力してください")
      end
  
      it "statusが空だと登録できない" do
        item = new(:item, status: nil)
        item.valid?
        expect(item.errors[:status]).to.include("入力してください")
      end
  
      it "pay_wayを選択しないと登録できない" do
        item = new(:item, pay_way: nil)
        item.valid?
        expect(item.errors[:pay_way]).to.include("選択してください")
      end
  
      it "deliver_wayを選択しないと登録できない" do
        item = new(:item, deliver_way: nil)
        item.valid?
        expect(item.errors[:deliver_way]).to.include("入力してください")
      end
  
      it "deliver_dateを選択しないと登録できない" do
        item = new(:item, deliver_date: nil)
        item.valid?
        expect(item.errors[:deliver_date]).to.include("入力してください")
      end
  
      it "deliver_feeを選択しないと登録できない" do
        item = new(:item, deliver_fee: nil)
        item.valid?
        expect(item.errors[:deliver_fee]).to.include("入力してください")
      end
  
      it "detailが空だと登録できない" do
        item = new(:item, detail: nil)
        item.valid?
        expect(item.errors[:detail]).to.include("入力してください")
      end
  
      it "situationを選択しないと登録できない" do
        item = new(:item, situation: nil)
        item.valid?
        expect(item.errors[:situation]).to.include("入力してください")
      end
  
      it "上記のカラムが全て存在すれば登録できる" do
        item = new(:item)
        expect(item).to be_valid
      end
  
      it "nameが15文字なら登録できる" do
        item = new(:item, name: "あいうえおあいうえおあいうえお")
        expect(item).to be_valid
      end
  
      it "nameが15文字なら登録できない" do
        item = new(:item, name: "ああいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえお")
        item.valid?
        expect(item.errors[:name]).to include("は15文字以内で入力してください")
      end
  
      it "nameが100文字なら登録できる" do
        item = new(:item, name: "あいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえお")
        expect(item).to be_valid
      end
  
      it "detailが100文字なら登録できない" do
        item = new(:item, detail: "ああいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえお")
        item.valid?
        expect(item.errors[:detail]).to include("は100文字以内で入力してください")
      end
  
      it "priceが数字でなければ登録できない" do
        item = new(:item, price: "a")
        item.valid?
        expect(item.errors[:price]).to include("数値で入力してください")
      end
  
      it "priceが99999なら登録できる" do
        item = build(:item, price: 999999)
      expect(item).to be_valid
      end
  
      it "priceが1000000なら登録できない" do
        item = build(:item, price: 1000000)
        item.valid?
        expect(item.errors[:price]).to include("は999999以下の値にしてください")
      end
    end
end