class CreateResemblances < ActiveRecord::Migration[5.2]
  def change
    create_table :resemblances do |t|
      t.references :lecture, foreign_key: true
      t.integer :r_id
      t.decimal :degree, precision: 20, scale: 19

      t.timestamps
    end
  end
end
