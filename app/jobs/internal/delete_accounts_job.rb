class Internal::DeleteAccountsJob < ApplicationJob
  queue_as :scheduled_jobs

  def perform
    # No-op in single-tenant mode -- account deletion is not supported
  end
end
