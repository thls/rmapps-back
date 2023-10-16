class Api::V1::BaseController < ApplicationController
  # Libs for representation
  include Roar::Rails::ControllerAdditions
  # Infers model representer using render method
  include Roar::Rails::ControllerAdditions::Render

  # Sets representer for a collection of models
  represents :json, collection: Api::V1::CollectionRepresenter

  # Only proceeds with the requests if the client has been authenticated
  before_action :authenticate_user!

  # Always load and authorize a resource (model) before all actions
  load_and_authorize_resource

  if Rails.env.production?
    # Handle 500 server errors with custom method in production environment
    rescue_from StandardError, with: :internal_server_error
  end

  # Handle unauthorizations with custom method
  rescue_from CanCan::AccessDenied, with: :unauthorized

  private
    # Super class render method to avoid Roar::Rails::ControllerAdditions::Render representer inference
    def super_render(*args, &block)
      options = _normalize_render(*args, &block)
      rendered_body = render_to_body(options)
      _set_rendered_content_type rendered_format
      _set_vary_header
      self.response_body = rendered_body
    end

    # Custom method to handle unauthorized access
    def unauthorized(e)
      super_render json: e.message, status: :unauthorized
    end

    # Custom method to handle 500 server errors
    def internal_server_error(e)
      # Log the error to a request_error.log file
      Logger.new("log/request_error.log").error e.message

      # Respond with a generic error message and a 500 status code
      super_render json: "Something wrong happened!", status: :internal_server_error
    end
end
