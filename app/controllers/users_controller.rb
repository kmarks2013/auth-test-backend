class UsersController < ApplicationController
    def create
        byebug
    end

    private
    def user_params
        params.permit(:username, :password)
    end
end
