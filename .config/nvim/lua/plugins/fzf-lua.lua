return {
  "ibhagwan/fzf-lua",
  opts = {
    winopts = {
      width = 0.95,
      height = 0.95,
    },
    grep = {
      rg_glob = true,
      -- first returned string is the new search query
      -- second returned string are (optional) additional rg flags
      -- @return string, string?
      rg_glob_fn = function(query, opts)
        local regex, flags = query:match("^(.-)%s%-%-%s(.*)$")
        -- If no separator is detected will return the original query
        return (regex or query), flags
      end,
    },
  },
}
