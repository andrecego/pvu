class CreatePlants < ActiveRecord::Migration[6.1]
  def change
    create_table :plants do |t|
      t.bigint :external_id
      t.bigint :token_id
      t.string :owner_id
      t.bigint :plant_token_id
      t.datetime :time_sell
      t.decimal :starting_price
      t.decimal :ending_price
      t.bigint :duration
      t.integer :status
      t.datetime :external_updated_at
      t.string :icon_url

      t.timestamps
    end
  end
end
