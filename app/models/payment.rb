class Payment < ApplicationRecord
  belongs_to :user

    validates :house, presence: true
    validates :life, presence: true
    validates :food, presence: true
    validates :enjoy, presence: true
    validates :saving, presence: true
    validates :investing, presence: true
    validates :other, presence: true
end
