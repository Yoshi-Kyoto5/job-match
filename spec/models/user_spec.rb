require 'rails_helper'

describe User do
  describe '#create' do
    # 1. name, email, password, password_confirmationが全て存在すれば登録可能
    it "is valid with a name, email, password, password_confirmation" do
      user = build(:user)
      expect(user).to be_valid
    end

    # 2. name＝空＝登録不可
    it "is invalid without a name" do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

    # 3. email＝空＝登録不可
    it "is invalid without an email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    # 4. password＝空＝登録不可
    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    # 5. passwordあり＝password_confirmation＝空＝登録不可
    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    # 6. email重複＝登録不可
    it " is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    # 7. password=６文字以上＝登録可能
    it " is valid with a password that has more than 6 characters" do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user).to be_valid
    end

    # 8. password=５文字以下＝登録不可
    it " is invalid with a password that has less than 5 characters" do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end
  end
end