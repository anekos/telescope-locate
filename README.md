# telescope-rg

`telescope-rg` is an extension for [telescope.nvim][], which enables users to utilize [ripgrep (rg)](https://github.com/BurntSushi/ripgrep) within the telescope interface.

[telescope.nvim]: https://github.com/nvim-telescope/telescope.nvim
[ripgrep (rg)]: https://github.com/BurntSushi/ripgrep

# Setup

To load the extension, use the following command:

```lua
require('telescope').load_extension('rg')
```

# Usage

This will also register the search results in the quickfix list.

```vim
:Rg your-search-query
```

or

```vim
:Telescope rg query=your-search-query
```

## Pass extra command options to rg

```vim
:Telescope rg query=your-search-query type=py
:Rg! --type=py your-search-query
```

means

```shell
$ rg --type=py your-search-query
```
