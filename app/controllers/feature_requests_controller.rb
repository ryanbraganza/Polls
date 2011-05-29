class FeatureRequestsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @feature_requests = FeatureRequest.all
  end
  def new
    @feature_request = FeatureRequest.new
  end
  def create
    @feature_request = FeatureRequest.new params[:feature_request]
    @feature_request.user = current_user
    @feature_request.created_at = Time.now

    if @feature_request.save
      redirect_to feature_requests_path
    else
      flash.now[:alert] = 'fail'
      render :new
    end
  end
end
