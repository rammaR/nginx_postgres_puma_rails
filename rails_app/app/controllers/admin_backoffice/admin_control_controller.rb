class AdminBackoffice::AdminControlController < AdminBackofficeController
  def index
    @admins = Admin.all
  end
end
