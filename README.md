# dotfiles

In late 2022, I switched to using macOS only. The Linux config remains here,
but I have adjusted some files to assume BSD utilities instead of the GNU
ones found in most Linux distributions.

MacBook Air (2020): macOS, zsh, nvim, Amethyst, iTerm2

ThinkPad 13 (2017): Arch Linux, zsh, nvim, [dwm](https://dwm.suckless.org/),
[st](https://st.suckless.org/)

\* * *

> A tool should be ambient. It disappears and flows through your actions. You
> should never need it because it’s always at your hands. You should never
> ignore it because it’s never in your way.

— [Hunor Karamán](https://archive.hex22.org/wiki/manifesto/)

## dwm

For my Linux machine, I use a tiling window manager called dwm. It’s mostly
stock except for the following patches:

- [fullgaps](https://dwm.suckless.org/patches/fullgaps/)
  - I added a shortcut to reset the gaps
- [solarized](https://github.com/johnjago/dotfiles/blob/main/dwm/patches/dwm-solarized-6.2.diff)
  - This is my own patch that changes a few colors, including dmenu colors, to
    match Solarized Light
- Font is set to Source Code Pro (though I could probably do this with
  fontconfig)
- The tag numbers are in CJK characters
- Firefox doesn’t stick to the 9th tag
- The default window split is 50/50 instead of 55/45
- Monocle layout is second instead of third
- Keyboard shortcuts for changing brightness ("Windows" key + up/down) and
  audio (alt + up/down) without having to reach for the multimedia keys
- Keyboard shortcut for locking the screen with slock ("Windows" key + l)

If you’re new to dwm, [Dave's Visual Guide to dwm](https://ratfactor.com/dwm)
is a great reference.

## Screenshots

I’m a big fan of the [Solarized](https://ethanschoonover.com/solarized/) color
scheme.

### Linux

The typeface in the terminal, status bar, and code editor is Source Code Pro.

![](screenshots/linux-1.png)

![](screenshots/linux-2.png)

### Mac

![](screenshots/mac-1.png)

![](screenshots/mac-2.png)

## Resources

- The [ArchWiki](https://wiki.archlinux.org/title/Table_of_contents) is an
  invaluable reference for all Linux distros, not just Arch.
- Vim is something you’ll encounter a lot in Linux, but it can be confusing.
  [This is my favourite cheatsheet](https://vim.rtorr.com/).
