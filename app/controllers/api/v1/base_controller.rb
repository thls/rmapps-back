class Api::V1::BaseController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  rescue_from CanCan::AccessDenied, with: :unauthorized

  def unauthorized(e)
    render json: e.message, status: :unauthorized
  end
end
