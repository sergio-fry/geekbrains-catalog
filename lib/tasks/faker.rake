namespace :faker do
  task all: :environment do
    FakeData.new(multiplier: ENV.fetch("FAKER_MULTIPLIER", 1).to_i).generate
  end
end
