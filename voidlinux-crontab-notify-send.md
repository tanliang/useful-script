# voidlinux sudo crontab notify-send
```shell
# according to gemini
yourusername@void ~> sudo crontab -l
Password: 
40 0 * * * shutdown -h +10 "system will be shutdown in 10 minutes"
40 0 * * * sudo -u yourusername DBUS_SESSION_BUS_ADDRESS=$(cat /tmp/dbus) notify-send "system shutdown" "system will be shutdown in 10 minutes." -i dialog-warning
```

since void-linux has dynamic $DBUS_SESSION_BUS_ADDRESS
you need to echo it in your shell init script
my shell is fish
```shell
yourusername@void ~> cat .config/fish/config.fish 
...
echo $DBUS_SESSION_BUS_ADDRESS >/tmp/dbus
```
now you need go to Settings -> Session and Startup -> Application Autostart -> +Add
```shell
Name: TerminalEmulator
Command: exo-open --launch TerminalEmulator
```
