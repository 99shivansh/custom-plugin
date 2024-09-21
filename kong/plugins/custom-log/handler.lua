local BasePlugin = require "kong.plugins.base_plugin"
local kong = kong

local CustomLogHandler = BasePlugin:extend()

CustomLogHandler.PRIORITY = 10
CustomLogHandler.VERSION = "1.0.0"

-- Access phase: Capture request body
function CustomLogHandler:access(conf)
  CustomLogHandler.super.access(self)

  -- Get raw body
  local body = kong.request.get_raw_body()
  -- Store the body in Kong's shared context
  kong.ctx.shared.request_body = body
end

-- Log phase: Write log with request body
function CustomLogHandler:log(conf)
  CustomLogHandler.super.log(self)

  -- Get the stored request body
  local body = kong.ctx.shared.request_body

  -- Log the request body to the file
  local file = io.open(conf.path, "a")
  if file then
    file:write("Request Body: " .. (body or "No Body") .. "\n")
    file:close()
  else
    kong.log.err("Failed to open log file: " .. conf.path)
  end
end

return CustomLogHandler
