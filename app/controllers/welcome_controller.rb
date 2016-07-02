class WelcomeController < ApplicationController
  before_action :activate_session

  def index
    redirect_to rooms_path if logged_in?
  end

end
