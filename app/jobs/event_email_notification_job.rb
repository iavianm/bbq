class EventEmailNotificationJob < ApplicationJob
  queue_as :default

  def perform(object)
    event = object.event

    all_emails =
      (event.subscriptions.map(&:user_email) + [event.user.email]).uniq - [object.user&.email]

    case object
    when Comment
      all_emails.each { |mail| EventMailer.comment(event, object, mail).deliver_later }
    when Photo
      all_emails.each { |mail| EventMailer.photo(event, object, mail).deliver_later }
    end
  end
end
