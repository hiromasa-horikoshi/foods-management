class VideosController < ApplicationController
  def index
    @video = Video.new
    @community = Community.find(params[:community_id])
    @videos = @community.videos.includes(:user).order(created_at: :desc)
    @user = CommunityUser.where(community_id: @community).where.not(user_id: current_user.id)[0]["user_id"]
  end

  def create
    @community = Community.find(params[:community_id])
    @video = @community.videos.new(video_params)
    if @video.save
      redirect_to community_videos_path(@community)
    else
      @videos = @communty.videos.includes(:user)
      render index
    end
  end

  def search
    url = "https://app.rakuten.co.jp/services/api/Recipe/CategoryList/20170426?format=json&applicationId=#{ENV['RWS_APPLICATION_ID']}"
    url_open = open(url).read
    @recipes = JSON.parse(url_open)
  end

  private
  def video_params
    params.require(:video).permit(:content, :video).merge(user_id: current_user.id)
  end
end
