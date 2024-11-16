
+++
title = "Terminal emulators can display an alternate screen"
date = 2024-11-16T18:49:49

[extra]
author = "Victor Viale"

[taxonomies]
tags = ["terminal", "tui"]
+++

Terminal emulators like AlacriTTY, WezTerm or Rio (I use Tilix on Ubuntu) can _usually_ display an alternate screen that replaces the normal prompt. This is particularly useful for TUI applications like [Tig](https://jonas.github.io/tig/) or [dive](https://github.com/wagoodman/dive), which will use the entire terminal screen. When exited, the state of the terminal session will not have been discarded and you'll be able to keep doing whatever you were doing before!
