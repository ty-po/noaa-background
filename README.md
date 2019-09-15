# noaa-background


## Setup

clone me

`sudo bundler install`

Probably some other shit here too

into `crontab -e` put. **Make sure to include a newline after this line so the command actually executes**
```*/1 * * * * export DISPLAY=:0 ; ~/noaa-background/main.rb >> ~/log.log 2>&1```

