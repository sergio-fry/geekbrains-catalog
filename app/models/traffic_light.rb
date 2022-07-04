class TrafficLight < ApplicationRecord
  include AASM

  aasm do
    state :red, initial: true
    state :yellow_to_green
    state :yellow_to_red
    state :green

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
