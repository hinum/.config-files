return {
  "ptdewey/pendulum-nvim",
  opts = {
    gen_reports = true,
    report_excludes = {
      filetype = {
        "neo-tree", -- Exclude neo-tree filetype
      },
      project = {
        "unknown_project" -- Exclude unknown (non-git) projects
      },
    },
  }
}
