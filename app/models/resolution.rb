# frozen_string_literal: true

class Resolution < ApplicationRecord
  validates_presence_of :title, :goal, :unit, :start_date, :end_date
  has_many :updates
  belongs_to :user

  def last_update
    updates.max_by(&:created_at)
  end

  def total_progress
    updates.sum(:progress)
  end

  def percentage_completed
    return 0 if goal.zero?

    (BigDecimal(total_progress) / BigDecimal(goal)) * 100
  end

  def complete?
    total_progress >= goal
  end
end
