package = "custom-log"
version = "1.0-1"
rockspec_format = "1.1"
source = {
   url = "...",    
   dir = "."  -- If you have a repo for this plugin, otherwise leave as is
}
description = {
  summary = "Custom Log plugin for Kong",
  detailed = "A custom plugin for logging request bodies to a file.",
  homepage = "https://your-plugin-homepage",
  license = "MIT"
}
dependencies = {
  "lua >= 5.1",
  "kong >= 2.0"
}
build = {
  type = "builtin",
  modules = {
    ["kong.plugins.custom-log.handler"] = "kong/plugins/custom-log/handler.lua",
    ["kong.plugins.custom-log.schema"] = "kong/plugins/custom-log/schema.lua"
  }
}
