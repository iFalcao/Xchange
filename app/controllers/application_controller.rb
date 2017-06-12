class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Pundit
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  layout :layout_by_resource

  protected

    def layout_by_resource
        if devise_controller? && resource_name == :admin
            "backoffice_devise"
        else
            "application"
        end
    end

    def user_not_authorized
      flash[:alert] = "Você não está autorizado a realizar esta ação."
      redirect_to(request.referrer || root_path)
    end
end
