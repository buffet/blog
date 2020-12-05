---
title: "AoC 2020 (Day 3): Toboggan Trajectory"
date: 2020-12-03T23:22:16Z
tags: ["aoc", "vim"]
---

This contains spoilers for the third day of the 2020 [Advent of Code](https://adventofcode.com/).


## The Challenge

Our input is a map showing us the exact position of all trees in the area.
Our toboggan always moves down 1 row, and 3 rows to the right.
The pattern repeats infinitely, so if we go off the right side we come back on the left.
We're supposed to count the number of trees (represented by `#`) we collide with on our way down.


## The Solution

I really wanted to start using the fact that I'm using an editor.
So instead of just counting through the arrays, or moving the cursor one down and three to the right until we reach the end, I decided to load the input into the buffer, and then move each line to the left until the path is just straight down.

For the repetition it should be enough to paste the code a bunch of times; 50 should be more than enough, so we end up with something like this (note that the `^V` is a literal control-v character):

```vim
read day03/input
norm kkd^VG$y50P
```

To move all the lines over to the left, it's the easiest to just use visual block mode and delete the first 3 characters at the beginning of all lines, go one line down, repeat that, one line down, etc.

```vim
norm j^VGllx
```

At that point I realized that I had no idea where I was even going with that, as I still didn't want to count.
My current solution removes all except the first one in each line, merges all lines into one, while deleting all `.`s, and then outputs the length of the line.

Here's the entire code:

```vim
read day03/input
norm kdd^VG$y50P

let s:i = 0
while s:i < line('$') - 1
    norm j^VGllx
    let s:i += 1
endwhile

norm ggl^VG$x  " alternatively %s/\(.\).*/\1/
%s/[\n.]\+//g
echo strwidth(getline("."))
```
