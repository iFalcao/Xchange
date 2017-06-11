class Backoffice::AdminsController < BackofficeController
    before_action :set_admin, only: [:edit, :update, :destroy]

  def index
    @admins = Admin.all
    @admins = Admin.page params[:page]
  end

  def new
    @admin = Admin.new
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
    if @admin.update(params_admin)
      redirect_to backoffice_admins_path, notice:"Adminstrador (#{@admin.email}) atualizado com sucesso!"
    else
      render  :edit
    end
  end

  def destroy
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
      params.require(:admin).permit(:name, :email, :password, :password_confirmation)
    end
end
