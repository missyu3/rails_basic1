class TweetsController < ApplicationController

  before_action :find_tweet, only:[:edit,:update,:destroy]

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create 
    @tweet = Tweet.new(get_tweet_params)
    if params[:'back']
      render:new
    elsif @tweet.save 
      redirect_to tweets_path, notice:"作成しました"
    else
      render:new
    end
  end

  def edit
  end

  def update
    if @tweet.update(get_tweet_params)
      redirect_to tweets_path, notice:"編集しました"
    else
      render:edit
    end
  end

  def destroy
   if @tweet.destroy
    redirect_to tweets_path,notice:"削除しました。"
  else
    render:edit
   end
  end

  def confirm
    @tweet = Tweet.new(get_tweet_params)
    render :new if @tweet.invalid?
  end

  private
  def find_tweet
    @tweet = Tweet.find(params[:id])
  end

  def get_tweet_params
    params.require(:tweet).permit(:content)
  end
  
end
