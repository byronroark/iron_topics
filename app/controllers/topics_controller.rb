class TopicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  # before_action :disallow_editing_for_topics_with_interests, only: [:edit, :update]

  def index
    @topics = Topic.all.order("interests_count")
    @topics = Topic.all.includes(:interests)

    # @topics.sort_by? { |topic| topic.interests.sum(:score) }
  end

  def show
  end

  def search
    @search = params[:q]
    @topics = Topic.search(@search)

    render :index
  end

  def new
    @topic = Topic.new
  end

  def edit
    if @topic.interests.count > 0
      redirect_to topics_path, notice: "Sorry, you can't edit this since there are already interests"
      return
    end
  end

  def create
    @topic = Topic.new(topic_params)

    respond_to do |format|
      if @topic.save
        format.html { redirect_to @topic, notice: 'Topic was successfully created.' }
        format.json { render :show, status: :created, location: @topic }
      else
        format.html { render :new }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @topic.interests.count > 0
      redirect_to topics_path, notice: "Sorry, you can't edit this since there are already interests"
      return
    end

    respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to @topic, notice: 'Topic was successfully updated.' }
        format.json { render :show, status: :ok, location: @topic }
      else
        format.html { render :edit }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @topic.destroy
    respond_to do |format|
      format.html { redirect_to topic_url, notice: 'Topic was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_topic
    @topic = Topic.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def topic_params
    params.require(:topic).permit(:title, :description, :focus_area)
  end
end
