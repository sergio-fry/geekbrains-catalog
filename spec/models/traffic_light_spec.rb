require "rails_helper"

RSpec.describe TrafficLight, type: :model do
  it do
    traffic_light = TrafficLight.new

    expect(traffic_light).to be_red

    traffic_light.prepare_to_go
    expect(traffic_light).to be_yellow_to_green

    expect { traffic_light.prepare_to_go }.to raise_error(AASM::InvalidTransition)
    expect(traffic_light.may_prepare_to_go?).to be_falsey

    traffic_light.go
    expect(traffic_light).to be_green

    traffic_light.prepare_to_stop
    expect(traffic_light).to be_yellow_to_red

    traffic_light.stop
    expect(traffic_light).to be_red
  end
end
