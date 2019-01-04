require "application_system_test_case"

class ResolutionsTest < ApplicationSystemTestCase
  def setup
    @res1 = Resolution.create!(
      title: "Do Nothing",
      goal: 0,
      unit: "Activities",
      start_date: Date.new(2019, 1, 1),
      end_date: Date.new(2019, 1, 31)
    )

    @res2 = Resolution.create!(  
      title: "Goal 1",
      goal: 100,
      unit: "tests",
      start_date: Date.new(2019, 1, 1),
      end_date: Date.new(2019, 12, 31)
    )
    [10, 25].each do |num|
      Update.create!(
        resolution: @res2,
        progress: num,
        date: Date.new(2019, 1, num),
        note: "Wrote #{num} tests"
      )
    end
  end

  test "renders card for each resolution" do
    visit resolutions_url
    assert_equal(all('div.resolution-card').count, Resolution.count)
  end

  test "displays bar with progress" do
    visit resolutions_url
    all("div.resolution_card").map do |card|
      children = card.children
      title = children.find('div.goal-title').text
      completed = children.find('div.completed-bar').native.css_value('width')
      selected_resolution = @res1.title == title ? @res1 : @res2
      assert_equal(selected_resolution.percentage_completed, completed[0..-1].to_f)
    end
  end
end
