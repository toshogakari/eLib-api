class V1::StatusController < ApplicationController
  # before_action :authenticate_user
  def index
    status = {
      errors:  "500001",
      message: "Server error, ErrorException"
    }
    render json: status
  end
end

