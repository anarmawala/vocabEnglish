class QuestionsController < ApplicationController

  $questionBank = {
    "1" => [
      {
        question: "Define arrogaate",
        answerW1: "to avoid, shun, keep away from",
        answerW2: "to imitate with the intent of of equalling or surpassing the model",
        answerW3: "to work on excessively, to thrash soundly",
        answerR: "to claim or take without right",
      },
      {
        question: "Pard of speech of germane",
        answerW1: "verb",
        answerW2: "noun",
        answerW3: "action",
        answerR: "adjective",
      },
    ],
    "2" => [
      {
        question: "Pard of speech of histrionic",
        answerW1: "verb",
        answerW2: "noun",
        answerW3: "action",
        answerR: "adjective",
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