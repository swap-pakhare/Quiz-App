class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :category
      t.string :subcat
      t.text :question
      t.text :option1
      t.text :option2
      t.text :option3
      t.text :option4
      t.text :answer
      t.integer :typ, default: 1

      t.timestamps
    end
  end
end
