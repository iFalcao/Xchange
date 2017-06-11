class Backoffice::AdminsController::AdminsServices
  attr_accessor :admin

  def self.create(params_admin)
    @admin = Admin.new(params_admin)
    
    if @admin.valid?
      @admin.save!
    end

    @admin
  end


end