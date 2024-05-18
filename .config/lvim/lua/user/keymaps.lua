-- Insert --
-- Press jk fast to exit insert mode
lvim.keys.insert_mode["jk"] = "<ESC>"

-- Visual Block --
-- Move text up and down
lvim.keys.visual_mode["J"] = ":move '>+1<CR>gv-gv"
lvim.keys.visual_mode["K"] = ":move '<-2<CR>gv-gv"
