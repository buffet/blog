---
title: "Introducing Oyster"
date: 2020-09-06T15:18:07Z
last-edited: 2020-09-10T16:06:13Z
---

Prescript:
I king of forgot to mention that I'm talking about a Wayland compositor.
You would be able run it either standalone, or as a window in your existing setup, maybe fullscreened in a workspace or something.

For quite a while I had this idea to somehow make the shell and the terminal play together, by printing information hidden in escape sequences between commands.
While I was sure that this could improve my workflow, I couldn't really find any interesting things to do with this, besides having all commands run as seperate units, potentially giving me a new prompt while the old command is still running.
Originally this seemed like a stupid idea---it'd get in your way and barely offer anything.
However, taking this idea further I ended up where I am now.

I went in the direction of "what if every command, and it's output behaved like cells in a spreadsheet".
That would mean that I could reuse command outputs in other commands (as files), and that I could change and rerun the individual commands as I wish.
Taking that idea further I can preprocess commands before running them, splitting commands on pipes, and putting those in seperate units next to each other as well.
This would serve a similar purpose as [Pipr](https://github.com/elkowar/pipr), as you could change any part of the command chain, and it would only need to re-run that command, and all depending on it.
Additionally, you could see the output of each step of the pipeline, which might help debugging something.

Lastly, one of the first ideas I actually had was seperation of stdout and stderr on the different cells.
This will likely end up not being the default, so that each cell is in one of three modes---show both, show stdout, show stderr.

While this would work amazing with just CLI stuff, it brings up the issue of dealing with GUI and TUI apps.
I'm not exactly sure how to solve that issue just yet.
I could detect TUI apps by checking for the escape sequences to trigger the alternate buffer mostly, and then could have GUI apps behave similarily with window swallowing.
This leads to both text editors and your web browser to slowly scroll off screen, which is likely not what you want.
