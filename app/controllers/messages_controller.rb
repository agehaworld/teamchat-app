class MessagesController < ApplicationController
  def index
    @message = Message.new
    @team = Team.find(params[:team_id])
    @messages = @team.messages.includes(:user)
  end

  def create
    @team = Team.find(params[:team_id])
    @message = @team.messages.new(message_params)
    if @message.save
      redirect_to team_messages_path(@team)
    else
      @messages = @team.messages.includes(:user)
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
end
