# config aliases  
alias rconf='exec zsh'
alias conf='\cd ~/.config/zsh; nvim ~/.config/zsh/.zshrc'
alias nconf='\cd ~/.config/nvim; nvim init.lua'
alias iconf='\cd ~/.config/i3; nvim config'
alias qconf='\cd ~/.config/qtile; nvim config.py'
alias dns='bat -pp /etc/resolv.conf'
alias pwd='print -P %~'
alias settings='python ~/repos/simple_settings_gui/settings_gui.py'
alias venv='source .venv/bin/activate && echo "Activated Virtual Environment with $(python --version)!"'
alias ql='cat ${QTILELOG}'


