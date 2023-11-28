require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the four listed parsers should always be installed)
  ensure_installed = { 
	  "lua",
	  "vim", 
	  "help",
	  "javascript",
	  "typescript",
	  "php",
	  "rust",
	  "sql"
  },

  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,

    additional_vim_regex_highlighting = false,
  },
}
