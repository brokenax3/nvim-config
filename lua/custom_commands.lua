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

local function split_string(input_string, del)
    local t = {}
    for l_str in string.gmatch(input_string, "([^" .. del .. "]+)") do
        table.insert(t, l_str)
    end
    return t
end

-- local function reconstruct_mac(t_mac, del)
--     local tmp_mac = ""
--
--     if del == "." then
--         for idx, item in ipairs(t_mac) do
--             if idx % 2 == 1 then
--                 tmp_mac = tmp_mac .. item
--             elseif idx % 2 == 0 then
--                 tmp_mac = tmp_mac .. item .. del
--             end
--         end
--     else
--     end
--
--     return tmp_mac
-- end

function sort_headers_fun()
    local headers = extract_headers()
    -- sort_headers(headers)
    show_quicklist(headers)
end

-- function convert_mac()
--     local line = vim.fn.line(".")
--     local currentMacLine = vim.fn.getline(line)
--
--     local currentFormat = string.match(currentMacLine, ":") and ":" or "."
--     if currentFormat == ":" then
--         t_tmpMac = split_string(currentMacLine, ":")
--         newMacLine = reconstruct_mac(t_tmpMac, ".")
--     else
--         t_tmpMac = split_string(currentMacLine, ".")
--         newMacLine = reconstruct_mac(t_tmpMac, ":")
--     end
--
--     vim.fn.setline(line, newMacLine)
-- end

vim.cmd([[
  command! SortMdHeaders lua sort_headers_fun()
  " command! ConvertMacAddress lua convert_mac()
]])
