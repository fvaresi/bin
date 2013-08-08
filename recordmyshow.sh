#!/bin/bash
#URL="http://usa15.ciudaddigital.com.uy:8000/carve?type=flash&type=mp3&showdigits=true&image=rar.gif&autostart=true"
URL="http://usa15.ciudaddigital.com.uy/medios/CristalAM/audio/directo.pls"
FILENAME="/media/Datos/audicion/$(date +"%Y%m%d_%H%M").mp3"
LOG="$HOME/recordmyshow.log"

echo "[$(date +"%Y-%m-%d %H:%M:%S")] Stopping all torrents" >>$LOG
transmission-remote -tall --stop

echo "[$(date +"%Y-%m-%d %H:%M:%S")] Started recording $URL" >>$LOG
cvlc --quiet --run-time=7200 $URL --sout "#standard{access=file,mux=raw,dst=$FILENAME}" vlc://quit
#cvlc --quiet --run-time=7200 $URL --sout "#standard{access=file,mux=asf,dst=$FILENAME}" vlc://quit
echo "[$(date +"%Y-%m-%d %H:%M:%S")] Stopped recording" >>$LOG

echo "[$(date +"%Y-%m-%d %H:%M:%S")] Starting all torrents" >>$LOG
transmission-remote -tall --start