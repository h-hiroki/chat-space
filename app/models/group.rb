class Group < ApplicationRecord
  has_many :user_groups
  has_many :users, through: :user_groups
  has_many :messages

  validates :name, presence: true

  def last_msg
    if messages.blank?
      "まだメッセージはありません"
    else
      messages.last.body
    end
  end
end
