class Message < ApplicationRecord
  belongs_to :group
  belongs_to :user

  validates :body, presence: true

  belongs_to :user
  belongs_to :group
end
