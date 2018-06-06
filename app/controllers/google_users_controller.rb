class GoogleUsersController < ApplicationController
  def show
    @guser = GoogleUser.find(params[:id])
  end
end
