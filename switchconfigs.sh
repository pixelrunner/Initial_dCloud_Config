#!/usr/bin/expect

Fusion='198.18.128.96 2022'
Core='198.18.128.96 2023'
Edge1='198.18.128.96 2024'
Edge2='198.18.128.96 2025'


(
echo open "$Fusion"
sleep 2
# sleep 2
echo no
sleep 2
echo "yes\r"
sleep 2
echo "yes\r"
sleep 2
echo "\r"
echo "\n"
echo "enable\r"
sleep 2

echo enable
sleep .1
echo configure terminal
sleep .1
echo hostname Fusion
sleep .1
echo vrf definition Mgmt-vrf
sleep .1
echo address-family ipv4
sleep .1
echo exit-address-family
sleep .1
echo address-family ipv6
sleep .1
echo exit-address-family
sleep .1
echo enable secret C1sco12345
sleep .1
echo aaa new-model
sleep .1
echo aaa authentication login default local none
sleep .1
echo aaa authentication enable default enable none
sleep .1
echo aaa session-id common
sleep .1
echo switch 1 provision c9300-24p
sleep .1
echo ip routing
sleep .1
echo no ip domain lookup
sleep .1
echo ip domain name dcloud.cisco.com
sleep .1
echo vtp domain ciscodna
sleep .1
echo vtp mode transparent
sleep .1
echo system mtu 1500
sleep .1
echo spanning-tree mode pvst
sleep .1
echo spanning-tree extend system-id
sleep .1
echo archive
sleep .1
echo log config
sleep .1
echo logging enable
sleep .1
echo logging size 200
sleep .1
echo notify syslog contenttype plaintext
sleep .1
echo username admin privilege 15 password 0 C1sco12345
sleep .1
echo username dnacadmin privilege 15 password 0 C1sco12345
sleep .1
echo vlan 11
sleep .1
echo name SharedSvc_Vlan11
sleep .1
echo vlan 102
sleep .1
echo name Fusion_Border_underlay
sleep .1
echo interface Loopback0
sleep .1
echo description Fabric Underlay RID
sleep .1
echo ip address 172.16.10.103 255.255.255.255
sleep .1
echo interface GigabitEthernet0/0
sleep .1
echo vrf forwarding Mgmt-vrf
sleep .1
echo ip address 198.18.129.103 255.255.255.0
sleep .1
echo speed 1000
sleep .1
echo negotiation auto
sleep .1
echo shutdown
sleep .1
echo interface GigabitEthernet1/0/1
sleep .1
echo interface GigabitEthernet1/0/2
sleep .1
echo interface GigabitEthernet1/0/3
sleep .1
echo interface GigabitEthernet1/0/4
sleep .1
echo interface GigabitEthernet1/0/5
sleep .1
echo interface GigabitEthernet1/0/6
sleep .1
echo interface GigabitEthernet1/0/7
sleep .1
echo interface GigabitEthernet1/0/8
sleep .1
echo interface GigabitEthernet1/0/9
sleep .1
echo interface GigabitEthernet1/0/10
sleep .1
echo interface GigabitEthernet1/0/11
sleep .1
echo interface GigabitEthernet1/0/12
sleep .1
echo interface GigabitEthernet1/0/13
sleep .1
echo interface GigabitEthernet1/0/14
sleep .1
echo interface GigabitEthernet1/0/1
sleep .1
echo interface GigabitEthernet1/0/16
sleep .1
echo interface GigabitEthernet1/0/17
sleep .1
echo interface GigabitEthernet1/0/18
sleep .1
echo interface GigabitEthernet1/0/19
sleep .1
echo interface GigabitEthernet1/0/20
sleep .1
echo interface GigabitEthernet1/0/21
sleep .1
echo interface GigabitEthernet1/0/22
sleep .1
echo description Fusion_to_Border_g1/0/22
sleep .1
echo switchport mode trunk
sleep .1
echo interface GigabitEthernet1/0/23
sleep .1
echo description Fusion_to_Border_g1/0/23
sleep .1
echo switchport mode trunk
sleep .1
echo interface GigabitEthernet1/0/24
sleep .1
echo description Fusion_to_dCloudToR
sleep .1
echo no switchport
sleep .1
echo ip address 198.18.191.1 255.255.192.0
sleep .1
echo interface GigabitEthernet1/1/1
sleep .1
echo interface GigabitEthernet1/1/2
sleep .1
echo interface GigabitEthernet1/1/3
sleep .1
echo interface GigabitEthernet1/1/4
echo interface TenGigabitEthernet1/1/1
echo interface TenGigabitEthernet1/1/2
echo interface TenGigabitEthernet1/1/3
echo interface TenGigabitEthernet1/1/4
echo interface TenGigabitEthernet1/1/5
echo interface TenGigabitEthernet1/1/6
echo interface TenGigabitEthernet1/1/7
echo interface TenGigabitEthernet1/1/8
echo interface FortyGigabitEthernet1/1/1
echo interface FortyGigabitEthernet1/1/2
echo interface Vlan1
echo no ip address
echo shutdown
sleep .1
echo interface Vlan102
sleep .1
echo description BGP-Border-underlay
sleep .1
echo dampening
sleep .1
echo ip address 172.16.102.1 255.255.255.0
sleep .1
echo no ip redirects
sleep .1
echo no ip proxy-arp
sleep .1
echo logging event link-status
sleep .1
echo router ospf 1
sleep .1
echo redistribute bgp 65002 subnets
sleep .1
echo network 198.18.191.1 0.0.0.0 area 0 
sleep .1
echo network 172.16.10.103 0.0.0.0 area 0
sleep .1
echo router isis
sleep .1
echo metric-style narrow
sleep .1
echo router bgp 65002
sleep .1
echo bgp router-id interface Loopback0
sleep .1
echo bgp log-neighbor-changes
sleep .1
echo neighbor 172.16.102.2 remote-as 65003
sleep .1
echo address-family ipv4
sleep .1
echo network 0.0.0.0
sleep .1
echo network 172.16.10.103 mask 255.255.255.255
sleep .1
echo network 172.16.11.0
sleep .1
echo redistribute ospf 1
sleep .1
echo neighbor 172.16.102.2 activate
sleep .1
echo exit-address-family
sleep .1
echo ip forward-protocol nd
sleep .1
echo ip http server
sleep .1
echo ip http authentication local
sleep .1
echo ip http secure-server
sleep .1
echo ip http client source-interface Loopback0
sleep .1
echo ip ftp source-interface GigabitEthernet0/0
sleep .1
echo ip route vrf Mgmt-vrf 0.0.0.0 0.0.0.0 198.18.129.1
sleep .1
echo snmp-server community private RW
sleep .1
echo snmp-server community public RO
sleep .1
echo control-plane
sleep .1
echo service-policy input system-cpp-policy
sleep .1
echo line con 0
sleep .1
echo exec-timeout 0 
sleep .1
echo transport output all
sleep .1
echo stopbits 1
sleep .1
echo line vty 0 4
sleep .1
echo password C1sco12345
sleep .1
echo logging synchronous
sleep .1
echo transport input all
sleep .1
echo transport output all
sleep .1
echo line vty 5 15
sleep .1
echo password C1sco12345
sleep .1
echo logging synchronous
sleep .1
echo transport input all
sleep .1
echo transport output all
sleep .1
echo end
) | telnet


