class AuthController < ApplicationController
    def login
        # byebug
        user = User.find_by(username: params[:username])
        is_authenticated = user.authenticate(params[:password])

        if is_authenticated
            # implmenting JWT to retrun just a token
            payload = {user_id: user.id}
            token = JWT.encode(payload, nil, 'none')
            # render json: user
            render json: { token: token }
        else
            render json: {error: "Wrong username/password. Please try again!"}
        end
    end
end
