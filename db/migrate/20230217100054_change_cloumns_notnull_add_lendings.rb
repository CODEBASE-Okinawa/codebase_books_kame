class ChangeCloumnsNotnullAddLendings < ActiveRecord::Migration[7.0]
  def change
    change_column :lendings, :status, :integer, null: false
    change_column :lendings, :lend, :date, null: false
    change_column :lendings, :return_date, :date, null: false
  end
end
