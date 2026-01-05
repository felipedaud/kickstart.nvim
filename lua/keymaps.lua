
-- Buffers
local function close_current_buffer()
    local buffers = vim.fn.getbufinfo({ buflisted = 1 })

    if #buffers > 1 then
        vim.cmd("bnext")
        vim.cmd("bd #")
    else
        vim.cmd("confirm qa")
    end
end

vim.keymap.set("n", "<leader>w", function() close_current_buffer() end, { desc = "Close buffer" })






-- Tabs
local function goto_or_create_tab(n)
    local total_tabs = vim.fn.tabpagenr("$")

    if total_tabs < n then
        vim.cmd("tabnew")
    end

    vim.cmd("tabnext " .. n)
end

vim.keymap.set("n", "<leader>1", function() goto_or_create_tab(1) end)
vim.keymap.set("n", "<leader>2", function() goto_or_create_tab(2) end)
vim.keymap.set("n", "<leader>3", function() goto_or_create_tab(3) end)






-- For conciseness
local opts = { noremap = true, silent = true }

-- save file
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>', opts)

-- quit file
vim.keymap.set('n', '<C-q>', '<cmd> q <CR>', opts)

-- delete single character without copying into register
vim.keymap.set('n', 'x', '"_x', opts)

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)


-- Buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)



-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', opts)

