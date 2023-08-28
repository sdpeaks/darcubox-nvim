local M = {}

function M.setup()
    local config     = require("darcubox").config
    local p          = require("darcubox.palette").palette

    local background = config.options.transparent and "NONE" or p.background

    local groups     = {

        -- ui elements
        Normal             = { bg = background, fg = p.foreground },
        NormalFloat        = { link = 'Normal' },
        LineNr             = { fg = p.surface2 },
        VertSplit          = { fg = p.surface2 },
        CursorLine         = { bg = p.surface1 },
        CursorColumn       = { link = 'CursorLine' },
        ColorColumn        = { bg = background },
        Directory          = { fg = p.silver },
        CursorLineNr       = { fg = p.alabaster },
        WinSeparator       = { link = 'VertSplit' },
        SignColumn         = { link = 'ColorColumn' },
        TabLine            = { link = 'StatusLine' },
        TabLineSel         = { fg = p.black, bg = p.foreground },
        Title              = { fg = p.alabaster },
        StatusLine         = { fg = p.silver, bg = p.black },
        Visual             = { bg = p.surface2 },
        Conceal            = { fg = p.foreground },
        IncSearch          = { fg = p.black, bg = p.gold },
        Substitute         = { fg = p.black, bg = p.sunshine },
        MatchParen         = { bg = p.gold, fg = p.black },
        NonText            = { fg = background },
        Search             = { bg = p.ember, fg = p.black },
        Whitespace         = { fg = p.surface1 },
        Pmenu              = { bg = p.surface1, fg = p.foreground },
        menuSel            = { bg = p.surface2, fg = p.alabaster },
        PmenuSbar          = { bg = p.surface2, fg = p.silver },
        PmenuThumb         = { bg = p.white, fg = p.alabaster },
        Number             = { fg = p.lime },
        Float              = { link = "Number" },
        Boolean            = { link = "Number" },

        -- syntax
        Comment            = { fg = p.silver },
        Keyword            = { fg = p.ember },
        Conditional        = { link = 'Keyword' },
        Repeat             = { link = 'Keyword' },
        Constant           = { fg = p.meadow },
        Function           = { fg = p.foreground },
        Identifier         = { fg = p.sunshine },
        Operator           = { fg = p.alabaster },
        Parameter          = { fg = p.alabaster },
        Delimiter          = { link = 'Parameter' },
        Field              = { fg = p.sunshine },
        Include            = { link = 'Keyword' },
        Namespace          = { fg = p.sapphire },
        PreProc            = { link = 'Operator' },
        Special            = { fg = p.foreground },
        Statement          = { fg = p.gold },
        String             = { link = 'Constant' },
        Type               = { fg = p.sapphire },
        Typedef            = { fg = p.lilac },
        Warn               = { fg = p.crimson },

        -- alerts
        ErrorMsg           = { fg = p.error },
        MoreMsg            = { fg = p.sapphire },
        WarningMsg         = { fg = p.warning_bg },

        -- git
        DiffAdd            = { fg = p.meadow },
        DiffChange         = { fg = p.hint_bg },
        DiffDelete         = { fg = p.crimson },
        DiffText           = { fg = p.gold },
        diffAdded          = { link = 'DiffAdd' },
        diffRemoved        = { link = 'DiffDelete' },
        diffChanged        = { link = 'DiffChange' },

        ["@tag"]           = { fg = p.gold },  -- Tags like html tag names.
        ["@tag.attribute"] = { fg = p.sand },  -- Tags like html tag names.
        ["@tag.delimiter"] = { fg = p.gold },  -- Tag delimiter like < > /
        ["@constructor"]   = { fg = p.gold },  -- Tag delimiter like < > /
        ["@property"]      = { fg = p.gold },  -- Tag delimiter like < > /
    }

    -- apply userconfig
    groups.Comment   = vim.tbl_extend("keep", groups.Comment, config.options.styles.comments)
    groups.Function  = vim.tbl_extend("keep", groups.Function, config.options.styles.functions)
    groups.Keyword   = vim.tbl_extend("keep", groups.Keyword, config.options.styles.keywords)
    groups.Type      = vim.tbl_extend("keep", groups.Type, config.options.styles.types)

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
