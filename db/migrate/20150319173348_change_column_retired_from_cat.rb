class ChangeColumnRetiredFromCat < ActiveRecord::Migration
  def change
    change_column_default :cats, :retired, false
  end
end
