class CommunitiesController < ApplicationController
  def index
  end

  def new
    @community = Community.new
    @communities = Community.all
  end

  def create
    @community = Community.new(community_params)
    if @community.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    community = Community.find(params[:id])
    community.destroy
    redirect_to root_path
  end

  private
  def community_params
    params.require(:community).permit(:name, user_ids: [])
  end
end
