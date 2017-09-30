class Group < ApplicationRecord
  has_many :user_groups
  has_many :users, through: :user_groups
  has_many :messages

  validates :name, presence: true

  def last_msg
    if messages.blank?
      "まだメッセージはありません"
    else
      if messages.last.image?
        "画像が投稿されています"
      else
        messages.last.body
      end
    end
  end
end
