An AutoHotkey script for farming your Island Sanctuary.

# Configuration

Follow the following instructions to configure your game client for use with this script.

## Movement

This script requires you to set your movement type to `Standard` in **Movement Settings**!

## Macros

This script requires the following custom macros to be setup in FFXIV:

### Acquire & auto run to target

- Default Binding (Recommended): `[Num3]` [^1]

```
/Merror off
/micon "Duty Action I"
/ac "Duty Action I"
/targetnpc
/lockon on
/automove on
```
[^1]: You can setup a different key binding, but you will need to [edit the following line](https://douglasparker.dev/-/snippets/1#LC25) in the AHK script.