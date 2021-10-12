module Api
  module V1
    class AuthenticationController < ApplicationController
      class AuthenticationError < StandardError; end
      rescue_from ActionController::ParameterMissing, with: :parameter_missing
      rescue_from AuthenticationError, with: :handle_authentication
      def create
        if user
          raise AuthenticationError unless user.authenticate(params[:authentication][:password])

          render json: { id: user.id, username: user.username }
        else
          render json: { error: 'No such user' }, status: :unauthorized
        end
      end

      private

      def user
        @user ||= User.find_by(username: params[:authentication][:username])
      end

      def authentication_params
        params.require(:authentication).permit(:username, :password)
      end

      def parameter_missing(err)
        render json: { error: err.message }, status: :unprocessable_entity
      end

      def handle_authentication
        head :unauthorized
      end
    end
  end
end
