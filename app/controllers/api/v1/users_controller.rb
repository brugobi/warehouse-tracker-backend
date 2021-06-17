module Api
  module V1
    class UsersController < ApplicationController
      rescue_from ActionController::ParameterMissing, with: :parameter_missing

      def create
        user = User.new(user_params)
        if user.save
          token = AuthenticationTokenService.encode(user.id)
          render json: {
            token: token,
            username: user.username
          }, status: :created
        else
          render json: { error: user.errors }, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
      end

      def parameter_missing(err)
        render json: { error: err.message }, status: :unprocessable_entity
      end
    end
  end
end
