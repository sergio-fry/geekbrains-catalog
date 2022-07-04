class TrafficLight < ApplicationRecord
  include AASM

  aasm do
    state :red, initial: true, display: I18n.t("traffic_lights.aasm.red")
    state :yellow_to_green, display: I18n.t("traffic_lights.aasm.yellow_to_green")
    state :yellow_to_red, display: I18n.t("traffic_lights.aasm.yellow_to_red")
    state :green, display: I18n.t("traffic_lights.aasm.green")

    event :prepare do
      transitions from: :red, to: :yellow_to_green
      transitions from: :green, to: :yellow_to_red
    end

    event :go do
      transitions from: :yellow_to_green, to: :green
    end

    event :stop do
      transitions from: :yellow_to_red, to: :red
    end
  end
end
