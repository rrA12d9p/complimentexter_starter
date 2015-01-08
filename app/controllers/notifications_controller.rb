class NotificationsController < ApplicationController

	def new
	end

  def create
  	@notification = Notification.new()
  	@notification.text

  	redirect_to root_path
  end

  private
  def notification_params
  end
end