local actions = require('telescope.actions')
local finders = require('telescope.finders')
local pickers = require('telescope.pickers')
local state = require('telescope.actions.state')

local conf = require('telescope.config').values
local cache = {}

local entry_maker = function(filename)
  return {
    value = filename,
    display = filename,
    ordinal = filename,
    path = filename,
  }
end

local make_command = function(opts)
  if opts.args then
    return 'locate ' .. opts.args
  end

  local query = opts.query
  if query == nil or query == '' then
    query = vim.fn.input('locate: ', '')
  end

  if query == nil or query == '' then
    return nil
  end

  return 'locate -- ' .. vim.fn.shellescape(query)
end

return function(opts)
  opts = opts or {}

  local command = make_command(opts)

  if command == nil then
    return
  end

  local result
  if cache[command] ~= nil then
    result = cache[command]
  else
    result = vim.fn.systemlist(command)
    cache[command] = result
  end

  pickers
    .new(opts, {
      prompt_title = 'locate - ' .. (opts.query or opts.args),
      finder = finders.new_table {
        results = result,
        entry_maker = entry_maker,
      },
      sorter = conf.file_sorter(opts),
      previewer = conf.grep_previewer(opts),
      attach_mappings = function(prompt_bufnr, _)
        actions.select_default:replace(function()
          actions.close(prompt_bufnr)
          local filename = state.get_selected_entry().value
          vim.cmd('edit ' .. filename)
        end)
        return true
      end,
    })
    :find()
end
