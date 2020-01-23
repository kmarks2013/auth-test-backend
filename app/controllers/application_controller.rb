class ApplicationController < ActionController::API
    def encode_token(payload)
        JWT.encode(payload, "secretkeyexample", 'HS256')
    end
end

# payload = {user_id: user.id}
# token = JWT.encode(payload, "secretkeyexample", 'HS256')
# render json: { token: token }