class MessagesController < ApplicationController
  def index
  @messages = Message.all
  end

  def new
  @message = Message.new
  end

  def create
  @message = Message.new(params[:message])
  if @message.save
    redirect_to root_url, notice: "Thank you #{@message.name} for the message!"
  else
    render :new
  end
  end

end
