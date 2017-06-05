class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :lesson
      t.text :question
      t.text :answerW1
      t.text :answerW2
      t.text :answerW3
      t.text :answerR
      
      t.timestamps null: false
    end
  end
end
