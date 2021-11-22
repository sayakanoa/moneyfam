class Event < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy

  validates :title, presence: true
end
