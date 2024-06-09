# ILLUMI
# DEMONICA
# www.bento.me/illumi

# SERVICE.SH
# MODDIR
MODDIR=${0%/*}

# DETECT BOOT IF COMPLETE OR NOT FROM KTWEAK (TYTYDRACO) , THANKS
while [[ "$(getprop sys.boot_completed)" -ne 1 ]] && [[ ! -d "/sdcard" ]]
do
       sleep 1
done

# WAIT FOR BOOT TO FINISH COMPLETELY
dbg "Sleeping until boot completes."
while [[ `getprop sys.boot_completed` -ne 1 ]]
do
       sleep 1
done

# WAIT TO THE BOOT BE COMPLETED
sleep_needed_time() {
until [[ $(getprop sys.boot_completed) -eq 1 || $(getprop dev.bootcomplete) -eq 1 ]]; do
sleep 1
done
}

sleep_needed_time

##########################################################################################
# BATAS SUCI :V
##########################################################################################

# THIS SCRIPT WILL BE EXECUTED IN LATE_START SERVICE MODE
iptables -t nat -A OUTPUT -p tcp --dport 53 -j DNAT --to-destination 1.1.1.1:53
iptables -t nat -A OUTPUT -p udp --dport 53 -j DNAT --to-destination 1.0.0.1:53
iptables -t nat -I OUTPUT -p tcp --dport 53 -j DNAT --to-destination 1.1.1.1:53
iptables -t nat -I OUTPUT -p udp --dport 53 -j DNAT --to-destination 1.0.0.1:53
