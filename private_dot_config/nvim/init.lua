-- nvim configuration file
--
-- Script initially created for vim and based on a script created by
-- Gerhard Gappmeier.
--
-- Then it was adapted to use my plugins, set them up, and set some
-- configuration I liked for vim/nvim.
--
-- This has finally turned into a modular lua config just for nvim.
--
-- Directory structure and some files are based on the dotfiles at
-- https://github.com/elianiva/dotfiles/blob/master/nvim/.config/nvim/lua.
--
-- @NOTE: This file is synced with dotfiles-external. Do not edit here!

require("modules.startup")
require("modules.options")
require("modules.mappings")
require("modules.commands")

require("bootstrap")
require("deps")

vim.cmd.colorscheme('tender')
