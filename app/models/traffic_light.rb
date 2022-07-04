class TrafficLight < ApplicationRecord
  include AASM

  aasm do
    state :red, initial: true
    state :yellow_to_green
    state :yellow_to_red
    state :green

    event :prepare_to_go do
      transitions from: :red, to: :yellow_to_green
    end

    event :go do
      transitions from: :yellow_to_green, to: :green
    end

    event :prepare_to_stop do
      transitions from: :green, to: :yellow_to_red
    end

    event :stop do
      transitions from: :yellow_to_red, to: :red
    end
  end
end
