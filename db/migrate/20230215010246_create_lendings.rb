class CreateLendings < ActiveRecord::Migration[7.0]
  def change
    create_table :lendings do |t|
      t.integer :user_id
      t.integer :book_id
      t.integer :status
      t.date :lend
      t.date :return

      t.timestamps
    end
  end
end
