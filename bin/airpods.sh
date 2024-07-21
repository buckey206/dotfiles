MAC_ADDRESS="40:DA:5C:8D:6A:02"
connected=$(bluetoothctl info "$MAC_ADDRESS" | grep "Connected: yes")
# $connected == "Connected: yes" if it is connected, else $connected == "" 


# -n flag checks if $connected is non-empty
if [ -n "$connected" ]; then
    # if it is connected, disconnect it
    bluetoothctl disconnect "$MAC_ADDRESS"
    echo "$connected"
else 
    # if it is not connected then connect it
    bluetoothctl connect "$MAC_ADDRESS"
    echo "$connected"
fi


#if [["$connected" == "Connected: no"]]; then
#    bluetoothctl connect 40:DA:5C:8D:6A:02
#fi
#if [["$connected" == "Connected: yes"]]; then
#    bluetoothctl disconnect 40:DA:5C:8D:6A:02
#fi

