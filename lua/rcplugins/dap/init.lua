-- require("nvim-dap-virtual-text").setup()
local dap, dapui = require("dap"), require("dapui")

dapui.setup()
-- dap.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

require("rcplugins.dap.settings.dap_go")