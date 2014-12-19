#!/bin/sh
objectdir="/data/www/OMdemo"
/usr/local/bin/inotifywait -mrq --exclude "(static|logs|shell|\.swp|\.swx|\.pyc|\.py\~)" --timefmt '%d/%m/%y %H:%M' --format '%T %w%f' --event modify,delete,move,create,attrib ${objectdir} | while read files
do
        echo $files >> /tmp/inotifywait.log
        /bin/touch /data/www/OMdemo/shell/reload.file
        continue
done &
