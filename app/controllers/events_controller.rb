class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :authenticate_admin, only: [:edit]

  def index
    @event = Event.all
  end

 def show
    @event = Event.find(params[:id])
    @ifparticipe = Attendance.where(event: @event,user: current_user).empty?
    @participe = Attendance.where(event: @event,user: current_user).present?
    @amount = Event.find_by(id: params[:id]).price
    @amount = @amount * 100
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(  admin_id: current_user.id,
                        title: params[:title],
                        description: params[:description],
                        location: params[:location],
                        price: params[:price],
                        start_date: params[:start_date],
                        duration: params[:duration])
    if @event.save
    redirect_to event_path(@event)
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    post_params = params.require(:event).permit(:title, :description)

    if @event.update(post_params)
      flash[:modif] = ""
      render :show
    else
     render :edit
   end
  end


  def destroy
    @event = Event.find(params[:id])
    @event.delete
    redirect_to root_path
  end



  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Not logged in."
      redirect_to root_path
    end
  end

  def authenticate_admin
    puts "X" * 70
    unless current_user == Event.find(params[:id]).admin
      flash[:danger] = "Not logged in."
      redirect_to root_path
    end
  end
end
