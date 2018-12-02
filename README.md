# vim-sniplet

A tiny Vim plugin for abbreviation-based snippets.

## Installation

Copy the contents of `plugin` and `autoload` to `~/.vim` on UNIX-like systems,
or install with your favorite plugin manager.

## Usage

Use `:Sniplet` to define an abbreviation that will only expand with an explicit
keypress. Use it as you would use `:abbreviate`.

For example,

```vim
:Sniplet main public static void main(String[] args) {}
```

The expansion keypress is unbound by default. You can map it to whatever you
want using the `<Plug>SnipletExpand` mapping. For example,

```vim
imap <Tab> <Plug>SnipletExpand
cmap <Tab> <Plug>SnipletExpand
```

That way, your `main` Sniplet will only expand when you type `main<Tab>`.

You also have access to `:ISniplet` and `:CSniplet`, similar to `:iabbrev` and
`:cabbrev`.

Also, `:Sniplet <buffer>` and friends create buffer-local Sniplets (useful for
filetype-specific Sniplets).

## Tiny Vim Plugins

I have a set of functionality in my .vimrc that I intentionally implemented with
a minimalist philosophy.

I don't want a monolithic plugin to do all sorts of things for me all at once.
Instead, I want tiny plugins that do a single, specific task each.

This way I can compose several of these tiny plugins to achieve what I want,
while still allowing me to configure and leave out unwanted behavior. Moreover,
I can rely on other excellent tools that already exist!

## Licensing

This project is free and open source software, licensed under the MIT license.
You are free to use, modify, and redistribute this software.

Take a look at [Github's Choose a License page](https://choosealicense.com/licenses/mit/) for a bit more detail.
