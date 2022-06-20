class CategoryPdfJob < ApplicationJob
  queue_as :default

  def perform(category)
    sleep 3
    Rails.logger.info "PDF generated for category #{category.id}"
  end
end
