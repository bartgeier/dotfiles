# dotfiles

Managed with [GNU Stow](https://www.gnu.org/software/stow/). Each top-level directory is a stow package; run `stow <package>` from this directory to symlink it into `$HOME`.

## Notes

- **`hypr/.config/hypr/monitors.lua` is intentionally excluded.** It hardcodes this machine's monitor port names (e.g. `HDMI-A-1`, `DP-1`) and workspace-to-monitor pinning, so it won't apply to a different machine's hardware anyway. On a new machine, Omarchy seeds a generic default `monitors.lua` on its own (from `/usr/share/omarchy/config/hypr/monitors.lua`) — nothing is missing, it just starts from that default instead of this machine's custom two-monitor setup. Re-add workspace pinning by hand per machine if needed.
