class PitchesController < ApplicationController
  def new
    @pitch = Pitch.new
  end

  def create
    @pitch = Pitch.new(pitch_params)
    if @pitch.save
      flash[:success] = "Pitch Created!"
      redirect_to pitch_path(@pitch)
    else
      flash[:error] = "Invalid pitch!"
      render :new
    end
  end

  def show
    @pitch = Pitch.find(params[:id])
  end

  private

  def pitch_params
    params.require(:pitch).permit(:number)
  end
end
