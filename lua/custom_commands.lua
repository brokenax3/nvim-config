--
-- Sort all Markdown Headers
--
local function extract_headers()
    local bufnr = vim.api.nvim_get_current_buf()
    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    local headers = {}
    for i, line in ipairs(lines) do
        local _, _, level, text = string.find(line, "^(#+) (.+)$")
        if level then
            table.insert(headers, { text = text, level = level, line_number = i })
        end
    end
    return headers
end

local function sort_headers(headers)
    table.sort(headers, function(a, b)
        return a.text:lower() < b.text:lower()
    end)
end

local function show_quicklist(headers)
    local items = {}
    for i, header in ipairs(headers) do
        table.insert(items, {
            bufnr = vim.api.nvim_get_current_buf(),
            lnum = header.line_number,
            text = header.level .. " " .. header.text,
            type = "markdown",
        })
    end
    vim.fn.setqflist({}, "r", { items = items })
end

function sort_headers_fun()
    local headers = extract_headers()
    -- sort_headers(headers)
    show_quicklist(headers)
end

vim.cmd([[
  command! SortMdHeaders lua sort_headers_fun()
  " command! ConvertMacAddress lua convert_mac()
]])

--
-- Formatting
--
vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })
