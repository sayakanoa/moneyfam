class NotificationsController < ApplicationController

 def index
    @notifications = current_user.passive_notifications.page(params[:page]).per(10)
    #未確認の通知を探す
    @notifications.where(checked: false).each do |notification|
    #確認済みに更新する
    notification.update_attributes(checked: true)
    end
 end
end

