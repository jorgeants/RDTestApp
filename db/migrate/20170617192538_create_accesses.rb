class CreateAccesses < ActiveRecord::Migration[5.1]
  def change
    create_table :accesses do |t|
      t.string :url
      t.references :contact, foreign_key: true

      t.timestamps
    end
  end
end
