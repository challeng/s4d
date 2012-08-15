include ApplicationHelper

class ApplicationController < ActionController::Base
  protect_from_forgery

  attr_accessor :json_data

  before_filter :get_data

  def get_data
  	@json_data = ApplicationHelper.gather_data
  end
end
