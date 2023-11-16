local telescope = require('telescope')

local picker = require('telescope-locate.picker')

return telescope.register_extension({
  -- setup = function(ext_conf, conf) end,
  exports = {
    locate = picker,
  },
})
