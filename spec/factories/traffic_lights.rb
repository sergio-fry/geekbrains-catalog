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
FactoryBot.define do
  factory :traffic_light do
    address { "MyString" }
  end
end
