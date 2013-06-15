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
    uploaded_io = params[:message][:picture]
      File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'w') do |file|
      file.write(uploaded_io.read)
      end
    redirect_to root_url, notice: "Thank you #{@message.name} for the message!"
    else
    render :new
    end
  end

end
