class AuthController < ApplicationController
    def login
        # byebug
        user = User.find_by(username: params[:username])
        is_authenticated = user.authenticate(params[:password])

        if is_authenticated
            # implmenting JWT to retrun just a token
            # payload = user_payload(user)
            # token = JWT.encode(payload, "secretkeyexample", 'HS256')
            # render json: user
            render json: { token: encode_token(user_payload(user)) }
        else
            render json: {error: "Wrong username/password. Please try again!"}
        end
    end
end
