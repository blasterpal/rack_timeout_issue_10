class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from Timeout::Error do
    render :text => "Error: The request timed out.", :status => 503 
  end
end
