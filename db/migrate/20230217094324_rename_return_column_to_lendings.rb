class RenameReturnColumnToLendings < ActiveRecord::Migration[7.0]
  def change
    rename_column :lendings, :return, :return_date
  end
end
