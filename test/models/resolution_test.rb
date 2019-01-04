require 'test_helper'

class ResolutionTest < ActiveSupport::TestCase
  DEFAULT_PARAMS = {
    title: "Goal 1",
    goal: 100,
    unit: "tests",
    start_date: Date.new(2019, 1, 1),
    end_date: Date.new(2019, 12, 31)
  }.freeze

  test "validates presence of title" do
    null_title = Resolution.new(DEFAULT_PARAMS.merge(title: nil))
    blank_title = Resolution.new(DEFAULT_PARAMS.merge(title: ""))
    assert_equal(null_title.save, false)
    assert_includes(null_title.errors.messages[:title], "can't be blank")
    assert_equal(blank_title.save, false)
    assert_includes(blank_title.errors.messages[:title], "can't be blank")
  end

  test "validates presence of goal" do
    null_goal = Resolution.new(DEFAULT_PARAMS.merge(goal: nil))
    assert_equal(null_goal.save, false)
    assert_includes(null_goal.errors.messages[:goal], "can't be blank")
  end

  test "validates presence of unit" do
    null_unit = Resolution.new(DEFAULT_PARAMS.merge(unit: nil))
    blank_unit = Resolution.new(DEFAULT_PARAMS.merge(unit: ""))
    assert_equal(null_unit.save, false)
    assert_includes(null_unit.errors.messages[:unit], "can't be blank")
    assert_equal(blank_unit.save, false)
    assert_includes(blank_unit.errors.messages[:unit], "can't be blank")
  end

  test "validates presence of start_date" do
    null_start_date = Resolution.new(DEFAULT_PARAMS.merge(start_date: nil))
    assert_equal(null_start_date.save, false)
    assert_includes(null_start_date.errors.messages[:start_date], "can't be blank")
  end

  test "validates presence of end_date" do
    null_end_date = Resolution.new(DEFAULT_PARAMS.merge(end_date: nil))
    assert_equal(null_end_date.save, false)
    assert_includes(null_end_date.errors.messages[:end_date], "can't be blank")
  end
end

