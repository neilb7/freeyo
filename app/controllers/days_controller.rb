class DaysController < ApplicationController
  def new
    @program = Program.find(params[:id])
    @day = Day.new
  end

  def create
    @program = Program.find(params[:program_id])
    @day = @program.days.create(day_params)
    redirect_to program_path(@program)
  end

  def edit
    # @program = Program.find(params[:id])
    # @day = @program.days.find(params[:id])
  end

  def update
    @program = Program.find(params[:program_id])
    @day = @program.days.find(params[:id])
    @day.update
    redirect_to [@day.program, @day]
  end

  def destroy
    @program = Program.find(params[:program_id])
    @day = @program.days.find(params[:id])
    @day.destroy
    redirect_to program_path(@program)
  end

  private
    def day_params
      params.require(:day).permit(:day_number, :info)
    end
end
