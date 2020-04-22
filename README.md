# QBasic Tower of Hanoi

This program renders a basic Tower of Hanoi setup on-screen, with discs labelled 1 to 4 in order of size. The user enters in a number, which lifts a disc off the pole, then enters the number of the pole to slot the free disc on.

## Rules
- A larger disc may not be placed on a smaller disc.
- One pole cannot have more than 4 discs.
- The game ends when the rightmost pole has all 4 discs stacked on it.

## Concept
- Each pole is represented by a shared multidimensional array, `stack`. The first dimension is the number of the pole, and the second dimension represents the slots on that pole.

- Each array is treated like a stack data structure, with `pop()` and `push()` functions written in. The `pop()` function also sets the value of the variable `openpiece`.

- `top` is another array which keeps track of the number of discs on each pole. Since we are writing the rules in such a way that a larger piece can never be stacked on top of a smaller piece, if the rightmost pole - `top(3)` - has a value of 4, that means there are 4 discs on the rightmost pole and the game is won.

- Drawing functions are written to render the poles and any discs that are on the poles.

- The program keeps running as long as `top(3)` is less than 4.

