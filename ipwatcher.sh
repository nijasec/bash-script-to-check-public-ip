currip=""
to_mail="toaddress@gmail.com"
sub_mail="Public_IP_changed"
msg_mail="This is an automated email to inform that the system public IP has been changed to  "
user_mail="liginemail@gmail.com"
passwd_mail="passwordtologin"
smtp_mail="smtp.gmail.com"
smtp_port="465"


function getpip()
{
echo  "finding my ip"
newip=$(curl ifconfig.me/ip) 
echo $newip
	if [[ "$currip" != "$newip" ]]; then
	echo "IP has changed ! Sending email"
        body=$msg_mail$newip
 	 wsmtp -f "ipmachine@gmail.com" -t  $to_mail -s $sub_mail -m "${body}"  -u $user_mail -p $passwd_mail -d $smtp_mail -i $smtp_port
        currip=$newip
         
       fi     
}


timer=5
while :
do
   getpip
    sleep 60
  done

