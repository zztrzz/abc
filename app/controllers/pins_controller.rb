class PinsController < ApplicationController

  before_action :set_pin, only: [:show, :edit, :update, :destroy] 
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /pins
  # GET /pins.json
   
     
   def index
    # @search=Pin.search do 
     # fulltext params[:search]
    # end
    #  @pins = @search.results
     
    @pins = Pin.all.order("created_at ASC").paginate(:page => params[:page])
 end
    

    def doktorindex

     @pins = Pin.where(user_id: nil)

    end 

  # GET /pins/1
  # GET /pins/1.json
  def show
    if @pin.nil?
        redirect_to :root
    end 
   @pin=Pin.find(params[:id]) unless @pin.nil? 
   @answers=Pin.find(params[:id]).answers unless @pin.nil?
   @photos=Photo.all 

   if doctor_signed_in? 
     @docanswer=Pin.find(params[:id]).answers.find_by(doctor_id: current_doctor.id) 
   end
  end

  # GET /pins/new
  def new
     
    if doctor_signed_in?
      @pin=current_doctor.pins.build unless current_doctor.nil? 
    elsif user_signed_in?
      @pin = current_user.pins.build unless current_user.nil? 
     
    else
      redirect_to user_session_path, notice: "Önce giriş yapmalısınız!"
      end  
       @pin.answers.build
  end

  # GET /pins/1/edit
  def edit
    
  end

  # POST /pins
  # POST /pins.json
  def create
    if user_signed_in?
    @pin = current_user.pins.build(pin_params) 

  elsif doctor_signed_in? 
    @pin = current_doctor.pins.build(pin_params)
  end
    if @pin.save
      redirect_to @pin, notice: 'Pin was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /pins/1
  # PATCH/PUT /pins/1.json
    def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: 'Pin was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /pins/1
  # DELETE /pins/1.json
  def destroy
    @pin.destroy
    redirect_to pins_url
  end

  private


 

   def correct_user

      if doctor_signed_in?
        @pin = current_doctor.pins.find_by(id: params[:id])
        redirect_to pins_path, notice: "Bu işlem için yetkiniz yok" if @pin.nil? 

      else
      @pin = current_user.pins.find_by(id: params[:id]) if user_signed_in?
      redirect_to pins_path, notice: "Bu işlem için yetkiniz yok." if @pin.nil? 


        
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_pin
      

      @pin = Pin.find(params[:id])  
    end

    

    # Never trust parameters from the scary internet, only allow the white list through.
    def pin_params
      params.require(:pin).permit(:description, :budget, :flexible, :image, answers_attributes: [:description, :image, topics_attributes: [:name]])
    end
end
