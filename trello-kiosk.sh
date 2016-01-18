# Trello login url with redirection to Trello dashboard.
TRELLO_URL=https://trello.com/login?returnUrl=$1

# The amount of time to sleep after the browser opened. If your internet connection is slow, increase this time. Otherwise, you could decrease it.
BROWSER_START_TIME=45s

# Sleep time between typing.
SLEEP_TYPE_TIME=1s

# Trello Username
USERNAME=$2

# Trello Password
PASSWORD=$3

# Start the Epiphany browser and show the login dialog.
sudo -u pi epiphany-browser -a -i --profile ~/.config $TRELLO_URL --display=:0 &

# Wait for some time after the browser loaded the Trello login dialog.
sleep $BROWSER_START_TIME;

# Press F11 in Epiphany in order to display Trello in fullscreen mode.
xte "key F11" -x:0
sleep $SLEEP_TYPE_TIME;

# Press CTRL + - in order to decrease the zoom.
xte "keydown Control_L" "str -" "keyup Control_L" -x:0
sleep $SLEEP_TYPE_TIME;

# Type in your Trello username.
xte "str $USERNAME" -x:0
sleep $SLEEP_TYPE_TIME;

# Go with tab to the password field.
xte "key Tab" -x:0
sleep $SLEEP_TYPE_TIME;

# Type in your Trello password.
xte "str $PASSWORD" -x:0
sleep $SLEEP_TYPE_TIME;

# Press return in order to load the Trello dashboard.
xte "key Return" -x:0

# Hide the mouse cursor after some seconds if it hasn't moved for a while.
unclutter &
