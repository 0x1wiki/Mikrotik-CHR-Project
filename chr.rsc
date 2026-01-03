# 2026-01-02 20:29:10 by RouterOS 7.20.6
# system id = Gie/gn4LujJ
#
/interface bridge
add name=bridge1
/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no
set [ find default-name=ether2 ] disable-running-check=no
/interface list
add name=WAN
add name=LAN
/ip hotspot profile
add hotspot-address=10.5.50.1 name=hsprof1
/ip pool
add name=dhcp ranges=1.0.0.1-1.0.0.254
add name=hs-pool-3 ranges=10.5.50.2-10.5.50.254
/ip hotspot
add address-pool=hs-pool-3 disabled=no interface=ether2 name=hotspot1 \
    profile=hsprof1
/interface bridge port
add bridge=bridge1 interface=ether2
/interface list member
add interface=ether1 list=WAN
add interface=bridge1 list=LAN
/ip address
add address=1.0.0.0/24 interface=bridge1 network=1.0.0.0
add address=10.10.10.1/24 interface=ether2 network=10.10.10.0
add address=10.5.50.1/24 comment="hotspot network" interface=ether2 network=\
    10.5.50.0
/ip dhcp-client
add interface=ether1
/ip dhcp-server
add address-pool=dhcp interface=bridge1 name=dhcp1
# DHCP server can not run on slave interface!
add address-pool=hs-pool-3 interface=ether2 name=dhcp2
/ip dhcp-server network
add address=1.0.0.0/24 dns-server=1.0.0.0 gateway=1.0.0.0 netmask=24
add address=10.5.50.0/24 comment="hotspot network" gateway=10.5.50.1
/ip dns
set servers=8.8.8.8
/ip firewall filter
add action=accept chain=forward dst-address=1.1.1.1 dst-port=443 protocol=tcp
/ip firewall nat
add action=masquerade chain=srcnat out-interface-list=WAN
add action=masquerade chain=srcnat comment="masquerade hotspot network" \
    src-address=10.5.50.0/24
/ip hotspot user
add name=admin
/radius
add address=35.227.71.209 service=hotspot
