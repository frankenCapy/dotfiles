local M = {}

M.settings = {
  yaml = {
    customTags = {
      "!reference sequence"
    },
    schemas = {
      ["https://spec.openapis.org/oas/3.1/schema/2022-02-27"] = "/swagger.yaml",
      ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = "/.gitlab-ci.yml"
    }
  }
}

return M
