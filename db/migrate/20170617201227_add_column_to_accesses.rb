class AddColumnToAccesses < ActiveRecord::Migration[5.1]
  def change
    add_column :accesses, :key, :string
  end
end
