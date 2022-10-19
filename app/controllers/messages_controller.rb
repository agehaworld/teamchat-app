class MessagesController < ApplicationController
  def index
    @message = Message.new
    @team = Team.find(params[:team_id])
  end

  def create
    @team = Team.find(params[:team_id])
    @message = @team.messages.new(message_params)
    if @message.save
      redirect_to team_messages_path(@team)
    else
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
end
