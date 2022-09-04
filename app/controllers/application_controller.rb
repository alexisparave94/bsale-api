require_relative "../services/bsale_service"

class ApplicationController < ActionController::API
  before_action :set_service

  private

  def set_service
    @bsale_service = BsaleService.new
  end
end
