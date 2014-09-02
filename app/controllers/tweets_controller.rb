class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  # GET /tweets
  # GET /tweets.json
  def index
    @tweets = Tweet.all
    @tweet = Tweet.new
  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show
  end


  # POST /tweets
  # POST /tweets.json
  def create
    @tweet = current_user.tweets.new(tweet_params)
    #@tweet = Tweet.new(tweet_params)
    #@tweet.user = @user

      if @tweet.save
        format.html { redirect_to tweets_path, notice: 'Tweet was successfully created.' }
      else
        format.html { redirect_to tweets_path, alert: 'Tweet couldnt be created.' }
      end
  end


  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    @tweet.destroy
      format.html { redirect_to tweets_url }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tweet_params
      params.require(:tweet).permit(:text, :attachment, :location)
    end
end
