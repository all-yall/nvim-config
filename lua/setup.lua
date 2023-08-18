local home = os.getenv("HOME")
local paq_loc = home .. "/.local/share/nvim/site/pack/paqs/start/paq-nvim/"
local paq_folder = io.open(paq_loc, "r")

if not paq_folder then
  -- paq not installed, so install it
  os.execute("git clone --depth=1 https://github.com/savq/paq-nvim.git '" .. paq_loc .. "'")
  require("core.packages")
  owo.paq.install()
else
  -- paq is already installed
  io.close(paq_folder)
end

