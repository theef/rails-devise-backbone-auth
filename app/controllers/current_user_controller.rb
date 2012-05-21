class CurrentUserController < ApplicationController

  def current_user
    if signed_in?
      user = 1
    else
      user = 0
    end
    respond_to do |format|
      format.json { render json: user }
    end
  end
  
end