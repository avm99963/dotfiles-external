# battery

Show battery info.

## Example

```
⚡90% (4.0 hours)
```

## Dependencies

* `upower`

## Config

```
[battery]
command=$SCRIPT_DIR/battery
interval=30
LABEL=BAT
#LABEL=⚡
#BAT_NUMBER=0
```
