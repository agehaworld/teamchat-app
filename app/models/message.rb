class Message < ApplicationRecord
  belongs_to :team
  belongs_to :user

  validates :content, presence: true
end
