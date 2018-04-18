class CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new 
    if params[:wine_id]
      @wine = Wine.find(params[:wine_id])
      @comment = @wine.comments.build
    else
      @comment = Comment.new
    end
  end

  def create
    @comment = Comment.create(content: params[:content], wine_id: params[:wine_id])
    redirect_to comment_path(@comment)
  end

  def show
    if params[:wine_id]
      @wine = Wine.find(params[:wine_id])
      @comment = Comment.find(params[:comment_id])
    else 
      @comment = Comment.find(params[:id])
    end
  end

  def index 
    # only route available is an index route nested in wine#show route
    wine = Wine.find(params[:wine_id]) 
    @comments = wine.comments
    render json: @comments, status: 200
  end

  private

  def comment_params
    params[:comment].permit(:content, :wine_id)
  end

end