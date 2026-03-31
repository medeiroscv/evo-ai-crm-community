class Labels::UpdateJob < ApplicationJob
  queue_as :default

  def perform(new_label_title, old_label_title, _account_id = nil)
    Labels::UpdateService.new(
      new_label_title: new_label_title,
      old_label_title: old_label_title
    ).perform
  end
end
