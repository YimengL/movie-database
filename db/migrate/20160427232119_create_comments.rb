class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :rating
      t.references :user, index: true, foreign_key: true
      t.references :movie, index: true, foreign_key: true
      t.text :comment

      t.timestamps null: false
    end
    
    add_index :comments, [:user_id, :movie_id], unique: true
  end
end
