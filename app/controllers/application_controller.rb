class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session
    before_action :authenticate_user

    
    def authenticate_user
        if !loggedIn
            render json: { error: 'Please log in' }, status: 401
        end
    end

    def loggedIn
        if request.headers['Authorization']
            method, token = request.headers['Authorization'].split(' ')
            begin
                payload, headers = JWT.decode(token, 'secret')
                current_user = User.find(payload['user_id'])
            rescue JWT::DecodeError
                nil
            end
        end
    end
end
