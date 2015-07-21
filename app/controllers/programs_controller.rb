class ProgramsController < ApplicationController
  before_action :set_program, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @programs = Program.all
    respond_with(@programs)
  end

  def show
    respond_with(@program)
  end

  def new
    @program = Program.new
    respond_with(@program)
  end

  def edit
    
  end

  def create
    @program = Program.new(program_params)
    @program.save
    respond_with(@program)
  end

  def update
    @program = Program.find(program_params[:id])
    if @program.update(program_params) #this will already save your nested project along with the user
      redirect_to @program
    else
      render 'edit'
    end
  end

  def destroy
    @program.destroy
    respond_with(@program)
  end

  private
    def set_program
      @program = Program.find(params[:id])
    end

    def program_params
      params.require(:program).permit(:name, :description, days: [:day_number, :info])
    end
end
