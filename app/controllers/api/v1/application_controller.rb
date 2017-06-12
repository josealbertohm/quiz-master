class Api::V1::ApplicationController < ActionController::Base
  respond_to :json

  after_filter :set_access

  rescue_from ActiveRecord::RecordNotFound, with: :error_record_not_found_render_method

  private
  def set_access
    response.headers['Access-Control-Allow-Origin'] = 'http://localhost:8100'
    response.headers['Access-Control-Request-Method'] = '*'
  end

  def error_record_not_found_render_method(_e)
    render json: { 'statusCode' => 404, 'error' => 'Not Found' }, status: 404
  end
end