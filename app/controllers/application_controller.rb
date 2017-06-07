class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_student!
  
  def customizeForm
    if current_student.admin == true
      render 'customizationForm'
    else
      redirect_to root_path
    end
  end
  
  def customize
    if current_student.admin == true
      $title = params[:title]
      $name = params[:name]
      $type = params[:type]
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
  
end
