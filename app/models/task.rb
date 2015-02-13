class Task < ActiveRecord::Base
  belongs_to :user

  def days_to_deletion
    7 - (Time.now - self.created_at).to_i / 1.day
  end
end
