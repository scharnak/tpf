class UserNotificationController < ApplicationController
	before_action :set_user_notification, only: [:read_notification]

	def read_notification
		UserNotification.find(@user_notification).update_attribute(:read, 1)
    	redirect_to user_notifications_path(current_user),notice: 'Notification was successfully read.'
	end

	private
  	# Use callbacks to share common setup or constraints between actions.
  	def set_user_notification
    		@user_notification = UserNotification.find(params[:id])
  	end

  	# Never trust parameters from the scary internet, only allow the white list through.
  	def user_params
    		params.require(:user_notification).permit(:read)
  	end
end
