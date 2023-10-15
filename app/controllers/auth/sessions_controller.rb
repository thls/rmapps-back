# frozen_string_literal: true

class Auth::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    render json: { message: I18n.t("devise.sessions.signed_in") }, status: :ok
  end

  def respond_to_on_destroy
    # When the client sends a valid token
    if current_user
      render json: { message: I18n.t("devise.sessions.signed_out") }, status: :ok
    else
      render json: { message: I18n.t("devise.sessions.not_found") }, status: :unauthorized
    end
  end
end
