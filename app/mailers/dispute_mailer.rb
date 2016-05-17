class DisputeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.dispute_mailer.dispute_activation.subject
  #
  def dispute_activation(dispute)
    @dispute = dispute
    mail to: dispute.respondent.email, subject: "You have been tagged in a dispute"
  end
end
