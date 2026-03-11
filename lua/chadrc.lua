-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "bearded-arc",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
-- }

M.ui = {
  statusline = {
   order ={"mode", "file" , "git" , "skk" , "%=" , "lsp_msg" ,"%=", "diagnostics" , "lsp" , "cwd"},
      modules = {
        skk = function()
          local ok,mode = pcall(vim.fn["skkeleton#mode"])
          if not ok then return ""end
          if mode == "hira" then
            return "%#StText# かな "
          elseif mode == "kata" then
            return "%#StText# カナ "
          else
            return ""
          end
        end,
      },
   }
}

return M
