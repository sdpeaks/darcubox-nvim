local M = {}

function M.setup()
    local config = require("darcubox").config
    local p = require("darcubox.palette").palette

    local groups = {

        -- UI
        LineNr            = { fg = p.gray }, -- line numbers
        VertSplit         = { fg = p.gray }, -- space vertical divisions
        CursorLine        = { bg = p.windows },
        CursorColumn      = { link = 'CursorLine' },
        ColorColumn       = { bg = p.background },
        Directory         = { fg = p.gray_light },
        Conceal           = { fg = p.normal },
        CursorLineNr      = { fg = p.white },
        ErrorMsg          = { fg = p.error },
        WinSeparator      = { link = 'VertSplit' },
        SignColumn        = { link = 'ColorColumn' },
        IncSearch         = { fg = p.background, bg = p.yellow },
        Substitute        = { fg = p.bg, bg = p.cream },
        MatchParen        = { bg = p.purple },
        MoreMsg           = { fg = p.blue },
        NonText           = { fg = p.background },
        NormalFloat       = { link = 'Normal' },
        Search            = { bg = p.orange },
        StatusLine        = { fg = p.gray_light , bg = p.dark }, --
        TabLine           = { link = 'StatusLine' },
        TabLineSel        = { fg = p.background, bg = p.normal },
        Title             = { fg = p.white },
        Visual            = { bg = p.gray },
        WarningMsg        = { fg = p.warning_bg },
        Whitespace        = { fg = p.windows },
        DiffAdd      = { fg = p.green }, -- diff mode: Added line |diff.txt|
        DiffChange   = { fg = p.hint_bg }, -- diff mode: Changed line |diff.txt|
        DiffDelete   = { fg = p.red }, -- diff mode: Deleted line |diff.txt|
        DiffText      = { fg = p.yellow },
        diffAdded    = { link = "DiffAdd" },
        diffRemoved  = { link = "DiffDelete" },
        diffChanged  = { link = "DiffChange" },

        -- SYNTAX BUILT-I N
        Normal            = { bg = p.background, fg = p.normal }, -- non-highlighted text and background
        Comment           = { fg = p.gray_light }, -- comments
        Keyword           = { fg = p.orange },
        Conditional       = { link = 'Keyword' },
        Repeat            = { link = 'Keyword'},
        Constant          = { fg = p.green },
        Function          = { fg = p.normal },
        Identifier        = { fg = p.cream },
        Operator          = { fg = p.white },
        Parameter         = { fg = p.white },
        Delimiter         = { link = 'Parameter'},
        Field             = { fg = p.cream },
        Include           = { link = 'Keyword' },
        Namespace         = { fg = p.blue },
        PreProc           = { link = 'Operator' },
        Special           = { fg = p.normal },
        Statement         = { fg = p.yellow },
        String            = { link = 'Constant' },
        Type              = { fg = p.blue },
        Typedef           = { fg = p.purple },
        Warn              = { fg = p.red },
    }

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
