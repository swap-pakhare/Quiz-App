class AddLinkToQuestions < ActiveRecord::Migration[5.1]
  def change
  	add_column :questions, :link, :string
  end
end
