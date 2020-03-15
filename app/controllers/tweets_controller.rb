class TweetsController < ApplicationController

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
      redirect_to tweets_path, notice:"ブログを作成しました！"
    else
      render:new
    end
  end

  def edit

  end

  def update

  end

  def destory

  end

  def confirm
    @tweet = Tweet.new(get_tweet_params)
    render :new if @tweet.invalid?
  end

  private

  def get_tweet_params
    params.require(:tweet).permit(:content)
  end
  
end
