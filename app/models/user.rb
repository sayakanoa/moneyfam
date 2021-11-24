class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, dependent: :destroy
  has_many :payments, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :wants, dependent: :destroy
  has_many :buys, dependent: :destroy
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

  enum money_type: { saver: 0, spender: 1 }

  validates :name, presence: true
  validates :email, presence: true
  validates :introduction, presence: true
end
