# frozen_string_literal: true

class UpdatesController < ApplicationController
  attr_reader :resolution
  before_action :set_resolution

  def index
    @updates = resolution.updates
  end
  
  def create
    update = Update.new(update_params)

    if update.save
      flash[:success] = "Resolution updated! Good work!"
      redirect_to resolutions_url
    else
      set_flash(update.errors)
      redirect_to new_resolution_update_url
    end
  end

  def new
    @update = Update.new(resolution: resolution, date: Date.today)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_resolution
    @resolution = Resolution.find(params[:resolution_id])
  end

  def update_params
    params.require(:update).permit(:date, :progress, :note).merge(
      params.permit(:resolution_id)
    )
  end
end

