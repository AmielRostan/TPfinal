class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      # format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to main_app.root_url, notice: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name, :document_number, :direction, :phone, :card])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :first_name, :last_name, :document_number, :direction, :phone, :card])
  end

end
