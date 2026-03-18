#!/bin/bash
# Символи-іконки  (з Unicode, FontAwesome/Nerd Font)
# Отримуємо список активних застосунків
apps=$(hyprctl clients -j | jq -r '.[].class' | sort | uniq)

active_class=$(hyprctl activewindow -j | jq -r '.class')

# Мапінг застосунків на іконки:
get_icon() {
  case $1 in
    firefox) echo "" ;; # ""
    Alacritty) echo "";;
    code) echo "󰨞" ;;
    Spotify) echo "" ;;
    thunar) echo "" ;;
    com.viber.Viber) echo "✆" ;;
    org.telegram.desktop._8d75e56009471161594e8e9043903fd0) echo "➤" ;;
    discord) echo "D" ;;
    org.prismlauncher.PrismLauncher.desktop) echo "🌍" ;;
    peazip) echo "🔓" ;;
    steam) echo "λ" ;;
    blueman-manager) echo "♪ᛒ" ;;
    audacity.exe) echo "ᖰ♫ᖳ" ;;
    kitty) echo "";;
    com.obsproject.Studio) echo "🎞️" ;;
    org.pulseaudio.pavucontrol) echo "🔊♪" ;;
    # додавай свої мапінги тут
    *) echo "" ;; # іконка за замовчуванням
  esac
}

output=""
for app in $apps; do
  icon=$(get_icon $app)
  if [[ "$app" == "$active_class" ]]; then
    # Обертаємо іконку у тег span з кольором
    icon="<span foreground='orange'>$icon</span>"
  fi
  output+="$icon "
done

# Якщо рядок порожній — пишемо "Hyprland"
if [[ -z "$output" ]]; then
  output="Hyprland"
fi

echo "$output"

