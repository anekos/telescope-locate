# telescope-locate

`telescope-locate` is an extension for [telescope.nvim][], which enables users to utilize locate command within the telescope interface.

[telescope.nvim]: https://github.com/nvim-telescope/telescope.nvim

# Setup

To load the extension, use the following command:

```lua
require('telescope').load_extension('locate')
```

# Usage

```vim
:Locate your-search-query
```

or

```vim
:Telescope locate query=your-search-query
```

## Pass extra command options to locate

```vim
:Telescope locate query=your-search-query nofollow=1
:Locate! --nofollow your-search-query
```

means

```shell
$ locate --nofollow your-search-query
```
