class ItemsMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.items_mailer.notify_user.subject
  #
  def notify_user(user, items)
    @user = user
    @items = items

    attachments.inline["logo.png"] =
      File.read(Rails.root.join("public/dog.jpeg"))

    mail to: @user.email, subject: I18n.t("items_mailer.notify_user.subject")
  end
end
