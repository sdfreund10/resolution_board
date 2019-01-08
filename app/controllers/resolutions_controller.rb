class ResolutionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @resolutions = Resolution.where(user: current_user).includes(:updates)
  end

  def new
    @resolution = Resolution.new(start_date: Date.today, end_date: Date.today.end_of_year)
  end

  def create
    resolution = Resolution.new(resolution_params.merge(user: current_user))

    if resolution.save
      flash[:success] = ["Resolution made"]
      redirect_to resolutions_url
    else
      set_flash(resolution.errors)
      redirect_to new_resolution_url
    end
      
  end

  def edit
    @resolution = Resolution.find(params[:id])
  end

  def update
    resolution = Resolution.find(params[:id])

    if resolution.update(resolution_params)
      flash[:success] = ["Resolution updated!"]
      redirect_to resolutions_url
    else
      set_flash(resolution.errors)
      redirect_to edit_resolution_url(resolution)
    end
  end

  def destroy
    resolution = Resolution.find(params[:id]).destroy
    
    flash[:success] = ["Resolution removed"]
    redirect_to resolutions_url
  end

  private

  def resolution_params
    params.require(:resolution).permit(:title, :goal, :unit, :start_date, :end_date)
  end
end
