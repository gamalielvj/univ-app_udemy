class StudentCoursesController < ApplicationController

  def create
    #byebug
    course_to_add = Course.find(params[:course_id])
    unless current_user.courses.include?(course_to_add)
      StudentCourse.create(course: course_to_add, student: current_user)
      flash[:notice]= "You have successfully enroll #{course_to_add.name}"
      redirect_to current_user
    else
      flash[:notice]= "something was wrong with your enrollment"
      redirect_to root_path
    end

  end

end
