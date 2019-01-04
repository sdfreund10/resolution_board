# frozen_string_literal: true

class Update < ApplicationRecord
  validates_presence_of %i(date progress)
  belongs_to :resolution

  def summary
    if note.blank?
      signed_progress
    else
      "#{note} #{signed_progress}"
    end
  end

  def signed_progress
    if progress.positive? 
      "+#{progress}"
    else
      progress.to_s
    end
  end
end

