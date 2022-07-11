# == Schema Information
#
# Table name: traffic_lights
#
#  id         :integer          not null, primary key
#  aasm_state :string
#  address    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "rails_helper"

RSpec.describe TrafficLight, type: :model do
  it do
    traffic_light = TrafficLight.create

    traffic_light.updated_at = 20.seconds.ago
    expect(traffic_light).to be_red
    expect(traffic_light.aasm.human_state).to eq "stop"

    traffic_light.updated_at = 20.seconds.ago
    traffic_light.prepare!
    expect(traffic_light).to be_yellow_to_green
    expect(traffic_light.aasm.human_state).to eq "prepare to go"

    expect { traffic_light.prepare }.to raise_error(AASM::InvalidTransition)
    expect(traffic_light.may_prepare?).to be_falsey

    traffic_light.updated_at = 20.seconds.ago
    traffic_light.go!
    expect(traffic_light).to be_green

    traffic_light.updated_at = 20.seconds.ago
    traffic_light.prepare!
    expect(traffic_light).to be_yellow_to_red

    traffic_light.updated_at = 20.seconds.ago
    traffic_light.stop!
    expect(traffic_light).to be_red
  end
end
