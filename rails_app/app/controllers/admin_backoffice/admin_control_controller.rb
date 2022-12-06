class AdminBackoffice::AdminControlController < AdminBackofficeController
  
  before_action :verify_password_update, only: [ :update ]
  before_action :set_admin, only: [:edit, :update, :destroy]

  def index
    @admins = Admin.order(:name).page params[:page]
  end

  def edit    
  end

  def update
    if @admin.update(params_admin)
       redirect_to admin_backoffice_admin_control_index_path, notice: "Administrador atualizado"
    else
       render :edit
    end
  end

  def new
    @admin = Admin.new
  end  

  def create
    @admin = Admin.new(params_admin)

    respond_to do |format|
      if @admin.save
        format.html { redirect_to admin_backoffice_admin_control_index_path, notice: "Administrador cadastrado com sucesso" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @admin.destroy
      redirect_to admin_backoffice_admin_control_index_path, notice: 'Administrador excluído'
    else
      render :index
    end
  end

  private
    def verify_password_update
      if params[:admin][:password].blank? && params[:admin][:password_confirmation].blank?
         params[:admin].extract!(:password, :password_confirmation)
      end
    end

    def set_admin
      @admin = Admin.find(params[:id])
    end

    def params_admin
      params_admin = params.require(:admin).permit(:email, :password, :password_confirmation)
    end
end
