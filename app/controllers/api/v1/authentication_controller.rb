module Api
  module V1
    class AuthenticationController < ApplicationController
      rescue_from ActionController::ParameterMissing, with: :parameter_missing
      def create
        user = User.find_by(username: params.require(:username))
        AuthenticationTokenService.call(user.id)
        p params.require(:password).inspect

        render json: { token: '123', username: 'User1' }, status: :created
      end

      private

      def parameter_missing(err)
        render json: { error: err.message }, status: :unprocessable_entity
      end
    end
  end
end
