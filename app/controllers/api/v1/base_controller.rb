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

  def unauthorized(e)
    super_render json: e.message, status: :unauthorized
  end
end
