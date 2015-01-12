class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :msg
      t.integer :product_id, index: true
      t.integer :user_id, index: true

      t.timestamps
    end
  end
end
