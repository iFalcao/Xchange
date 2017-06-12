class BackofficeController < ApplicationController
  before_action :authenticate_admin!
  layout 'backoffice'

  protected
    def pundit_user
      current_admin
    end
end