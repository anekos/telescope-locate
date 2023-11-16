local picker = require('telescope-locate.picker')

local search_command = function (args)
  if args.bang then
    return picker({ args = args.args })
  else
    return picker({ query = args.args })
  end
end


vim.api.nvim_create_user_command(
  'Locate',
  search_command,
  {
    nargs = "*",
    bang = true,
  }
)
