class RegistrationsController < Devise::RegistrationsController
  #before_action :check, only:[:create, :update]
  after_action :send_email, only:[:create]

  def new
    build_resource({})
    self.resource.user_restaurants.build
    self.resource.user_preferences.build
    set_minimum_password_length
    yield resource if block_given?
    respond_with self.resource
  end

  def check
    raise("check it")
  end

  def send_email
    UserMailer.user_mail(@user, "Welcome to the Patachou Foundation").deliver
  end

  protected

  def after_inactive_sign_up_path_for(resource)
    '/users/sign_in' # Or :prefix_to_your_route
  end


  private

  def sign_up_params
    params.require(:user).permit(:fname, :lname, :email, :password, :password_confirmation, :approved, :restaurant_ids => [], :preference_ids => [])
  end

  def account_update_params
    params.require(:user).permit(:fname, :lname, :email, :password, :password_confirmation, :current_password, :role, :restaurant_ids => [], :preference_ids => [])
  end
end