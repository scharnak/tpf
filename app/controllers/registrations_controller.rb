class RegistrationsController < Devise::RegistrationsController
  before_action :check, only:[:create]

  def new
    build_resource({})
    self.resource.user_restaurants.build
    set_minimum_password_length
    yield resource if block_given?
    respond_with self.resource
  end

  def check
    raise("check it")
  end





  private

  def sign_up_params
    params.require(:user).permit(:fname, :lname, :email, :password, :password_confirmation, :user_restaurants_attributes => [:restaurant_id, :_destroy])
  end

  def account_update_params
    params.require(:user).permit(:fname, :lname, :email, :password, :password_confirmation, :current_password, :role, user_restaurants_attributes: :restaurant_id)
  end
end