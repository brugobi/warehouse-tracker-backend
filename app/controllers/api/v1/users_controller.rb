module Api
  module V1
    class UsersController < ApplicationController
      rescue_from ActionController::ParameterMissing, with: :parameter_missing

      def index
        @users = User.all
        render json: @users
      end

      def create
        user = User.new(user_params)
        if user.save
          #token = AuthenticationTokenService.call(user.id)
          render json: {id: user.id, username: user.username}
        else
          render json: { error: 'Username has been taken' }, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.permit(:username, :password)
      end

      def parameter_missing(err)
        render json: { error: err.message }, status: :unprocessable_entity
      end
    end
  end
end
