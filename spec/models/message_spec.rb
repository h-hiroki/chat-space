require 'rails_helper'

describe Message do

  describe '#create' do

    it "is valid with a body" do
      message = build(:message, image: "")
      expect(message).to be_valid
    end

    it "is valid with a image" do
      message = build(:message, body: "")
      expect(message).to be_valid
    end

    it "is valid with a body and image" do
      message = build(:message)
      expect(message).to be_valid
    end

    it "is valid without a body and image" do
      message = build(:message, body: "", image: "")
      message.valid?
      expect(message.errors[:body_or_image][0]).to include("入力してください")
    end

    it "is valid without a group_id" do
      message = build(:message, group_id: "")
      message.valid?
      expect(message.errors[:group][0]).to include("入力してください")
    end

    it "is valid without a user_id" do
      message = build(:message, user_id: "")
      message.valid?
      expect(message.errors[:user][0]).to include("入力してください")
    end

  end

end