# CORE SWITCH CONFIGURATION

(
echo open "$Core"
sleep 2
# sleep 2
echo no
sleep 2
echo "yes\r"
sleep 2
echo "yes\r"
sleep 2
echo "\r"
echo "\n"
echo "enable\r"
sleep 2

echo enable
sleep .1
echo configure terminal
sleep .1
echo no service pad
sleep .1
echo service timestamps debug datetime msec
sleep .1
echo service timestamps log datetime msec show-timezone year
sleep .1
echo service call-home
sleep .1
echo no platform punt-keepalive disable-kernel-core 
sleep .1
echo hostname Core
sleep .1
echo vrf definition Mgmt-vrf
sleep .1
echo address-family ipv4
sleep .1
echo exit-address-family
sleep .1
echo address-family ipv6
sleep .1
exit-address-family
sleep .1
enable secret C1sco12345
sleep .1
echo aaa new-model
sleep .1
echo aaa authentication login default local none
sleep .1
echo aaa authentication enable default enable none
sleep .1
echo aaa session-id common
sleep .1
echo switch 1 provision c9300-24p
sleep .1
echo ip routing
sleep .1
echo no ip domain lookup
sleep .1
echo ip domain name dcloud.cisco.com
sleep .1
echo ip dhcp excluded-address 172.16.13.1
sleep .1
echo ip dhcp excluded-address 172.16.13.2
sleep .1
echo ip dhcp pool PnP_nw_orchestration_pool
sleep .1
echo network 172.16.13.0 255.255.255.192
sleep .1
echo default-router 172.16.13.1 
sleep .1
echo option 43 ascii "5A1N;B2;K4;I198.18.129.100;J80"
sleep .1
echo ip dhcp pool PnP_Edge2
sleep .1
echo host 172.16.13.2 255.255.255.248
sleep .1
echo client-identifier 308b.b256.6e96
sleep .1
echo default-router 172.16.13.1 
sleep .1
echo option 43 ascii "5A1N;B2;K4;I198.18.129.100;J80"
sleep .1
echo vtp domain ciscodna
sleep .1
echo vtp mode transparent
sleep .1
echo system mtu 9100
sleep .1
echo spanning-tree mode pvst
sleep .1
echo spanning-tree extend system-id
sleep .1
echo archive
sleep .1
echo log config
sleep .1
echo logging enable
sleep .1
echo logging size 200
sleep .1
echo notify syslog contenttype plaintext
sleep .1
echo username admin privilege 15 password 0 C1sco12345
sleep .1
echo username dnacadmin privilege 15 password 0 C1sco12345
sleep .1
echo vlan 102
sleep .1
echo name Fusion_Border_underlay
sleep .1
echo interface Loopback0
sleep .1
echo description Fabric Underlay RID
sleep .1
echo ip address 172.16.10.104 255.255.255.255
sleep .1
echo ip router isis
sleep .1
echo clns mtu 1400 
sleep .1
echo no shut
sleep .1
echo interface GigabitEthernet0/0
sleep .1
echo interface GigabitEthernet1/0/1
sleep .1
echo interface GigabitEthernet1/0/2
sleep .1
echo interface GigabitEthernet1/0/3
sleep .1
echo interface GigabitEthernet1/0/4
sleep .1
echo interface GigabitEthernet1/0/5
sleep .1
echo interface GigabitEthernet1/0/6
sleep .1
echo interface GigabitEthernet1/0/7
sleep .1
echo interface GigabitEthernet1/0/8
sleep .1
echo interface GigabitEthernet1/0/9
sleep .1
echo interface GigabitEthernet1/0/10
sleep .1
echo interface GigabitEthernet1/0/11
sleep .1
echo interface GigabitEthernet1/0/12
sleep .1
echo interface GigabitEthernet1/0/13
sleep .1
echo interface GigabitEthernet1/0/14
sleep .1
echo interface GigabitEthernet1/0/15
sleep .1
echo interface GigabitEthernet1/0/16
sleep .1
echo interface GigabitEthernet1/0/17
sleep .1
echo interface GigabitEthernet1/0/18
sleep .1
echo description Core_to_Edge1_g1/0/22
sleep .1
echo no shut
sleep .1
echo interface GigabitEthernet1/0/19
sleep .1
echo description Core_to_Edge1_g1/0/23
sleep .1
echo no switchport
sleep .1
echo dampening
sleep .1
echo ip address 172.16.13.74 255.255.255.254
sleep .1
echo no ip redirects
sleep .1
echo no ip proxy-arp
sleep .1
echo ip router isis
sleep .1
echo logging event link-status
sleep .1
echo load-interval 30
sleep .1
echo carrier-delay msec 0
sleep .1
echo bfd interval 300 min_rx 300 multiplier 3
sleep .1
echo no bfd echo
sleep .1
echo isis network point-to-point
sleep .1
echo no shut
sleep .1
echo interface GigabitEthernet1/0/20
sleep .1
echo description Core_to_Edge2_g1/0/23
sleep .1
echo no switchport
sleep .1
echo dampening
sleep .1
echo ip address 172.16.13.68 255.255.255.254
sleep .1
echo no ip redirects
sleep .1
echo no ip proxy-arp
sleep .1
echo ip router isis
sleep .1
echo logging event link-status
sleep .1
echo load-interval 30
sleep .1
echo carrier-delay msec 0
sleep .1
echo bfd interval 300 min_rx 300 multiplier 3
sleep .1
echo no bfd echo
sleep .1
echo isis network point-to-point
sleep .1
echo no shut
sleep .1
echo interface GigabitEthernet1/0/21
sleep .1
echo description Core_to_Edge2_g1/0/22
sleep .1
echo no switchport
sleep .1
echo dampening
sleep .1
echo ip address 172.16.13.66 255.255.255.254
sleep .1
echo no ip redirects
sleep .1
echo no ip proxy-arp
sleep .1
echo ip router isis
sleep .1
echo logging event link-status
sleep .1
echo load-interval 30
sleep .1
echo carrier-delay msec 0
sleep .1
echo bfd interval 300 min_rx 300 multiplier 3
sleep .1
echo no bfd echo
sleep .1
echo isis network point-to-point
sleep .1
echo no shut
sleep .1
echo interface GigabitEthernet1/0/22
sleep .1
echo description Core_to_Fusion_g1/0/22
sleep .1
echo no switchport
sleep .1
echo dampening
sleep .1
echo ip address 172.16.13.130 255.255.255.252
sleep .1
echo no ip redirects
sleep .1
echo no ip proxy-arp
sleep .1
echo ip router isis
sleep .1
echo logging event link-status
sleep .1
echo load-interval 30
sleep .1
echo carrier-delay msec 0
sleep .1
echo bfd interval 300 min_rx 300 multiplier 3
sleep .1
echo no bfd echo
sleep .1
echo isis network point-to-point
sleep .1
echo shutdown
sleep .1
echo interface GigabitEthernet1/0/23
sleep .1
echo description Core_to_Fusion_g1/0/23
sleep .1
echo switchport mode trunk
sleep .1
echo no shut
sleep .1
echo interface GigabitEthernet1/0/24
sleep .1
echo no switchport
sleep .1
echo vrf forwarding Mgmt-vrf
sleep .1
echo ip address 198.18.129.104 255.255.255.0
sleep .1
echo shutdown
sleep .1
echo interface GigabitEthernet1/1/1
sleep .1
echo interface GigabitEthernet1/1/2
sleep .1
echo interface GigabitEthernet1/1/3
sleep .1
echo interface GigabitEthernet1/1/4
sleep .1
echo interface TenGigabitEthernet1/1/1
sleep .1
echo interface TenGigabitEthernet1/1/2
sleep .1
echo interface TenGigabitEthernet1/1/3
sleep .1
echo interface TenGigabitEthernet1/1/4
sleep .1
echo interface TenGigabitEthernet1/1/5
sleep .1
echo interface TenGigabitEthernet1/1/6
sleep .1
echo interface TenGigabitEthernet1/1/7
sleep .1
echo interface TenGigabitEthernet1/1/8
sleep .1
echo interface FortyGigabitEthernet1/1/1
sleep .1
echo interface FortyGigabitEthernet1/1/2
sleep .1
echo interface Vlan1
sleep .1
echo ip address 172.16.13.1 255.255.255.192
sleep .1
echo ip router isis
sleep .1
echo bfd interval 300 min_rx 300 multiplier 3
sleep .1
echo no bfd echo
sleep .1
echo clns mtu 1400
sleep .1
sleep .1
echo no shut
echo interface Vlan102
sleep .1
echo description BGP-Fusion-underlay
sleep .1
echo dampening
sleep .1
echo ip address 172.16.102.2 255.255.255.0
sleep .1
echo no ip redirects
sleep .1
echo no ip proxy-arp
sleep .1
echo logging event link-status
sleep .1
echo no shut
sleep .1
echo router bgp 65003
sleep .1
echo bgp router-id interface Loopback0
sleep .1
echo bgp log-neighbor-changes
sleep .1
echo bgp graceful-restart
sleep .1
echo neighbor 172.16.102.1 remote-as 65002
sleep .1
echo address-family ipv4
sleep .1
echo network 172.16.10.104 mask 255.255.255.255
sleep .1
echo network 172.16.13.0 mask 255.255.255.0
sleep .1
echo redistribute isis level-2
sleep .1
echo neighbor 172.16.102.1 activate
sleep .1
echo exit-address-family
sleep .1
echo router isis
sleep .1
echo net 49.0000.1720.1601.0104.00
sleep .1
echo domain-password cisco
sleep .1
echo metric-style wide
sleep .1
echo log-adjacency-changes
sleep .1
echo nsf ietf
sleep .1
echo default-information originate
sleep .1
echo bfd all-interfaces
sleep .1
echo ip forward-protocol nd
sleep .1
echo ip http server
sleep .1
echo ip http authentication local
sleep .1
echo ip http secure-server
sleep .1
echo ip http client source-interface Loopback0
sleep .1
echo ip ftp source-interface GigabitEthernet0/0
sleep .1
echo ip route 172.16.13.0 255.255.255.0 Null0
sleep .1
echo ip route vrf Mgmt-vrf 0.0.0.0 0.0.0.0 198.18.129.1
sleep .1
echo ip ssh version 2
sleep .1
echo snmp-server community private RW
sleep .1
echo snmp-server community public RO
sleep .1
echo control-plane
sleep .1
echo service-policy input system-cpp-policy
sleep .1
echo line con 0
sleep .1
echo exec-timeout 0 
sleep .1
echo transport output all
sleep .1
echo stopbits 1
sleep .1
echo line vty 0 4
sleep .1
echo password C1sco12345
sleep .1
echo logging synchronous
sleep .1
echo transport input all
sleep .1
echo transport output all
sleep .1
echo line vty 5 15
sleep .1
echo password C1sco12345
sleep .1
echo logging synchronous
sleep .1
echo transport input all
sleep .1
echo transport output all
sleep .1
echo ntp source Loopback0
sleep .1
echo ntp server 172.16.10.103
sleep .1
echo end


) | telnet

