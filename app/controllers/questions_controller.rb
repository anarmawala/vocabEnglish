class QuestionsController < ApplicationController

  def setup
    $currentQs = []
    render 'home'
  end
  
  def bank
    Question.pluck(:lesson).each do |lesson|
      if params["#{lesson}"] == "on"
        Question.all.each do |question|
          if question.lesson == lesson
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
    newQuestion = Question.new
    newQuestion.lesson = params[:lesson]
    newQuestion.question = params[:question]
    newQuestion.answerW1 = params[:wAns_1]
    newQuestion.answerW2 = params[:wAns_2]
    newQuestion.answerW3 = params[:wAns_3]
    newQuestion.answerR = params[:rAns]
    
    newQuestion.save
    redirect_to '/home'
  end
  
  def index
    render 'indexQuestion'
  end
  
  def editForm
    @question = Question.find(params[:id])
    render 'editQuestion'
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
    Question.find(params[:id]).destroy
    redirect_to '/questions'
  end
  
end