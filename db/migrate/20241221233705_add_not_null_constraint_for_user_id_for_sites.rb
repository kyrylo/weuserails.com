class AddNotNullConstraintForUserIdForSites < ActiveRecord::Migration[8.0]
  def change
    change_column_null :sites, :user_id, false
  end
end
