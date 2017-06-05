class QuestionsController < ApplicationController

  $questionBank = {
    "1" => [
      {
        question: "Which one says yes?",
        answerW1: "NO",
        answerW2: "NO",
        answerW3: "NO",
        answerR: "YES",
      },
    ],
    "2" => [
      {
        question: "Which one says no?",
        answerW1: "YES",
        answerW2: "YES",
        answerW3: "YES",
        answerR: "NO",
      },
    ],
  }
  
  def setup
    $currentQs = []
    @lessons = $questionBank.keys
    render 'home'
  end
  
  def bank
    $questionBank.keys.each do |lesson|
      if params["#{lesson}"] == "on"
        $questionBank["#{lesson}"].each do |question|
          $currentQs << question
        end
      end
    end
    
    render 'quiz'
  end
  
end