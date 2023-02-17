class ChangeColumnDefaultToLendings < ActiveRecord::Migration[7.0]
  def change
    change_column_default :lendings, :status, 0
  end
end
