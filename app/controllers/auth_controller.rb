class AuthController < ApplicationController
    def login
        # byebug
        user = User.find_by(username: params[:username])
        is_authenticated = user.authenticate(params[:password])

        if is_authenticated
            render json: user
        else
            render json: {error: "Wrong username/password. Please try again!"}
        end
    end
end
