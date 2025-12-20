class DeleteUnwantedFieldsFromSites < ActiveRecord::Migration[8.0]
  def change
    change_table :sites do |t|
      t.remove :logo_url
      t.remove :featured_image_url
    end
  end
end
