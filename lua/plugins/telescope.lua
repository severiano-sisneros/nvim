return {
    -- It is suggested to either use the latest release tag or our release branch (which will get consistent updates) 0.1.x.
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim',
                        "BurntSushi/ripgrep",
                        "sharkdp/fd",
        }
    }

