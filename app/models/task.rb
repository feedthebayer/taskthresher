class Task < ActiveRecord::Base
  belongs_to :user
  validates :description, presence: true
  validates :user, presence: true
  default_scope { order('created_at ASC') }

  def days_left
    6 - (Time.current.to_date - created_at.to_date).to_i
  end
end
