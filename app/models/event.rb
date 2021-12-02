class Event < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :notifications, dependent: :destroy

  validates :title, presence: true

  #コメントされたときに通知を作る
  def save_notification_comment!(current_user, post_comment_id, visited_id)

    notification = current_user.active_notifications.new(
      event_id: id,
      post_comment_id: post_comment_id,
      visited_id: visited_id,
      action: 'comment'
    )

    #通知を送る相手と通知を受け取る相手が同じであれば通知チェックを済みにする（つまり自分がコメントした時に自分に通知を送らないようにする設定）
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?

  end
end
