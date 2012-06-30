[ -s "/etc/xprofile" ] && . "/etc/xprofile"
[ -s "$HOME/.xprofile" ] && . "$HOME/.xprofile"

case $1 in
  awesome|*) exec awesome;;
esac

# vim: se ft=sh:
