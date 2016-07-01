class WelcomeController < ApplicationController
  before_action :activate_session

  def index
    redirect_to groups_path if logged_in?
  end

end
