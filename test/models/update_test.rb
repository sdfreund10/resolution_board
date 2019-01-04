# frozen_string_literal: true

require 'test_helper'

class UpdateTest < ActiveSupport::TestCase
  def setup
    @base_resolution = Resolution.new(
      title: "Goal 1",
      goal: 100,
      unit: "tests",
      start_date: Date.new(2019, 1, 1),
      end_date: Date.new(2019, 12, 31)
    )
  end

  test "validates presence of incremenet" do
    update = Update.new(resolution: @base_resolution, progress: nil, date: Date.new(2019, 1, 1))
    assert_equal(update.save, false)
    assert_includes(update.errors.messages[:progress], "can't be blank")
  end

  test "validates presence of date" do
    update = Update.new(resolution: @base_resolution, progress: 0, date: nil)
    assert_equal(update.save, false)
    assert_includes(update.errors.messages[:date], "can't be blank")
  end
end

