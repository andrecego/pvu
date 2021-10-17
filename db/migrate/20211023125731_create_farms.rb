class CreateFarms < ActiveRecord::Migration[6.1]
  def change
    create_table :farms do |t|
      t.integer :le
      t.integer :hours
      t.decimal :le_rate
      t.references :config, null: false, foreign_key: true

      t.timestamps
    end
  end
end
