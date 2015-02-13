class Task < ActiveRecord::Base
  belongs_to :user

  def days_to_deletion
    7 - (DateTime.now.to_date - created_at.to_date).to_i
  end
end
