return {
        'ggml-org/llama.vim',
        init = function()
            vim.g.llama_config = {
                n_prefix = 1024,
                n_suffix= 1024,
                auto_fim = false,
            }
        end,
    }
