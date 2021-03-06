class Backoffice::AdminsController < BackofficeController
    before_action :set_admin, only: [:edit, :update, :destroy]
    after_action :verify_authorized, only: [:new, :destroy]
    after_action :verify_policy_scoped, only: :index
    
  def index
    @admins = policy_scope(Admin)
  end

  def new
    @admin = Admin.new
    authorize @admin, :new?
  end

  def create
    @admin = AdminsServices.create(params_admin)
    unless @admin.errors.any?
      redirect_to backoffice_admins_path, notice:"Adminstrador (#{@admin.email}) cadastrado com sucesso!"
    else
      render  :new
    end
  end

  def edit
  end

  def update
    authorize @admin, :update?
    if @admin.update(params_admin)
      AdminMailer.update_email(current_admin, @admin).deliver_now
      redirect_to backoffice_admins_path, notice:"Adminstrador (#{@admin.email}) atualizado com sucesso!"
    else
      render  :edit
    end
  end

  def destroy
    authorize @admin, :destroy?
    admin_email = @admin.email
    if @admin.destroy
      redirect_to backoffice_admins_path, notice:"Adminstrador (#{admin_email}) deletado com sucesso!"
    else
      render  :edit
    end
  end

  private

    def set_admin
      @admin = Admin.find(params[:id])
    end

    def params_admin
      if @admin.blank?
        params.require(:admin).permit(:name, :email, :password, :password_confirmation, :role)
      else
        params.require(:admin).permit(policy(@admin).permitted_attributes)
      end
    end
end
