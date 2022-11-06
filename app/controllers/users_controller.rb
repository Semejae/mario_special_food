class UserController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def index
    @user = current_user
  end

  def show 
    @user = User.find(params[:id])
  end