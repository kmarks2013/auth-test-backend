class UsersController < ApplicationController
    def create
        #byebug
        user = User.create(user_params)

        if user.valid?
            # payload = {user_id: user.id}
            # token = JWT.encode(payload, "secretkeyexample", 'HS256')
            # render json: { token: token }
            # render json: user
            render json: { token: encode_token(user_payload(user)) }
        else
            render json: {errors: user.errors.full_messages}
        end
    end

    private
    def user_params
        params.permit(:username, :password)
    end
end
