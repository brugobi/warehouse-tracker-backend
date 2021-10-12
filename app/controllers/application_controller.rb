class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler
  rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed

  def authenticate_request!
    return invalid_authentication unless payload

    current_user!
    invalid_authentication unless @current_user
  end

  private

  def invalid_authentication
    render json: { error: 'You will need to login first' }, status: :unauthorized
  end

  def current_user!
    @current_user = User.find_by(id: payload[0]['user_id'])
  end

  def payload
    auth_header = request.headers['Authorization']
    token = auth_header.split.last
    AuthenticationTokenService.decode(token)
  rescue StandardError
    nil
  end
end
