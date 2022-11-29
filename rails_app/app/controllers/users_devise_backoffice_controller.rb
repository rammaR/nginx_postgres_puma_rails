class UsersDeviseBackofficeController < ApplicationController
    before_action :authenticate_user_devise!
    layout 'users_devise_layout'
end
