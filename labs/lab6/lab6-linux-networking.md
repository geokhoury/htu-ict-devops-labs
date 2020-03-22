# Lab 6 - Linux Networking

## Reading Resources

### Linux Networking

* [Linux Networking 101](https://www.actualtechmedia.com/wp-content/uploads/2017/12/CUMULUS-NETWORKS-Linux101.pdf)
* [Linux Network Administrators Guide](https://www.tldp.org/LDP/nag2/nag2.pdf)
* [Beej's Guide to Network Programming - Advanced](https://beej.us/guide/bgnet/html/#what-is-a-socket)

## Network Configuration

### The `ifconfig` Command

`ifconfig` is a command-line interface tool for network interface configuration and is also used to initialize interfaces at system boot time. Once a server is up and running, `ifconfig` can be used to assign an IP Address to an interface and enable or disable the interface on demand.

It is also used to view the status IP Address, Hardware / MAC address, as well as MTU (Maximum Transmission Unit) size of the currently active interfaces. Therefore `ifconfig` is very useful tool debugging or performing system tuning.

Here is an example to display status of all active network interfaces.

```bash
$ ifconfig

enp1s0    Link encap:Ethernet  HWaddr 28:d2:44:eb:bd:98  
          inet addr:192.168.0.103  Bcast:192.168.0.255  Mask:255.255.255.0
          inet6 addr: fe80::8f0c:7825:8057:5eec/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:169854 errors:0 dropped:0 overruns:0 frame:0
          TX packets:125995 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:174146270 (174.1 MB)  TX bytes:21062129 (21.0 MB)

lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:15793 errors:0 dropped:0 overruns:0 frame:0
          TX packets:15793 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1 
          RX bytes:2898946 (2.8 MB)  TX bytes:2898946 (2.8 MB)
```

To list all interfaces which are currently available, whether up or down, use the `-a` flag.

```bash
$ ifconfig -a 	
```

**Note**: Although `ifconfig` is a great tool, it is now obsolete (*deprecated*), its replacement is the `ip` tool which is explained below.

### The `ip` Command

`ip` is another useful command-line utility for displaying and manipulating routing, network devices, interfaces. It is a replacement for `ifconfig` and many other networking commands. Read [this](https://www.tecmint.com/ifconfig-vs-ip-command-comparing-network-configuration/) article to understand the difference between `ip` and `ifconfig`.

The following command will show the IP address and other information about an network interface.

```bash
$ ip addr show

1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: enp1s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 28:d2:44:eb:bd:98 brd ff:ff:ff:ff:ff:ff
    inet 192.168.0.103/24 brd 192.168.0.255 scope global dynamic enp1s0
       valid_lft 5772sec preferred_lft 5772sec
    inet6 fe80::8f0c:7825:8057:5eec/64 scope link 
       valid_lft forever preferred_lft forever
3: wlp2s0: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/ether 38:b1:db:7c:78:c7 brd ff:ff:ff:ff:ff:ff
...
```

To temporarily assign IP Address to a specific network interface (**eth0**), type.

```bash
$ sudo ip addr add 192.168.56.1 dev eth0
```

To remove an assigned IP address from an network interface (**eth0**), type.

```bash
$ sudo ip addr del 192.168.56.15/24 dev eth0
```

To show the current neighbour table in kernel, type.

```bash
$ ip neigh

192.168.0.1 dev enp1s0 lladdr 10:fe:ed:3d:f3:82 REACHABLE
```

### Configuring the Network Interface

We can use the `ifup` command to activate a network interface, making it available to send and receive data.

```bash
$ sudo ifup eth0
```

We can use the `ifdown` command to disable a network interface, making it unavailable to send and receive data.

```bash
$ sudo ifdown eth0
```

We can use the `ifquery` command to view the configuration of a network interface.

```bash
$ sudo ifquery eth0
```

## Network Troubleshooting

To troubleshoot network problems we can use the `ping` (Packet INternet Groper) command to test connectivity between two systems on a network (Local Area Network (LAN) or Wide Area Network (WAN)).
It uses ICMP [ICMP (Internet Control Message Protocol)](https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol) to communicate to nodes on a network.


### The `ping` Command

To test connectivity to another node, simply provide its IP or host name, for example.

```bash
$ ping 192.168.0.103

PING 192.168.0.103 (192.168.0.103) 56(84) bytes of data.
64 bytes from 192.168.0.103: icmp_seq=1 ttl=64 time=0.191 ms
64 bytes from 192.168.0.103: icmp_seq=2 ttl=64 time=0.156 ms
64 bytes from 192.168.0.103: icmp_seq=3 ttl=64 time=0.179 ms
64 bytes from 192.168.0.103: icmp_seq=4 ttl=64 time=0.182 ms
64 bytes from 192.168.0.103: icmp_seq=5 ttl=64 time=0.207 ms
64 bytes from 192.168.0.103: icmp_seq=6 ttl=64 time=0.157 ms
^C
--- 192.168.0.103 ping statistics ---
6 packets transmitted, 6 received, 0% packet loss, time 5099ms
rtt min/avg/max/mdev = 0.156/0.178/0.207/0.023 ms
```

or you can use the `-c` flag to tell `ping` to exit after a specified number of *ECHO_REQUEST* packets.

```bash
$ ping -c 4 google.com

PING google.com (172.217.16.206): 56 data bytes
64 bytes from 172.217.16.206: icmp_seq=0 ttl=55 time=82.129 ms
64 bytes from 172.217.16.206: icmp_seq=1 ttl=55 time=78.520 ms
64 bytes from 172.217.16.206: icmp_seq=2 ttl=55 time=78.314 ms
64 bytes from 172.217.16.206: icmp_seq=3 ttl=55 time=77.830 ms
--- google.com ping statistics ---
6 packets transmitted, 6 packets received, 0.0% packet loss
round-trip min/avg/max/stddev = 77.830/79.720/82.987/2.036 ms
```

**Questions:** 

* How many hops are displayed in the `ping 192.168.0.103` command?
* How many hops are displayed in the `ping -c 4 google.com` command?

### The `traceroute` Command

You can use the `traceroute` command-line utility to trace the full path from your local system to server. It prints the number of hops in that path between your *localhost* and *remote server*. You can use this command to also use `traceroute` to test connectivity between two systems.

In this example, we are tracing the route packets take from the local system to one of DuckDuckGo’s servers with IP address 216.58.204.46.

```bash
$ traceroute htu.edu.jo
traceroute to htu.edu.jo (213.186.168.174), 64 hops max, 52 byte packets
 1  192.168.100.1 (192.168.100.1)  3.585 ms  2.541 ms  3.143 ms
 2  185.96.71.1 (185.96.71.1)  6.244 ms  5.364 ms  4.990 ms
 3  192.168.121.2 (192.168.121.2)  7.726 ms  4.295 ms  4.219 ms
 4  10.75.60.9 (10.75.60.9)  6.909 ms  9.874 ms  8.560 ms
 5  10.74.74.34 (10.74.74.34)  9.152 ms
    10.74.74.10 (10.74.74.10)  9.050 ms
    10.74.74.34 (10.74.74.34)  7.252 ms
 6  ffm-b10-link.telia.net (62.115.32.149)  66.100 ms  63.425 ms  64.042 ms
 7  ae-1-3114.edge5.london1.level3.net (4.69.148.218)  79.938 ms  78.269 ms
    ffm-bb2-link.telia.net (62.115.137.210)  63.620 ms
 8  jordan-tele.edge5.london1.level3.net (212.187.166.194)  128.303 ms  129.711 ms  129.111 ms
 9  213.139.41.2 (213.139.41.2)  131.894 ms  130.754 ms  134.360 ms
^C
```

**Questions:** 

* How many hops are displayed in the `traceroute htu.edu.jo` command?

### The `mtr` Command

**My traceroute** (MTR) is a modern command-line network diagnostic tool that combines the functionality of `ping` and `traceroute` into a single diagnostic tool. It updates in real-time until you exit the program by pressing `q`.

The easiest way of running `mtr` is to provide it a *hostname* or *IP address* as an argument. You can use the `-c` flag to limit the number of pings to a specific value.

```bash
$ mtr google.com
```

or

```bash
$ mtr 216.58.223.78
```

### The `netstat` Command

`netstat` is a command line tool that displays useful information such as network connections, routing tables, interface statistics, and much more, concerning the Linux networking subsystem. It is useful for network troubleshooting and performance analysis.

Additionally, it is also a fundamental network service debugging tool used to check which programs are listening on what ports. For instance, the following command will show all TCP ports in listening mode and what programs are listening on them.

```bash
$ sudo netstat -tnlp

Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name    
tcp        0      0 0.0.0.0:53              0.0.0.0:*               LISTEN      1404/pdns_server    
tcp        0      0 0.0.0.0:21              0.0.0.0:*               LISTEN      1064/pure-ftpd 
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      972/sshd            
tcp6       0      0 :::3306                 :::*                    LISTEN      1053/mysqld         
tcp6       0      0 :::3307                 :::*                    LISTEN      1211/mysqld         
tcp6       0      0 :::80                   :::*                    LISTEN      990/httpd           
tcp6       0      0 :::53                   :::*                    LISTEN      1404/pdns_server    
tcp6       0      0 :::21                   :::*                    LISTEN      1064/pure-ftpd (SER 
tcp6       0      0 :::22                   :::*                    LISTEN      972/sshd            
```

**Note**: Although `netstat` is a great tool, it is now obsolete (*deprecated*), its replacement is the `ss` tool which is explained below.

### The `ss` Command

`ss` (socket statistics) is a powerful command-line utility to investigate sockets. It dumps socket statistics and displays information similar to `netstat`. In addition, it shows more TCP and state information compared to other similar utilities.

The following example show how to list all TCP ports (sockets) that are open on a server.

```bash
$ ss -ta

State      Recv-Q Send-Q                                        Local Address:Port                                                         Peer Address:Port                
LISTEN     0      100                                           *:submission                                                              *:*                    
LISTEN     0      128                                           127.0.0.1:fmpro-internal                                                          *:*                    
LISTEN     0      100                                           *:pop3                                                                    *:*                    
LISTEN     0      100                                           *:imap                                                                    *:*                    
LISTEN     0      9                                             *:ftp                                                                     *:*                    
LISTEN     0      128                                           *:ssh                                                                     *:*                    
LISTEN     0      100                                           *:smtp                                                                    *:*                    
LISTEN     0      100                                           *:imaps                                                                   *:*                    
LISTEN     0      100                                           *:pop3s                                                                   *:*                    
...
```

To display all active TCP connections, you can run the following command.

```bash
$ ss -to
```

## DNS Tools

### The `host` Command

Using the `host` command, a simple utility for carrying out DNS lookups, it translates host names to IP addresses and vice versa.

```bash
$ host google.com

google.com has address 172.217.166.78
google.com mail is handled by 20 alt1.aspmx.l.google.com.
google.com mail is handled by 30 alt2.aspmx.l.google.com.
google.com mail is handled by 40 alt3.aspmx.l.google.com.
google.com mail is handled by 50 alt4.aspmx.l.google.com.
google.com mail is handled by 10 aspmx.l.google.com.
```

### The `dig` Command

`dig` (domain information groper) is also another simple DNS lookup utility. It is used to lookup DNS records such as A Record, CNAME, MX Record etc, for example:

```bash
$ dig google.com

; <<>> DiG 9.9.4-RedHat-9.9.4-51.el7 <<>> google.com
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 23083
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 13, ADDITIONAL: 14

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4096
;; QUESTION SECTION:
;google.com.			IN	A

;; ANSWER SECTION:
google.com.		72	IN	A	172.217.166.78

;; AUTHORITY SECTION:
com.			13482	IN	NS	c.gtld-servers.net.
com.			13482	IN	NS	d.gtld-servers.net.
com.			13482	IN	NS	e.gtld-servers.net.
com.			13482	IN	NS	f.gtld-servers.net.
com.			13482	IN	NS	g.gtld-servers.net.
com.			13482	IN	NS	h.gtld-servers.net.
com.			13482	IN	NS	i.gtld-servers.net.
com.			13482	IN	NS	j.gtld-servers.net.
com.			13482	IN	NS	k.gtld-servers.net.
com.			13482	IN	NS	l.gtld-servers.net.
com.			13482	IN	NS	m.gtld-servers.net.
com.			13482	IN	NS	a.gtld-servers.net.
com.			13482	IN	NS	b.gtld-servers.net.

;; ADDITIONAL SECTION:
a.gtld-servers.net.	81883	IN	A	192.5.6.30
b.gtld-servers.net.	3999	IN	A	192.33.14.30
c.gtld-servers.net.	14876	IN	A	192.26.92.30
d.gtld-servers.net.	85172	IN	A	192.31.80.30
e.gtld-servers.net.	95861	IN	A	192.12.94.30
f.gtld-servers.net.	78471	IN	A	192.35.51.30
g.gtld-servers.net.	5217	IN	A	192.42.93.30
h.gtld-servers.net.	111531	IN	A	192.54.112.30
i.gtld-servers.net.	93017	IN	A	192.43.172.30
j.gtld-servers.net.	93542	IN	A	192.48.79.30
k.gtld-servers.net.	107218	IN	A	192.52.178.30
l.gtld-servers.net.	6280	IN	A	192.41.162.30
m.gtld-servers.net.	2689	IN	A	192.55.83.30

;; Query time: 4 msec
;; SERVER: 192.168.0.1#53(192.168.0.1)
;; WHEN: Thu Jul 12 09:30:57 BST 2018
;; MSG SIZE  rcvd: 487
```
**Questions:** 

* How can you use the `dig` command to query for MX records?
* How can you use the `dig` command to query for A records?

### The `nslookup` Command

You can use the `nslookup` utility to query DNS servers both interactively and non-interactively. It is used to query DNS resource records (RR). You can find out the `A record (IP address)` of a domain using the command below.

```bash
$ nslookup google.com

Server:		192.168.0.1
Address:	192.168.0.1#53

Non-authoritative answer:
Name:	google.com
Address: 172.217.166.78
```
You can also perform a reverse domain lookup as shown below.

```bash
$ nslookup 216.58.208.174

Server:		192.168.0.1
Address:	192.168.0.1#53

Non-authoritative answer:
174.208.58.216.in-addr.arpa	name = lhr25s09-in-f14.1e100.net.
174.208.58.216.in-addr.arpa	name = lhr25s09-in-f174.1e100.net.

Authoritative answers can be found from:
in-addr.arpa	nameserver = e.in-addr-servers.arpa.
in-addr.arpa	nameserver = f.in-addr-servers.arpa.
in-addr.arpa	nameserver = a.in-addr-servers.arpa.
in-addr.arpa	nameserver = b.in-addr-servers.arpa.
in-addr.arpa	nameserver = c.in-addr-servers.arpa.
in-addr.arpa	nameserver = d.in-addr-servers.arpa.
a.in-addr-servers.arpa	internet address = 199.180.182.53
b.in-addr-servers.arpa	internet address = 199.253.183.183
c.in-addr-servers.arpa	internet address = 196.216.169.10
d.in-addr-servers.arpa	internet address = 200.10.60.53
e.in-addr-servers.arpa	internet address = 203.119.86.101
f.in-addr-servers.arpa	internet address = 193.0.9.1
```