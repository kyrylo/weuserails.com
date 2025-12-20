class AddUserIdToSites < ActiveRecord::Migration[8.0]
  def change
    add_reference :sites, :user, foreign_key: true
  end
end
