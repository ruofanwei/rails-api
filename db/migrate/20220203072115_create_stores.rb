class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.string :user
      t.string :references
      t.string :name

      t.timestamps
    end
  end
end
