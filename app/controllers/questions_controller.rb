class QuestionsController < ApplicationController
  before_action :authenticate_student!, except: [:setup, :bank, :check]
  
  def setup
    $currentQs = []
    render 'home'
  end
  
  def bank
    Question.uniq.pluck(:lesson).each do |lessonP|
      if params["#{lessonP}"] == "on"
        Question.all.each do |question|
          if question.lesson == lessonP
            $currentQs << question
          end
        end
      end
    end
    
    render 'quiz'
  end
  
  def check
    score = 0
    for n in 0..$currentQs.length - 1
      if params["#{n}"] == "right"
        score += 1
      end
    end
    flash[:sucess] = "You scored #{score} out of #{$currentQs.length}."
    render 'score'
  end
  
  def newForm
    render 'newQuestion'
  end
  
  def add
    newQuestion = current_student.questions.build
    newQuestion.lesson = params[:lesson]
    newQuestion.question = params[:question]
    newQuestion.answerW1 = params[:wAns_1]
    newQuestion.answerW2 = params[:wAns_2]
    newQuestion.answerW3 = params[:wAns_3]
    newQuestion.answerR = params[:rAns]
    newQuestion.student_id = current_student.id
    
    newQuestion.save
    redirect_to root_path
  end
  
  def index
    if current_student.admin == true
      render 'indexQuestion'
    else
      redirect_to root_path
    end
  end
  
  def editForm
    if current_student.admin == true
      @question = Question.find(params[:id])
      render 'editQuestion'
    else
      redirect_to root_path
    end
  end
  
  def edit
    editQuestion = Question.find(params[:id])
    editQuestion.lesson = params[:lesson]
    editQuestion.question = params[:question]
    editQuestion.answerW1 = params[:wAns_1]
    editQuestion.answerW2 = params[:wAns_2]
    editQuestion.answerW3 = params[:wAns_3]
    editQuestion.answerR = params[:rAns]
    
    editQuestion.save
    redirect_to '/questions'
  end
  
  def delete
    if current_student.admin == true
      Question.find(params[:id]).destroy
      redirect_to '/questions'
    else
      redirect_to root_path
    end
  end
  
end