class UsersController < ApplicationController
  before_action :set_profile

  def show
    @photos = User.find(params[:id]).photos.order('created_at DESC')
  end

  private

  def set_profile
    @user = User.find(params[:id])
  end
end
