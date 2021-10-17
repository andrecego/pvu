class CreateConfigs < ActiveRecord::Migration[6.1]
  def change
    create_table :configs do |t|
      t.references :plant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
