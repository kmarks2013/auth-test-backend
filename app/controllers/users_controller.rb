class UsersController < ApplicationController
    def create
        #byebug
        user = User.create(user_params)

        if user.valid?
            render json: user
        else
            render json: {errors: user.errors.full_messages}
        end
    end

    private
    def user_params
        params.permit(:username, :password)
    end
end
