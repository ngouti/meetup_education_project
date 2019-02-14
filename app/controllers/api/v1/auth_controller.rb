class Api::V1::AuthController < ApplicationController

    skip_before_action :authenticate_user, only: [:create]

    def create 
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            render json: 
            {
                token: JWT.encode({  user_id: user.id }, 'secret'),
                user: user
            }
        else
            render json: { error: 'email or password are incorrect' }, status: 401
        end
    end
end

