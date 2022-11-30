class UserBackofficeController < ApplicationController
    layout 'users_layout'
    before_action :authenticate_user!
end
