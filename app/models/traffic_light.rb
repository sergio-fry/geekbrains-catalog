class CheckUpdatedAt
  def initialize(record)
    @record = record
  end

  def call
    @record.updated_at < 10.seconds.ago
  end
end

class TrafficLight < ApplicationRecord
  include AASM

  aasm do
    state :red, initial: true, display: I18n.t("traffic_lights.aasm.red")
    state :yellow_to_green, display: I18n.t("traffic_lights.aasm.yellow_to_green")
    state :yellow_to_red, display: I18n.t("traffic_lights.aasm.yellow_to_red")
    state :green, display: I18n.t("traffic_lights.aasm.green")

    event :prepare, guard: :updated_more_than_10_secs_ago? do
      transitions from: :red, to: :yellow_to_green, guard: CheckUpdatedAt
      transitions from: :green, to: :yellow_to_red, if: :updated_more_than_10_secs_ago?
    end

    event :go do
      transitions from: :yellow_to_green, to: :green, guard: :updated_more_than_10_secs_ago?
    end

    event :stop do
      transitions from: :yellow_to_red, to: :red, guard: :updated_more_than_10_secs_ago?
    end
  end

  def updated_more_than_10_secs_ago?
    updated_at < 10.seconds.ago
  end
end
