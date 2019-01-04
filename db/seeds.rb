Resolution.create!(
  title: "Finish the resolution board app",
  goal: 1,
  unit: "application finished",
  start_date: "2018-1-1",
  end_date: "2018-12-31"
)

res = Resolution.create!(
  title: "Write 100 tests",
  goal: 100,
  unit: "tests",
  start_date: "2018-1-1",
  end_date: "2018-12-31"
)
Update.create!(
  date: "2018-12-15",
  progress: 1,
  note: "Wrote tests for resolutions",
  resolution: res
)
Update.create!(
  date: "2018-12-15",
  progress: 1,
  note: nil,
  resolution: res
)
