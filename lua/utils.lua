Util = {
    close_floats =function()
        for _, win in ipairs(vim.api.nvim_list_wins()) do
            if vim.api.nvim_win_get_config(win).relative == "win" then
            vim.api.nvim_win_close(win, false)
        end
    end
end
}

return Util