
# ~/.config/fish/config.fish

if status is-login
  clear
  fortune | cowsay -f tux
end

if status is-interactive
  set -U fish_greeting
  set -e LD_PRELOAD
  starship init fish | source
end
