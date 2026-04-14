# To Address
# Subject
# To Team
# Body Message
# Alert Type
# IP Address


TO_ADDRESS=$1
SUBJECT=$2
TO_TEAM=$3
MESSAGE_BODY=$4
ALERT_TYPE=$5
IP_ADDRESS=$6


FINAL_MESSAGE_BODY=$(echo $MESSAGE_BODY | sed -e 's/[]\/$*.^[]/\\&/g') # Removing the special characters in the Message

FINAL_MESSAGE=$(sed -e "s/TO_TEAM/$TO_TEAM/g" -e "s/ALERT_TYPE/$ALERT_TYPE/g" -e "s/SERVER_IP/$T$IP_ADDRESS/g" -e "s/MESSAGE/$FINAL_MESSAGE_BODY/g" template.html) #Replacing the place holders in email template


{
echo "To: $TO_ADDRESS"
echo "Subject: $SUBJECT"
echo "Content-Type: text/html"
echo ""
echo "$FINAL_MESSAGE"
} | msmtp "$TO_ADDRESS"