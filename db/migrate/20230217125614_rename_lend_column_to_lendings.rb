class RenameLendColumnToLendings < ActiveRecord::Migration[7.0]
  def change
    rename_column :lendings, :lend, :lend_date
  end
end
