# ILLUMI
# DEMONICA
# www.bento.me/illumi

# POST-FS-DATA.SH
# MODDIR
MODDIR=${0%/*}

# BOOT
while [ -z "$(resetprop sys.boot_completed)" ]; do
  sleep 1
done

# WAIT
until [ "`getprop sys.boot_completed`" == 1 ]; do
  sleep 1
done

# WAIT V2
wait_until_boot_complete() {
  while [[ "$(getprop sys.boot_completed)" != "1" ]]; do
    sleep 1
  done
}
wait_until_boot_complete

##########################################################################################
# BATAS SUCI :V
##########################################################################################

# SET CF DNS SERVERS ADDRESS
setprop net.eth0.dns1 1.1.1.1
setprop net.eth0.dns2 1.0.0.1
setprop net.dns1 1.1.1.1
setprop net.dns2 1.0.0.1
setprop net.ppp0.dns1 1.1.1.1
setprop net.ppp0.dns2 1.0.0.1
setprop net.rmnet0.dns1 1.1.1.1
setprop net.rmnet0.dns2 1.0.0.1
setprop net.rmnet1.dns1 1.1.1.1
setprop net.rmnet1.dns2 1.0.0.1
setprop net.pdpbr1.dns1 1.1.1.1
setprop net.pdpbr1.dns2 1.0.0.1
setprop 2606:4700:4700::1111
setprop 2606:4700:4700::1001

# EDIT THE RESOLV CONF FILE IF IT EXIST
if [ -a /system/etc/resolv.conf ]; then
	mkdir -p $MODDIR/system/etc/
	printf "nameserver 1.1.1.1\nameserver 1.0.0.1" >> $MODDIR/system/etc/resolv.conf
	chmod 644 $MODDIR/system/etc/resolv.conf
fi
