class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :rate, default: 0
      t.text :good_point
      t.text :bad_point
      t.references :lecture, foreign_key: true

      t.timestamps
    end
  end
end
