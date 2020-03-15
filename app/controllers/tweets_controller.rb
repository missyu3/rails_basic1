class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all
  end

  def new
    @tweets = Tweet.new
  end

  def create 
    @tweets = Tweet.new(params.require(:tweet).permit(:content))
    if @tweets.save 
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

  end
  
end
