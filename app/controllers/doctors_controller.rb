class DoctorsController < ApplicationController
	before_action :set_doctor, only: [:show, :edit, :update, :destroy]
	before_action :correct_use, only: [:edit, :update, :destroy, :show]

def show
   @doctor= Doctor.find_by(id: params[:id])
   

end


private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctor
      @doctor = Doctor.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def doctor_params
      params.require(:doctor).permit(:doctor_id, :message_id)
    end
  
  def correct_use

      if (user_signed_in? || doctor_signed_in?)
        @doctor= Doctor.find_by(id: params[:id])

       else 
        redirect_to pins_path, notice: "Lütfen kayıt olun ya da giriş yapın."
      
      end

    end


end