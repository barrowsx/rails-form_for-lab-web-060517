class StudentsController < ApplicationController
  def create
    @student = Student.new(params_permit(:first_name, :last_name))
    @student.save
    redirect_to student_path(@student)
  end

  def new
    @student = Student.new
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    @student.update(params_permit(:first_name, :last_name))
    redirect_to student_path(@student)
  end

  private

  def params_permit(*args)
    params.require(:student).permit(*args)
  end
end
