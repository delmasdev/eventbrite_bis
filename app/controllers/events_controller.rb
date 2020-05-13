class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @event = Event.all
  end

 def show
    @event = Event.find(params[:id])
  end

  def new
    @user_id = current_user.id
    @event = Event.new
  end

  def create
    puts 'X' * 70
    puts params
    puts'X' * 70

    @event = Event.new(  admin_id: current_user.id,
                        title: params[:title],
                        description: params[:description],
                        location: params[:location],
                        price: params[:price],
                        start_date: params[:start_date],
                        duration: params[:duration])
    @event.save
    redirect_to root_path
  end

end
