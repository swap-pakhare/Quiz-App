class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.belongs_to :user
      t.integer :user_id
      t.string :category
      t.string :subcat
      t.string :state, default: NULL
      t.integer :curr, default: 0
      t.integer :highest, default: 0

      t.timestamps
    end
  end
end
