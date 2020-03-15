module TweetsHelper
  def chooes_new_or_edit
    if action_name == 'new' 
      confirm_tweets_path
    elsif action_name == 'edit'
      tweet_path
    end
  end
end
