class InterestsController < ApplicationController
  before_action :authenticate_user!

  def create
    @interest = Interest.new(interest_params)
    @interest.user_id = current_user.id
    if @interest.valid?
      @interest.save

      render :create
    else
      redirect_to root_path, notice: "Oops"
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def interest_params
    params.require(:interest).permit(:score, :comment, :topic_id)
  end
end
