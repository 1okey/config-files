vim.api.nvim_create_user_command('Reload', function()
  dofile(vim.env.MYVIMRC)

  vim.print("Reloading user configs")
  for name,_ in pairs(package.loaded) do
    if name:match('^user') then
      package.loaded[name] = nil
      require(name)
    end
  end
end , {})
