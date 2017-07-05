class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :activate_student_path]

  def index
    @students = Student.all
  end

  def show
    # set_student
    if @student.active == false
      @activity = "This student is currently inactive."
    else
      @activity = "This student is currently active."
    end
  end

  def activate
    @student = Student.find(params[:id])
    @student.update!(active: !@student.active)
    redirect_to student_path(@student)
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end
