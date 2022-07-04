class AddAasmStateToTrafficLights < ActiveRecord::Migration[7.0]
  def change
    add_column :traffic_lights, :aasm_state, :string
  end
end