# EDGE1 SWITCH CONFIGURATION

(
echo open "$Edge1"
# sleep 2
# sleep 2
# echo no
# sleep 2
# echo "yes\r"
# sleep 2
# echo "yes\r"
# sleep 2
# echo "\r"
# echo "\n"
echo "enable\r"
sleep 2

echo enable
sleep .1
echo configure terminal
sleep .1

echo no service pad
sleep .1
echo service timestamps debug datetime msec
sleep .1
echo service timestamps log datetime msec
sleep .1
echo service password-encryption
sleep .1
echo service sequence-numbers
sleep .1
echo no platform punt-keepalive disable-kernel-core
sleep .1
echo hostname Edge-1
sleep .1
echo vrf definition Mgmt-vrf
sleep .1
echo address-family ipv4
sleep .1
echo exit-address-family
sleep .1
echo address-family ipv6
sleep .1
echo exit-address-family
sleep .1
echo enable secret C1sco12345
sleep .1
echo aaa new-model
echo aaa authentication login default local none
sleep .1
echo aaa authentication enable default enable none
sleep .1
echo aaa session-id common
sleep .1
echo switch 1 provision c9300-24p
sleep .1
echo ip routing
sleep .1
echo ip domain name dcloud.cisco.com
sleep .1
echo vtp domain ciscodna
sleep .1
echo vtp mode transparent
sleep .1
echo system mtu 9100
sleep .1
echo diagnostic bootup level minimal
sleep .1
echo spanning-tree mode rapid-pvst
sleep .1
echo spanning-tree extend system-id
sleep .1
echo archive
sleep .1
echo log config
sleep .1
echo logging enable
sleep .1
echo logging size 500
sleep .1
echo hidekeys
sleep .1
echo username admin privilege 15 password 0 C1sco12345
sleep .1
echo username dnacadmin privilege 15 password 0 C1sco12345
sleep .1
echo transceiver type all
sleep .1
echo monitoring
sleep .1
echo vlan 15
sleep .1
echo name Sensor_APs
sleep .1
echo vlan 18
sleep .1
echo name WLAN_Aps
sleep .1
echo interface Loopback0
sleep .1
echo description Fabric Node Router ID
sleep .1
echo ip address 172.16.13.71 255.255.255.255
sleep .1
echo ip router isis
sleep .1
echo clns mtu 1400
sleep .1
echo interface GigabitEthernet0/0
sleep .1
echo shutdown
sleep .1
echo interface GigabitEthernet1/0/1
sleep .1
echo description Edge1_to_AP3802
sleep .1
echo switchport access vlan 18
sleep .1
echo switchport mode access
sleep .1
echo interface GigabitEthernet1/0/2
sleep .1
echo description Edge1_to_Sensor
sleep .1
echo switchport access vlan 15
sleep .1
echo switchport mode access
sleep .1
echo interface GigabitEthernet1/0/3
sleep .1
echo description Edge1_to_USB
sleep .1
echo interface GigabitEthernet1/0/4
sleep .1
echo interface GigabitEthernet1/0/5
sleep .1
echo interface GigabitEthernet1/0/6
sleep .1
echo interface GigabitEthernet1/0/7
sleep .1
echo interface GigabitEthernet1/0/8
sleep .1
echo interface GigabitEthernet1/0/9
sleep .1
echo interface GigabitEthernet1/0/1
sleep .1
echo interface GigabitEthernet1/0/11
sleep .1
echo interface GigabitEthernet1/0/12
sleep .1
echo interface GigabitEthernet1/0/13
sleep .1
echo interface GigabitEthernet1/0/14
sleep .1
echo interface GigabitEthernet1/0/15
sleep .1
echo interface GigabitEthernet1/0/16
sleep .1
echo interface GigabitEthernet1/0/17
sleep .1
echo interface GigabitEthernet1/0/18
sleep .1
echo interface GigabitEthernet1/0/19
sleep .1
echo interface GigabitEthernet1/0/20
sleep .1
echo interface GigabitEthernet1/0/21
sleep .1
echo interface GigabitEthernet1/0/22
sleep .1
echo description Edge1_to_Core_g1/0/18
sleep .1
echo no switchport
sleep .1
echo dampening
sleep .1
echo ip address 172.16.13.73 255.255.255.254
sleep .1
echo no ip redirects
sleep .1
echo no ip proxy-arp
sleep .1
echo ip lisp source-locator Loopback0
sleep .1
echo ip router isis
sleep .1
echo logging event link-status
sleep .1
echo load-interval 30
sleep .1
echo carrier-delay msec 0
sleep .1
echo bfd interval 300 min_rx 300 multiplier 3
sleep .1
echo no bfd echo
sleep .1
echo isis network point-to-point
sleep .1
echo shutdown
sleep .1
echo interface GigabitEthernet1/0/23
sleep .1
echo description Edge1_to_Core_g1/0/19
sleep .1
echo no switchport
sleep .1
echo dampening
sleep .1
echo ip address 172.16.13.75 255.255.255.254
sleep .1
echo no ip redirects
sleep .1
echo no ip proxy-arp
sleep .1
echo ip lisp source-locator Loopback0
sleep .1
echo ip router isis
sleep .1
echo logging event link-status
sleep .1
echo load-interval 30
sleep .1
echo carrier-delay msec 0
sleep .1
echo bfd interval 300 min_rx 300 multiplier 3
sleep .1
echo no bfd echo
sleep .1
echo isis network point-to-point
sleep .1
echo interface GigabitEthernet1/0/24
sleep .1
echo no switchport
sleep .1
echo vrf forwarding Mgmt-vrf
sleep .1
echo ip address 198.18.129.16 255.255.255.0
sleep .1
echo interface GigabitEthernet1/1/1
sleep .1
echo interface GigabitEthernet1/1/2
sleep .1
echo interface GigabitEthernet1/1/3
sleep .1
echo interface GigabitEthernet1/1/4
sleep .1
echo interface TenGigabitEthernet1/1/1
sleep .1
echo interface TenGigabitEthernet1/1/2
sleep .1
echo interface TenGigabitEthernet1/1/3
sleep .1
echo interface TenGigabitEthernet1/1/4
sleep .1
echo interface TenGigabitEthernet1/1/5
sleep .1
echo interface TenGigabitEthernet1/1/6
sleep .1
echo interface TenGigabitEthernet1/1/7
sleep .1
echo interface TenGigabitEthernet1/1/8
sleep .1
echo interface FortyGigabitEthernet1/1/1
sleep .1
echo interface FortyGigabitEthernet1/1/2
sleep .1
echo interface Vlan1
sleep .1
echo no ip address
sleep .1
echo shutdown
sleep .1
echo interface Vlan15
sleep .1
echo description Pod1_Edge2_Sensor_VLAN
sleep .1
echo ip address 172.16.15.1 255.255.255.0
sleep .1
echo ip helper-address 172.16.11.25
sleep .1
echo no ip redirects
sleep .1
echo no ip proxy-arp
sleep .1
echo ip router isis
sleep .1
echo logging event link-status
sleep .1
echo load-interval 30
sleep .1
echo carrier-delay msec 0
sleep .1
echo bfd interval 300 min_rx 300 multiplier 3
sleep .1
echo no bfd echo
sleep .1
echo interface Vlan18
sleep .1
echo description Pod1_Edge2_AP_VLAN
sleep .1
echo ip address 172.16.18.1 255.255.255.0
sleep .1
echo ip helper-address 172.16.11.25
sleep .1
echo no ip redirects
sleep .1
echo no ip proxy-arp
sleep .1
echo ip router isis
sleep .1
echo logging event link-status
sleep .1
echo load-interval 30
sleep .1
echo carrier-delay msec 0
sleep .1
echo bfd interval 300 min_rx 300 multiplier 3
sleep .1
echo no bfd echo
sleep .1
echo router isis
sleep .1
echo net 49.0000.1720.1601.3071.00
sleep .1
echo domain-password cisco
sleep .1
echo metric-style wide
sleep .1
echo log-adjacency-changes
sleep .1
echo nsf ietf
sleep .1
echo bfd all-interfaces
sleep .1
echo ip forward-protocol nd
sleep .1
echo ip http server
sleep .1
echo ip http authentication local
sleep .1
echo ip http secure-server
sleep .1
echo ip http max-connections 16
sleep .1
echo ip http client source-interface Loopback0
sleep .1
echo ip ftp source-interface GigabitEthernet0/0
sleep .1
echo ip route vrf Mgmt-vrf 0.0.0.0 0.0.0.0 198.18.129.1
sleep .1
echo ip ssh source-interface Loopback0
sleep .1
echo ip ssh version 2
sleep .1
echo snmp-server community private RW
sleep .1
echo snmp-server community public RO
sleep .1
echo control-plane
sleep .1
echo service-policy input system-cpp-policy
sleep .1
echo line con 0
sleep .1
echo exec-timeout 0 0
sleep .1
echo stopbits 1
sleep .1
echo line vty 0 4
sleep .1
echo password C1sco12345
sleep .1
echo logging synchronous
sleep .1
echo transport input all
sleep .1
echo transport output all
sleep .1
echo line vty 5 15
sleep .1
echo password C1sco12345
sleep .1
echo logging synchronous
sleep .1
echo transport input all
sleep .1
echo transport output all
sleep .1
echo ntp source Loopback0
sleep .1
echo ntp server 172.16.10.103
sleep .1
echo end
) | telnet


