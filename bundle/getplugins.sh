hg clone https://bitbucket.org/sjl/splice.vim splice

git clone https://github.com/Valloric/YouCompleteMe.git YouCompleteMe
cd YouCompleteMe
git submodule update --init --recursive
./install.py --clang-completer
cd ..

git clone https://github.com/embear/vim-localvimrc.git

git clone https://github.com/mileszs/ack.vim.git

git clone https://github.com/tpope/vim-fugitive.git

#Don't use FuzzyFinder for now
#hg clone https://bitbucket.org/ns9tks/vim-l9
#hg clone https://bitbucket.org/ns9tks/vim-fuzzyfinder
