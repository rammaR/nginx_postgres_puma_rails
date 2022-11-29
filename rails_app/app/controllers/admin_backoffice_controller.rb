class AdminBackofficeController < ApplicationController
    before_action :authenticate_admin!
    layout 'admin_layout'
end
