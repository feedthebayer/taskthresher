class Task < ActiveRecord::Base
  belongs_to :user

  def days_left
    6 - (Time.now.to_date - created_at.to_date).to_i
  end
end
