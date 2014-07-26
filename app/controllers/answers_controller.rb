class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_doctor!, except: [:index, :show]
  before_action :correct_doctor, only: [:edit, :update, :destroy]

  # GET /answers
  # GET /answers.json
  def index
    if doctor_signed_in?
    @answers = current_doctor.answers.all
  elsif user_signed_in?
    redirect_to root_path, notice: "Önce doktor olarak giriş yapmalısınız!"
  end
    
  end

  # GET /answers/1
  # GET /answers/1.json
  def show

  end

  # GET /answers/new
  def new
    if doctor_signed_in?
    @answer = current_doctor.answers.build
  elsif user_signed_in?
    reirect_to root_path, notice: "Sadece doktorlar cevaplayabilir!"
  else redirect_to doctor_session_path, notice: "Doktor olarak giriş yapmalısınız!"
  end
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer= current_doctor.answers.build(answer_params)

    respond_to do |format|
      if @answer.save
        format.html { redirect_to @answer, notice: 'Answer was successfully created.' }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { render :new }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to @answer, notice: 'Answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end


def correct_doctor
      @answer = current_doctor.answers.find_by(id: params[:id])
      redirect_to answers_path, notice: "Not authorized to edit this answer" if @answer.nil?
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:description, :pin_id, :image)
    end
end
