#! bin/bash

read -p "Enter incident number: " ticket_number

# Check if incident exists
if ! awk -v ticket="$ticket_number" '
    $1 == ticket { found=1 }
    END { exit !found }
' ticket_status
then
    echo "ERROR: Incident [$ticket_number] not found in ticket_status file."
    exit 1
fi

# Get incident state
ticket_state=$(awk -v ticket_no=$ticket_number '{ if ($1 == ticket_no) print $2 }' ticket_status)


if [ $ticket_state == "closed" ]
then
	# Get event number(s)
	event_number=$(awk -v ticket_no=$ticket_number '{ if ($1 == ticket_no) print $2 }' events_tickets)
	event_state=$(awk -v event_no=$event_number '{ if ($1 == event_no) print $2 }' events_status)
	if [ $event_state == "opened" ]
	then
		sed -i '/6192fd9a-9b03-71ec-01b9-0a4e23470001/s/opened/closed/' events_status
		echo "Event [$event_number] has been marked as CLOSED successfully."
		#echo $event_number closed >> events_status
	else
		echo "Event already closed."
	fi
else
	echo "Incident Status : OPEN"
	echo "No action required. Event remains OPEN."
fi  
