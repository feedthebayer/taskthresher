namespace :task_thresher do
  desc "Delete items older than seven days"
  task delete_items: :environment do
    Task.where("created_at < ?", Time.current.midnight - 6.days).destroy_all
  end
end