#EDGE2 CONFIGURATION:

(
echo open "$Edge2"
sleep 2
# sleep 2
echo no
sleep 2
echo "yes\r"
sleep 2
echo "yes\r"
sleep 2
echo "\r"
echo "\n"
echo "enable\r"
sleep 2
echo enable
sleep .1
echo configure terminal
sleep .1
echo no service pad
sleep .1
echo service timestamps debug datetime msec
sleep .1
echo service timestamps log datetime msec
sleep .1
echo service password-encryption
sleep .1
echo service sequence-numbers
sleep .1
echo no platform punt-keepalive disable-kernel-core
sleep .1
echo hostname Edge-2
sleep .1
echo vrf definition Mgmt-vrf
sleep .1
echo address-family ipv4
sleep .1
echo exit-address-family
sleep .1
echo address-family ipv6
sleep .1
echo exit-address-family
sleep .1
echo enable secret C1sco12345
sleep .1
echo aaa new-model
sleep .1
echo aaa authentication login default local none
sleep .1
echo aaa authentication enable default enable none
sleep .1
echo aaa session-id common
sleep .1
echo switch 1 provision c9300-24p
sleep .1
echo ip routing
sleep .1
echo vtp domain ciscodna
sleep .1
echo vtp mode transparent
sleep .1
echo system mtu 9100
sleep .1
echo diagnostic bootup level minimal
sleep .1
echo spanning-tree mode rapid-pvst
sleep .1
echo spanning-tree extend system-id
sleep .1
echo archive
sleep .1
echo log config
sleep .1
echo logging enable
sleep .1
echo logging size 500
sleep .1
echo hidekeys
sleep .1
echo username admin privilege 15 password 0 C1sco12345
sleep .1
echo username dnacadmin privilege 15 password 0 C1sco12345
sleep .1
echo transceiver type all
sleep .1
echo monitoring
sleep .1
echo vlan 19
sleep .1
echo name WLAN_APs
sleep .1
echo interface Loopback0
sleep .1
echo description Fabric Node Router ID
sleep .1
echo ip address 172.16.13.70 255.255.255.255
sleep .1
echo ip router isis
sleep .1
echo interface GigabitEthernet0/0
sleep .1
echo shutdown
sleep .1
echo interface GigabitEthernet1/0/1
sleep .1
echo description Edge1_to_AP3850
sleep .1
echo switchport access vlan 19
sleep .1
echo switchport mode access
sleep .1
echo interface GigabitEthernet1/0/2
sleep .1
echo description Edge1_to_USB
sleep .1
echo interface GigabitEthernet1/0/3
sleep .1
echo description Edge1_to_USB
sleep .1
echo interface GigabitEthernet1/0/4
sleep .1
echo interface GigabitEthernet1/0/5
sleep .1
echo interface GigabitEthernet1/0/6
sleep .1
echo interface GigabitEthernet1/0/7
sleep .1
echo interface GigabitEthernet1/0/8
sleep .1
echo interface GigabitEthernet1/0/9
sleep .1
echo interface GigabitEthernet1/0/10
sleep .1
echo interface GigabitEthernet1/0/11
sleep .1
echo interface GigabitEthernet1/0/12
sleep .1
echo interface GigabitEthernet1/0/13
sleep .1
echo interface GigabitEthernet1/0/14
sleep .1
echo interface GigabitEthernet1/0/15
sleep .1
echo interface GigabitEthernet1/0/16
sleep .1
echo interface GigabitEthernet1/0/17
sleep .1
echo interface GigabitEthernet1/0/18
sleep .1
echo interface GigabitEthernet1/0/19
sleep .1
echo interface GigabitEthernet1/0/20
sleep .1
echo interface GigabitEthernet1/0/21
sleep .1
echo interface GigabitEthernet1/0/22
sleep .1
echo description Edge2_to_Core_g1/0/21
sleep .1
echo no switchport
sleep .1
echo dampening
sleep .1
echo ip address 172.16.13.67 255.255.255.254
sleep .1
echo no ip redirects
sleep .1
echo no ip proxy-arp
sleep .1
echo ip lisp source-locator Loopback0
sleep .1
echo ip router isis
sleep .1
echo logging event link-status
sleep .1
echo load-interval 30
sleep .1
echo carrier-delay msec 0
sleep .1
echo bfd interval 300 min_rx 300 multiplier 3
sleep .1
echo no bfd echo
sleep .1
echo isis network point-to-point
sleep .1
echo interface GigabitEthernet1/0/23
sleep .1
echo description Edge2_to_Core_g1/0/20
sleep .1
echo no switchport
sleep .1
echo dampening
sleep .1
echo ip address 172.16.13.69 255.255.255.254
sleep .1
echo no ip redirects
sleep .1
echo no ip proxy-arp
sleep .1
echo ip lisp source-locator Loopback0
sleep .1
echo ip router isis
sleep .1
echo logging event link-status
sleep .1
echo load-interval 30
sleep .1
echo carrier-delay msec 0
sleep .1
echo bfd interval 300 min_rx 300 multiplier 3
sleep .1
echo no bfd echo
echo isis network point-to-point
sleep .1
echo interface GigabitEthernet1/0/24
sleep .1
echo no switchport
sleep .1
echo vrf forwarding Mgmt-vrf
sleep .1
echo ip address 198.18.129.17 255.255.255.0
sleep .1
echo no shutdown
sleep .1
echo interface GigabitEthernet1/1/1
sleep .1
echo interface GigabitEthernet1/1/2
sleep .1
echo interface GigabitEthernet1/1/3
sleep .1
echo interface GigabitEthernet1/1/4
sleep .1
echo interface TenGigabitEthernet1/1/1
sleep .1
echo interface TenGigabitEthernet1/1/2
sleep .1
echo interface TenGigabitEthernet1/1/3
sleep .1
echo interface TenGigabitEthernet1/1/4
sleep .1
echo interface TenGigabitEthernet1/1/5
sleep .1
echo interface TenGigabitEthernet1/1/6
sleep .1
echo interface TenGigabitEthernet1/1/7
sleep .1
echo interface TenGigabitEthernet1/1/8
sleep .1
echo interface FortyGigabitEthernet1/1/1
sleep .1
echo interface FortyGigabitEthernet1/1/2
sleep .1
echo interface Vlan1
sleep .1
echo no ip address
sleep .1
echo interface Vlan19
sleep .1
echo description Pod1_Edge1_AP_VLAN
sleep .1
echo ip address 172.16.19.1 255.255.255.0
sleep .1
echo ip helper-address 172.16.11.25
sleep .1
echo no ip redirects
sleep .1
echo no ip proxy-arp
sleep .1
echo ip router isis
sleep .1
echo logging event link-status
sleep .1
echo load-interval 30
sleep .1
echo carrier-delay msec 0
sleep .1
echo bfd interval 300 min_rx 300 multiplier 3
sleep .1
echo no bfd echo
sleep .1
echo router isis
sleep .1
echo net 49.0000.1720.1601.3070.00
sleep .1
echo domain-password cisco
sleep .1
echo metric-style wide
sleep .1
echo log-adjacency-changes
sleep .1
echo nsf ietf
sleep .1
echo bfd all-interfaces
sleep .1
echo ip forward-protocol nd
sleep .1
echo ip http server
sleep .1
echo ip http authentication local
sleep .1
echo ip http secure-server
sleep .1
echo ip http max-connections 16
sleep .1
echo ip http client source-interface Loopback0
sleep .1
echo ip ftp source-interface GigabitEthernet0/0
sleep .1
echo ip route vrf Mgmt-vrf 0.0.0.0 0.0.0.0 198.18.129.1
sleep .1
echo ip ssh source-interface Loopback0
sleep .1
echo ip ssh version 2
sleep .1
echo ip scp server enable
sleep .1
echo snmp-server community private RW
sleep .1
echo snmp-server community public RO
sleep .1
echo control-plane
sleep .1
echo service-policy input system-cpp-policy
sleep .1
echo line con 0
sleep .1
echo exec-timeout 0 0
sleep .1
echo stopbits 1
sleep .1
echo line vty 0 4
sleep .1
echo password C1sco12345
sleep .1
echo logging synchronous
sleep .1
echo transport input all
sleep .1
echo transport output all
sleep .1
echo line vty 5 15
sleep .1
echo password C1sco12345
sleep .1
echo logging synchronous
sleep .1
echo transport input all
sleep .1
echo transport output all
sleep .1
echo ntp source Loopback0
sleep .1
echo ntp server 172.16.10.103
sleep .1
echo end
) | telnet


