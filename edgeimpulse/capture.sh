#!/bin/sh
if [ -z "$VIDEO_DEVICE" ]; then
  DEVICE_STR=""
else
  DEVICE_STR="-d $VIDEO_DEVICE"
fi
while true
do
find $DIRECTORY -name "test.*.jpg" -mmin +1 -exec rm -rf {} \;
TIME=$(date +%s)
fswebcam -q -r 320x320 -S 3 -F 3 -D $DELAY $DEVICE_STR --no-banner --no-shadow --no-title $DIRECTORY/test.$TIME.jpg
#raspistill -o test.jpg
echo "took picture"
JSON_FMT='{"image":"%s"}\n'
JSON=$(printf "$JSON_FMT" "test.$TIME.jpg")
mosquitto_pub -h $HOST -p $PORT -t $TOPIC -m $JSON
done
