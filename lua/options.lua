vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")
vim.cmd("set clipboard=unnamedplus")
vim.keymap.set("n", "<F9>", function()
    local ext = vim.bo.filetype
    local compiled = vim.fn.expand("%:r")
    local file = vim.fn.expand("%")
    local cmd = nil

    if ext == "cpp" then
        cmd = string.format("g++ -g -O0 %s -o %s", file, compiled)
    elseif ext == "c" then
        cmd = string.format("gcc -g -O0 %s -o %s", file, compiled)
    elseif ext == "java" then
        cmd = string.format("javac %s", file)
    elseif ext == "kotlin" then
        cmd = "kotlinc *.kt -include-runtime -d Main.jar"
    else
        return
    end
    vim.cmd("! " .. cmd)
end)

vim.g.mapleader = " "
