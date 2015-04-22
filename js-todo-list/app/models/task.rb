class Task < ActiveRecord::Base

  validates :description, presence: true

  def self.swap(task, direction)
    return if task.placement == 0 ||task.placement == Task.count -1
      current_place = Task.placement
      other_task = Task.find_by(placement: current_place + direction)
      other_place = other_task.placement

end
