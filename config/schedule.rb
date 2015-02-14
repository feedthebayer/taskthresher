every 1.day, :at => '12:00 am' do
  rake 'task_thresher:delete_items'
end
