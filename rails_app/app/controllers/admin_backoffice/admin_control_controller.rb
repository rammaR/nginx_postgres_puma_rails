class AdminBackoffice::AdminControlController < AdminBackofficeController
  
  #before_action set_params, only: [ :edit ]

  def index
    @admins = Admin.all
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])
    
    params_admin = params.require(:admin).permit(:email, :password, :password_confirmation)

    if @admin.update(params_admin)
       redirect_to admin_backoffice_admin_control_index_path, notice: "Administrador atualizado"
    else
       render :edit
    end
  end

  private
    
end
