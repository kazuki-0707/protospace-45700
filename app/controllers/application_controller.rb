class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?
    def after_sign_out_path_for(resource_or_scope)
      root_path
    end

     def authenticate_user_or_redirect
    unless user_signed_in?
      redirect_to root_path
    end
  end


  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :occupation, :position])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile, :occupation, :position])
  end
end
