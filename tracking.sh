url=`cat url` 
email="jimmeyotoole@gmail.com"


if [ ! -f "url" ]
then
    echo "A file called url does not exist. Create it and paste ur URL into it to being tracking"
    exit
fi

#adds a quick task to 'notify' the user
if [ ! -f "/usr/local/bin/notify"]
	echo '/usr/bin/osascript -e "display notification \"$*\""' > /usr/local/bin/notify
	chmod +x /usr/local/bin/notify
fi

echo Beginning Tracking of changes to $url

while true; do
	clear

	Date

	count=`wc -c output`
	curl $url > output
	aftercount=`wc -c output`
	echo "before $count"
	echo "After $aftercount" 
	if [ "$count" = "$aftercount" ]
		then

		echo File has not changed	
	else
		echo File has changed
		say oy mate zoh mah god seriously tracking has updated		
		echo "It has updated as of `Date` \n  " | mail -s "Dude check your tracking" $email
		notify tracking updated
	fi

	sleep 60
done
