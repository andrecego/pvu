class CreateStats < ActiveRecord::Migration[6.1]
  def change
    create_table :stats do |t|
      t.integer :element
      t.integer :hp
      t.integer :def_physics
      t.integer :def_magic
      t.integer :damage_physics
      t.integer :damage_magic
      t.integer :damage_pure
      t.integer :damage_hp_loss
      t.integer :damage_hp_remove
      t.references :config, null: false, foreign_key: true

      t.timestamps
    end
  end
end
