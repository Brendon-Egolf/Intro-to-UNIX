# Vim Tutorial

## Starting and Exiting Vim

### Starting Vim

To start vim run the command `vim` at the shell

### Save a File

To save a file run `:w`

### Exiting

To save and exit run `:wq` to exit without saving, run `:q!`

## Vim Modes

### Normal Mode

The default mode for vim, in this mode, all keys will create a movement or a command. A
movement preceded by a command will execute that command over the specified area of text.

### Visual Mode

When the cursor is moved in visual mode, the selected text will be highlighted. Any
commands that are called will be executed on the selected range, and then visual mode
will be exited back out to normal mode.

### Insert Mode

Anything that is typed will be inserted into the file. To return to normal mode one can
press `<esc>`.

## Vim Searching

To search through a file in vim one must use the `/` or `?` command. The `/` will search
for the regex specified forward, while `?` will do the same backward. For example
`/fishyChickenWidgets` will find the next instance of fishyChickenWidgets in the file. To
move to the next found result, one must use `n`, to go to the previous result, one must
use `N`.

## Moving the Cursor

To move the cursor in vim, one must use h, j, k, and l to move left, down, up, and right
respectively. Other movements include `w` for words, or `}` for paragraphs.

## Inserting & Deleting Text

To insert text you must simply enter insert mode and type the desired characters. To
delete text you have to use the `d` command and a movement to delete through the movement,
or select the text in visual mode and the run the `d` command.

## Cut, Copy, and Paste

To cut text you just have to delete the text you want to cut, it will automatically be
placed into the register. To copy it, you must use the `y` command and a movement, or
select the text with visual and then run the command. To paste the text you must use the
`p` command to paste after the current cursor position, or the `P` command to paste before
it.

## Insert Command Output in a Vim Text File

To insert the output of a command you must only run `:r !<command>`. For example `:r
!date` will insert the date at the current cursor position.

## The .exrc File

Commands put in the .exrc will be run anytime that vi is loaded. A great command to put
in it is `set nu` to display line numbers, or `set spell` to turn on spell check.
