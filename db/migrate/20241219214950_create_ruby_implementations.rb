class CreateRubyImplementations < ActiveRecord::Migration[8.0]
  def change
    create_table :ruby_implementations do |t|
      t.string :name, null: false, index: { unique: true }

      t.timestamps
    end

    create_join_table :ruby_implementations, :sites do |t|
      t.index [ :ruby_implementation_id, :site_id ], unique: true
      t.index [ :site_id, :ruby_implementation_id ]
    end
  end
end
