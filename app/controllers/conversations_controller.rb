class ConversationsController < ApplicationController
  def index
    @users = User.all
    @conversations = current_user.conversations
  end

  def show
    @conversation = get_conversation
  end

  def new
    @conversation = Conversation.new
  end

  def create
    @conversation = Conversation.find_or_create_by!(conversation_params)
    if @conversation.present? && @conversation.valid?
      redirect_to conversation_messages_path(@conversation)
    else
      flash[:alert] = @conversation.errors
      render :new
    end
  end
  def update
    @conversation = Conversation.find(params[:id])
    if @conversation.update_attributes@(params[:conversation])
      flash[:notice] = "Successfully updated conversation"
      redirect_to @conversation
    else
      render :action => 'edit'
    end
  end
  private
  def get_conversation
    @conversation = Conversation.find(params[:id])
  end

  def conversation_params
    params.permit(:user_id, :sender_id, :recipient_id)
  end
end
