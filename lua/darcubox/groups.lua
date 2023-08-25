local M = {}

function M.setup()
    local config     = require("darcubox").config
    local p          = require("darcubox.palette").palette

    local background = config.options.transparent and "NONE" or p.background

    local groups     = {

        -- ui elements
        Normal       = { bg = background, fg = p.foreground },
        NormalFloat  = { link = 'Normal' },
        LineNr       = { fg = p.gray },
        VertSplit    = { fg = p.gray },
        CursorLine   = { bg = p.windows },
        CursorColumn = { link = 'CursorLine' },
        ColorColumn  = { bg = background },
        Directory    = { fg = p.gray_light },
        CursorLineNr = { fg = p.white },
        WinSeparator = { link = 'VertSplit' },
        SignColumn   = { link = 'ColorColumn' },
        TabLine      = { link = 'StatusLine' },
        TabLineSel   = { fg = p.gray_dark, bg = p.foreground },
        Title        = { fg = p.white },
        StatusLine   = { fg = p.gray_light, bg = p.gray_dark },
        Visual       = { bg = p.gray },
        Conceal      = { fg = p.foreground },
        IncSearch    = { fg = p.gray_dark, bg = p.mustard },
        Substitute   = { fg = p.gray_dark, bg = p.yellow },
        MatchParen   = { bg = p.purple },
        NonText      = { fg = background },
        Search       = { bg = p.orange, fg = p.gray_dark },
        Whitespace   = { fg = p.windows },
        Pmenu        = { bg = p.windows, fg = p.foreground },
        PmenuSel     = { bg = p.gray, fg = p.white },
        PmenuSbar    = { bg = p.gray, fg = p.gray_light },
        PmenuThumb   = { bg = p.white, fg = p.white },

        -- syntax
        Comment      = { fg = p.gray_light },
        Keyword      = { fg = p.orange },
        Conditional  = { link = 'Keyword' },
        Repeat       = { link = 'Keyword' },
        Constant     = { fg = p.green },
        Function     = { fg = p.foreground },
        Identifier   = { fg = p.yellow },
        Operator     = { fg = p.white },
        Parameter    = { fg = p.white },
        Delimiter    = { link = 'Parameter' },
        Field        = { fg = p.yellow },
        Include      = { link = 'Keyword' },
        Namespace    = { fg = p.sky },
        PreProc      = { link = 'Operator' },
        Special      = { fg = p.foreground },
        Statement    = { fg = p.mustard },
        String       = { link = 'Constant' },
        Type         = { fg = p.sky },
        Typedef      = { fg = p.purple },
        Warn         = { fg = p.red },

        -- alerts
        ErrorMsg     = { fg = p.error },
        MoreMsg      = { fg = p.sky },
        WarningMsg   = { fg = p.warning_bg },

        -- git
        DiffAdd      = { fg = p.green },
        DiffChange   = { fg = p.hint_bg },
        DiffDelete   = { fg = p.red },
        DiffText     = { fg = p.mustard },
        diffAdded    = { link = 'DiffAdd' },
        diffRemoved  = { link = 'DiffDelete' },
        diffChanged  = { link = 'DiffChange' },
    }

    -- apply userconfig
    groups.Comment   = vim.tbl_extend("keep", groups.Comment, config.options.styles.comments)
    groups.Function  = vim.tbl_extend("keep", groups.Function, config.options.styles.functions)
    groups.Keyword   = vim.tbl_extend("keep", groups.Keyword, config.options.styles.keywords)
    groups.Statement = vim.tbl_extend("keep", groups.Statement, config.options.styles.statement)
    groups.Type      = vim.tbl_extend("keep", groups.Type, config.options.styles.type)

    for group, hl in pairs(config.overrides) do
        if groups[group] then
            -- "link" should not mix with other configs (:h hi-link)
            groups[group].link = nil
        end

        groups[group] = vim.tbl_extend("force", groups[group] or {}, hl)
    end

    return groups
end

return M
