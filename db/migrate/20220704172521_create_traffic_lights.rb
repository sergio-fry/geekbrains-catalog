class CreateTrafficLights < ActiveRecord::Migration[7.0]
  def change
    create_table :traffic_lights do |t|
      t.string :address

      t.timestamps
    end
  end
end
