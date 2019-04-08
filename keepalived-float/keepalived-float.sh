#!/usr/bin/env bash

KEEPALIVED_CHECK_SCRIPT="/usr/bin/pgrep -f keepalived-anchor"
echo "
global_defs {
        enable_script_security
}
vrrp_script chk_script {
        script \"$KEEPALIVED_CHECK_SCRIPT\"
        interval $KEEPALIVED_CHECK_INTERVAL
        fall 1       # num failures for KO
        rise 1       # num successes for OK
}
vrrp_instance VI_1 {
        interface $KEEPALIVED_INTERFACE
        state BACKUP
        nopreempt
        virtual_router_id $KEEPALIVED_ROUTER_ID

        priority $KEEPALIVED_PRIORITY
        virtual_ipaddress {
           $KEEPALIVED_VIRTUAL_IPS
        }
        track_script {
           chk_script
        }
}
" > /etc/keepalived/keepalived.conf

cat /etc/keepalived/keepalived.conf

echo "Starting keepalived"
keepalived --dont-fork --log-console