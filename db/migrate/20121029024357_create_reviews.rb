class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :author
      t.text :body
      t.integer :grade
      t.references :book

      t.timestamps
    end
    add_index :reviews, :book_id
  end
end
