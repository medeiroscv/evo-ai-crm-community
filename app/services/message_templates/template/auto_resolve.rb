class MessageTemplates::Template::AutoResolve
  pattr_initialize [:conversation!]

  def perform
    account = Account.first
    return if account&.auto_resolve_message.blank?

    ActiveRecord::Base.transaction do
      conversation.messages.create!(auto_resolve_message_params(account))
    end
  end

  private

  delegate :contact, to: :conversation

  def auto_resolve_message_params(account)
    {
      inbox_id: @conversation.inbox_id,
      message_type: :template,
      content: account.auto_resolve_message
    }
  end
end
