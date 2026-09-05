vim.notify = function() end
-- ──────────────────────────────────────────────────────────────────────
-- PINK SYNTAX & ACCENT OVERRIDES
-- ──────────────────────────────────────────────────────────────────────
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        local pink_main = "#f5c2e7"   -- Primary soft pink
        local pink_bright = "#f38ba8" -- Accent hot pink
        local pink_dim = "#cba6f7"    -- Mauve/lavender pink
        local pink_dark = "#eba0ac"   -- Warm pink
        local pink_visual = "#452d3d" -- Deep pink background

        -- Transparency
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
        vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })

        -- UI Elements
        vim.api.nvim_set_hl(0, "LineNr", { fg = pink_main, bg = "none" })
        vim.api.nvim_set_hl(0, "CursorLineNr", { fg = pink_bright, bg = "none", bold = true })
        vim.api.nvim_set_hl(0, "Visual", { bg = pink_visual, fg = "NONE" })

        -- Force Syntax Highlights to shades of Pink (stops "color vomit")
        vim.api.nvim_set_hl(0, "Keyword", { fg = pink_bright, bold = true })
        vim.api.nvim_set_hl(0, "Statement", { fg = pink_bright })
        vim.api.nvim_set_hl(0, "Function", { fg = pink_main })
        vim.api.nvim_set_hl(0, "String", { fg = pink_dark })
        vim.api.nvim_set_hl(0, "Constant", { fg = pink_dim })
        vim.api.nvim_set_hl(0, "Type", { fg = pink_main, italic = true })
        vim.api.nvim_set_hl(0, "Variable", { fg = "#cdd6f4" }) -- Soft whitish-pink for text readability
        vim.api.nvim_set_hl(0, "Identifier", { fg = pink_main })
        vim.api.nvim_set_hl(0, "Comment", { fg = "#6c7086", italic = true })
    end,
})

vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"

vim.keymap.set("v", "<C-y>", '"+y')
vim.keymap.set({ "i", "n", "v" }, "<C-p>", '"+p')
vim.keymap.set("c", "<C-v>", "<C-r>+")

-- ──────────────────────────────────────────────────────────────────────
-- LAZY.NVIM BOOTSTRAP
-- ──────────────────────────────────────────────────────────────────────
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

-- ──────────────────────────────────────────────────────────────────────
-- PLUGINS
-- ──────────────────────────────────────────────────────────────────────
require("lazy").setup({
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
                transparent_background = true,
                color_overrides = {
                    mocha = {
                        -- Mapping syntax hues strictly to pinks/reds/mauves
                        blue = "#f5c2e7",
                        cyan = "#f5c2e7",
                        green = "#eba0ac",
                        yellow = "#f38ba8",
                        orange = "#f38ba8",
                        magenta = "#f5c2e7",
                        purple = "#cba6f7",
                    },
                },
            })

            vim.cmd.colorscheme("catppuccin")
        end,
    },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },

        config = function()
            require("lualine").setup({
                options = {
                    theme = "catppuccin",
                },
            })
        end,
    },
})
