#!/bin/bash
# KB Networking - OSI Model, Protocols, Troubleshooting
# Source: https://raw.githubusercontent.com/infoparticle/main/kb/kb-networking

#######################
# OSI MODEL
#######################

kb.net.osi_layers() {
    cat << 'EOF'
OSI Model - 7 Layers (Remember: "Please Do Not Throw Sausage Pizza Away")

Layer 7 - Application    | HTTP, FTP, SMTP, DNS        | User applications
Layer 6 - Presentation   | SSL/TLS, JPEG, ASCII        | Data formatting
Layer 5 - Session        | NetBIOS, RPC                | Session management

Layer 4 - Transport      | TCP, UDP                    | End-to-end delivery
Layer 3 - Network        | IP, ICMP, Routing           | Logical addressing

Layer 2 - Data Link      | Ethernet, MAC, Switches     | Physical addressing
Layer 1 - Physical       | Cables, Hubs, Signals       | Bits on wire

Data Units:
    L7-L5: Data
    L4: Segment (TCP) / Datagram (UDP)
    L3: Packet
    L2: Frame
    L1: Bits

Troubleshooting Flow:
    Start at Layer 1 (physical) and work up
    "Can you ping?" → L3 works
    "Can you resolve DNS?" → L7 works
EOF
}

kb.net.osi.layer1() {
    cat << 'EOF'
Layer 1 - Physical Layer

Function:
    - Transmit raw bit stream over physical medium
    - Define electrical/optical specifications
    - Cable types, connectors, voltages

Devices:
    - Cables (Ethernet, Fiber)
    - Hubs (broadcast to all ports)
    - Repeaters (signal amplification)
    - Network Interface Cards (NICs)

Troubleshooting:
    □ Check cable connections
    □ Look for link lights on NIC
    □ Test with different cable
    □ Check port on switch/router
    □ Verify cable type (crossover vs straight)

Commands:
    ethtool eth0                    # Check link status
    ip link show                    # Show interface status
    dmesg | grep eth                # Hardware detection logs
EOF
}

kb.net.osi.layer2() {
    cat << 'EOF'
Layer 2 - Data Link Layer

Function:
    - Frame creation and MAC addressing
    - Error detection (CRC)
    - Flow control
    - Access control (CSMA/CD for Ethernet)

Protocols:
    - Ethernet (IEEE 802.3)
    - Wi-Fi (IEEE 802.11)
    - PPP (Point-to-Point Protocol)
    - ARP (Address Resolution Protocol)

Devices:
    - Switches (forward based on MAC address)
    - Bridges
    - Wireless Access Points

MAC Address:
    Format: 48-bit (6 bytes) - AA:BB:CC:DD:EE:FF
    First 3 bytes: OUI (Organizationally Unique Identifier)
    Last 3 bytes: Device-specific

Troubleshooting:
    □ Check MAC address table on switch
    □ Look for duplicate MAC addresses
    □ Verify VLAN configuration
    □ Check for MAC filtering

Commands:
    ip link show                    # Show MAC address
    arp -a                          # View ARP cache
    ip neigh                        # ARP table (modern)
    tcpdump -e                      # Show ethernet headers
EOF
}

kb.net.osi.layer3() {
    cat << 'EOF'
Layer 3 - Network Layer

Function:
    - Logical addressing (IP)
    - Routing between networks
    - Packet forwarding
    - Fragmentation and reassembly

Protocols:
    - IP (IPv4, IPv6)
    - ICMP (ping, traceroute)
    - Routing protocols (OSPF, BGP, RIP)

Devices:
    - Routers (forward based on IP address)
    - Layer 3 switches

IPv4 Address:
    Format: 32-bit (4 octets) - 192.168.1.1
    Classes: A (1-126), B (128-191), C (192-223)
    Private: 10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16

Troubleshooting:
    □ Verify IP address configuration
    □ Check subnet mask
    □ Verify default gateway
    □ Test with ping
    □ Trace route to destination

Commands:
    ip addr show                    # Show IP addresses
    ip route show                   # Show routing table
    ping 8.8.8.8                    # Test connectivity
    traceroute 8.8.8.8              # Trace route
    mtr 8.8.8.8                     # Combined ping/traceroute
EOF
}

kb.net.osi.layer4() {
    cat << 'EOF'
Layer 4 - Transport Layer

Function:
    - End-to-end communication
    - Port-based multiplexing
    - Reliable delivery (TCP) or best-effort (UDP)
    - Flow control and congestion control

Protocols:

TCP (Transmission Control Protocol):
    - Connection-oriented
    - Reliable, ordered delivery
    - Flow control (sliding window)
    - 3-way handshake: SYN → SYN-ACK → ACK
    - Use: HTTP, SSH, FTP, SMTP

UDP (User Datagram Protocol):
    - Connectionless
    - No reliability guarantees
    - Low overhead
    - Use: DNS, DHCP, Streaming, Gaming

Port Numbers:
    Well-known: 0-1023 (root required)
    Registered: 1024-49151
    Dynamic: 49152-65535

Troubleshooting:
    □ Check if port is open (listening)
    □ Verify firewall rules
    □ Look for connection timeouts
    □ Check for port conflicts

Commands:
    netstat -tuln                   # Show listening ports
    ss -tuln                        # Modern netstat
    lsof -i :80                     # What's using port 80
    nc -zv host 80                  # Test port connectivity
    telnet host 80                  # Manual connection test
EOF
}

kb.net.osi.layer7() {
    cat << 'EOF'
Layer 7 - Application Layer

Function:
    - User-facing protocols and services
    - Application-specific functions
    - Data representation

Common Protocols:
    HTTP/HTTPS (80/443)  - Web traffic
    SSH (22)             - Secure shell
    FTP (21)             - File transfer
    SMTP (25)            - Email sending
    DNS (53)             - Name resolution
    DHCP (67/68)         - IP assignment
    SNMP (161/162)       - Network management

Troubleshooting:
    □ Check application logs
    □ Verify service is running
    □ Test with protocol-specific tools
    □ Check authentication/authorization

Commands:
    curl -I https://example.com     # HTTP headers
    dig example.com                 # DNS lookup
    nslookup example.com            # DNS query
    telnet smtp.gmail.com 25        # Test SMTP
    openssl s_client -connect host:443  # Test SSL/TLS
EOF
}

#######################
# TCP/IP MODEL
#######################

kb.net.tcpip_model() {
    cat << 'EOF'
TCP/IP Model (4 Layers)

Comparison with OSI:

TCP/IP Layer          | OSI Equivalent        | Protocols
----------------------|------------------------|------------------
Application           | L7, L6, L5            | HTTP, FTP, DNS, SSH
Transport             | L4                    | TCP, UDP
Internet              | L3                    | IP, ICMP, ARP
Network Access        | L2, L1                | Ethernet, WiFi

Key Differences:
    - TCP/IP is practical implementation
    - OSI is theoretical reference model
    - TCP/IP combines upper layers
    - Most real networks use TCP/IP

Encapsulation:
    Application Data
    → Add TCP/UDP header = Segment
    → Add IP header = Packet
    → Add Ethernet header = Frame
    → Bits on wire
EOF
}

#######################
# PROTOCOLS
#######################

kb.net.protocol.http() {
    cat << 'EOF'
HTTP - HyperText Transfer Protocol

Port: 80 (HTTP), 443 (HTTPS)
Layer: Application (L7)

Request Methods:
    GET     - Retrieve resource
    POST    - Submit data
    PUT     - Update resource
    DELETE  - Remove resource
    HEAD    - Get headers only
    OPTIONS - Get allowed methods

Status Codes:
    1xx - Informational
    2xx - Success (200 OK, 201 Created)
    3xx - Redirection (301 Moved, 302 Found)
    4xx - Client Error (400 Bad Request, 404 Not Found)
    5xx - Server Error (500 Internal, 503 Unavailable)

Headers:
    Host: example.com
    User-Agent: Mozilla/5.0
    Content-Type: application/json
    Authorization: Bearer <token>

Testing:
    curl -v https://example.com
    curl -X POST -d '{"key":"value"}' -H "Content-Type: application/json" https://api.example.com
    curl -I https://example.com     # Headers only
EOF
}

kb.net.protocol.dns() {
    cat << 'EOF'
DNS - Domain Name System

Port: 53 (UDP/TCP)
Layer: Application (L7)

Record Types:
    A       - IPv4 address
    AAAA    - IPv6 address
    CNAME   - Canonical name (alias)
    MX      - Mail exchange
    NS      - Name server
    TXT     - Text records
    SOA     - Start of authority

Resolution Process:
    1. Check local cache
    2. Query recursive resolver (ISP DNS)
    3. Query root DNS servers
    4. Query TLD servers (.com, .org)
    5. Query authoritative name server
    6. Return IP address

Commands:
    dig example.com                 # Full DNS query
    dig example.com +short          # Just IP
    dig @8.8.8.8 example.com        # Use specific DNS
    dig example.com MX              # Mail servers
    dig example.com ANY             # All records
    nslookup example.com            # Simple lookup
    host example.com                # Quick lookup

Troubleshooting:
    □ Check /etc/resolv.conf
    □ Try different DNS server
    □ Clear DNS cache
    □ Check DNS propagation
EOF
}

kb.net.protocol.tcp() {
    cat << 'EOF'
TCP - Transmission Control Protocol

Port: Variable (application-specific)
Layer: Transport (L4)

Features:
    ✓ Connection-oriented (3-way handshake)
    ✓ Reliable delivery (ACK/retransmission)
    ✓ Ordered delivery (sequence numbers)
    ✓ Flow control (sliding window)
    ✓ Congestion control

3-Way Handshake:
    Client → SYN → Server
    Client ← SYN-ACK ← Server
    Client → ACK → Server
    [Connection established]

Connection Termination:
    Client → FIN → Server
    Client ← ACK ← Server
    Client ← FIN ← Server
    Client → ACK → Server
    [Connection closed]

TCP Header:
    - Source/Dest Port (16 bits each)
    - Sequence Number (32 bits)
    - Acknowledgment Number (32 bits)
    - Flags: SYN, ACK, FIN, RST, PSH, URG
    - Window Size (16 bits)

TCP States:
    LISTEN       - Waiting for connection
    SYN_SENT     - Sent SYN, waiting for SYN-ACK
    ESTABLISHED  - Connection active
    FIN_WAIT     - Closing connection
    TIME_WAIT    - Waiting before full close
    CLOSE_WAIT   - Remote closed, local closing
    CLOSED       - Connection closed

Troubleshooting:
    netstat -an | grep ESTABLISHED
    ss -tan state established
    tcpdump -i eth0 'tcp port 80'
EOF
}

#######################
# COMMON PORTS
#######################

kb.net.ports.common() {
    cat << 'EOF'
Common Port Numbers

Well-Known Ports (0-1023):

    20/21   - FTP (File Transfer Protocol)
    22      - SSH (Secure Shell)
    23      - Telnet
    25      - SMTP (Simple Mail Transfer)
    53      - DNS (Domain Name System)
    67/68   - DHCP (Dynamic Host Configuration)
    80      - HTTP (Web traffic)
    110     - POP3 (Email retrieval)
    143     - IMAP (Email retrieval)
    443     - HTTPS (Secure web)

Common Registered Ports (1024-49151):

    3306    - MySQL
    5432    - PostgreSQL
    6379    - Redis
    8080    - HTTP alternate
    8443    - HTTPS alternate
    27017   - MongoDB
    3389    - RDP (Remote Desktop)
    5900    - VNC

Check port:
    nc -zv host 80                  # Test connectivity
    telnet host 80                  # Manual test
    nmap host -p 80                 # Port scan
EOF
}

#######################
# TROUBLESHOOTING
#######################

kb.net.troubleshoot.connectivity() {
    cat << 'EOF'
Network Connectivity Troubleshooting

Step-by-step approach (bottom-up):

1. Physical Layer (L1):
    □ Check cable connections
    □ Verify link lights
    □ Test: ip link show eth0

2. Data Link Layer (L2):
    □ Check MAC address
    □ Verify switch port
    □ Test: arp -a

3. Network Layer (L3):
    □ Verify IP address: ip addr show
    □ Check subnet mask
    □ Verify default gateway: ip route show
    □ Test local: ping 127.0.0.1
    □ Test gateway: ping <gateway>
    □ Test external: ping 8.8.8.8

4. Transport Layer (L4):
    □ Check listening ports: ss -tuln
    □ Verify firewall: iptables -L
    □ Test port: nc -zv host port

5. Application Layer (L7):
    □ Check DNS: dig example.com
    □ Test service: curl http://host
    □ Check logs: journalctl -u service

Quick Diagnostics:
    ping 127.0.0.1          # Loopback (TCP/IP stack)
    ping <gateway>          # Local network
    ping 8.8.8.8            # Internet (IP)
    ping google.com         # Internet (DNS)

If ping works but browser doesn't:
    → Check DNS: dig google.com
    → Check proxy settings
    → Clear browser cache
    → Check firewall on destination

If ping doesn't work:
    → Check IP: ip addr show
    → Check route: ip route show
    → Check firewall: iptables -L
    → Try traceroute: traceroute 8.8.8.8
EOF
}

kb.net.troubleshoot.dns() {
    cat << 'EOF'
DNS Troubleshooting

Common Issues:

1. Can't resolve domain names:
    □ Check /etc/resolv.conf
    □ Verify DNS servers are reachable
    □ Test with different DNS: dig @8.8.8.8 example.com
    □ Check if DNS port 53 is blocked

2. Slow resolution:
    □ Check DNS server response time
    □ Try different DNS server
    □ Clear local DNS cache

3. Wrong IP returned:
    □ Check DNS propagation
    □ Clear DNS cache
    □ Verify authoritative servers

Commands:
    # Test DNS resolution
    dig example.com
    nslookup example.com
    host example.com

    # Use specific DNS server
    dig @8.8.8.8 example.com
    dig @1.1.1.1 example.com

    # Check DNS path
    dig +trace example.com

    # Reverse lookup
    dig -x 8.8.8.8

    # Clear DNS cache (varies by OS)
    sudo systemd-resolve --flush-caches      # systemd
    sudo dscacheutil -flushcache             # macOS
    ipconfig /flushdns                       # Windows

DNS Configuration:
    /etc/resolv.conf                # DNS servers
    /etc/hosts                      # Local overrides

Public DNS Servers:
    8.8.8.8, 8.8.4.4               # Google
    1.1.1.1, 1.0.0.1               # Cloudflare
    9.9.9.9                        # Quad9
EOF
}

kb.net.troubleshoot.packet_capture() {
    cat << 'EOF'
Packet Capture with tcpdump

Basic Syntax:
    tcpdump [options] [filter]

Common Options:
    -i eth0         # Interface
    -n              # Don't resolve hostnames
    -nn             # Don't resolve hostnames or ports
    -v/-vv/-vvv     # Verbosity
    -c 100          # Capture 100 packets
    -w file.pcap    # Write to file
    -r file.pcap    # Read from file

Common Filters:

    # By host
    tcpdump host 192.168.1.1
    tcpdump src 192.168.1.1
    tcpdump dst 192.168.1.1

    # By port
    tcpdump port 80
    tcpdump src port 80
    tcpdump portrange 80-443

    # By protocol
    tcpdump tcp
    tcpdump udp
    tcpdump icmp

    # By network
    tcpdump net 192.168.1.0/24

    # Combinations (and, or, not)
    tcpdump 'tcp port 80 and host 192.168.1.1'
    tcpdump 'tcp port 80 or tcp port 443'
    tcpdump 'not port 22'

Useful Examples:

    # Capture HTTP traffic
    tcpdump -i eth0 -nn 'tcp port 80'

    # Capture DNS queries
    tcpdump -i eth0 -nn 'udp port 53'

    # Capture SYN packets (connection attempts)
    tcpdump -i eth0 'tcp[tcpflags] & tcp-syn != 0'

    # Show ASCII content
    tcpdump -A -i eth0 'tcp port 80'

    # Save to file for Wireshark
    tcpdump -i eth0 -w capture.pcap

    # Capture specific IP conversation
    tcpdump -i eth0 'host 192.168.1.1 and host 8.8.8.8'
EOF
}

#######################
# SUBNETTING
#######################

kb.net.subnetting() {
    cat << 'EOF'
IP Subnetting Quick Reference

CIDR Notation:
    /24 = 255.255.255.0     (256 addresses, 254 usable)
    /25 = 255.255.255.128   (128 addresses, 126 usable)
    /26 = 255.255.255.192   (64 addresses, 62 usable)
    /27 = 255.255.255.224   (32 addresses, 30 usable)
    /28 = 255.255.255.240   (16 addresses, 14 usable)
    /29 = 255.255.255.248   (8 addresses, 6 usable)
    /30 = 255.255.255.252   (4 addresses, 2 usable - point-to-point)

Quick Calculation:
    Hosts = 2^(32-prefix) - 2
    Example: /24 → 2^(32-24) = 2^8 = 256 - 2 = 254 usable

Private IP Ranges:
    10.0.0.0/8          - 10.0.0.0 to 10.255.255.255
    172.16.0.0/12       - 172.16.0.0 to 172.31.255.255
    192.168.0.0/16      - 192.168.0.0 to 192.168.255.255

Special Addresses:
    Network address     - First address (all host bits 0)
    Broadcast address   - Last address (all host bits 1)
    Loopback           - 127.0.0.0/8
    Link-local         - 169.254.0.0/16 (APIPA)

Example: 192.168.1.0/24
    Network:     192.168.1.0
    First usable: 192.168.1.1
    Last usable:  192.168.1.254
    Broadcast:    192.168.1.255
    Total hosts:  254

Commands:
    ipcalc 192.168.1.0/24           # Calculate subnet info
    sipcalc 192.168.1.0/24          # Alternative calculator
EOF
}

#######################
# UTILITY FUNCTIONS
#######################

kb.net.list() {
    local category="${1:-}"
    echo "Available networking functions:"
    compgen -A function | grep "^kb\.net\." | grep "$category" | sort | sed 's/^/  /'
}

kb.net.search() {
    local query="$1"
    if [[ -z "$query" ]]; then
        echo "Usage: kb.net.search <query>"
        return 1
    fi
    echo "Searching networking functions for: $query"
    compgen -A function | grep "^kb\.net\." | grep -i "$query" | sort
}


# Show help on load
echo "KB Networking loaded. Type 'kb.net.help' for usage."
#!/bin/bash
# KB Networking - Fundamental Concepts and Definitions

#######################
# FUNDAMENTAL CONCEPTS
#######################

kb.net.concepts.broadcast_domain() {
    cat << 'EOF'
Broadcast Domain

Definition:
    Network segment where broadcast frames sent by one device
    are received by all other devices in that segment.

Characteristics:
    - Layer 2 (Data Link) concept
    - Bounded by routers (L3 devices)
    - All devices receive broadcast traffic
    - Can cause performance issues if too large

Devices that separate broadcast domains:
    ✓ Routers (always)
    ✓ Layer 3 switches (when routing)
    ✓ VLANs (logical separation)

Devices that DON'T separate broadcast domains:
    ✗ Hubs (L1 - everything forwarded)
    ✗ Switches (L2 - within same VLAN)
    ✗ Bridges (L2 - forward broadcasts)

Example:
    Network: 192.168.1.0/24
    ├─ PC1 (192.168.1.10)
    ├─ PC2 (192.168.1.20)
    └─ PC3 (192.168.1.30)

    If PC1 sends broadcast (255.255.255.255):
    → PC2 receives it
    → PC3 receives it
    → Router does NOT forward to other networks

Broadcast Types:
    Limited broadcast:  255.255.255.255 (local segment only)
    Directed broadcast: 192.168.1.255 (specific subnet)

Why it matters:
    - Too many broadcasts = network congestion
    - Security: broadcasts visible to all in domain
    - Design: limit broadcast domain size (< 500 hosts typically)

See also:
    kb.net.concepts.collision_domain
    kb.net.concepts.vlan
EOF
}

kb.net.concepts.collision_domain() {
    cat << 'EOF'
Collision Domain

Definition:
    Network segment where simultaneous data transmissions
    can collide with each other.

Characteristics:
    - Layer 1 (Physical) concept
    - Bounded by switches (L2 devices)
    - Uses CSMA/CD (Carrier Sense Multiple Access with Collision Detection)
    - Ethernet half-duplex legacy concept

Devices that separate collision domains:
    ✓ Switches (each port = separate collision domain)
    ✓ Bridges (separate per port)
    ✓ Routers (also separate)

Devices that DON'T separate collision domains:
    ✗ Hubs (all ports in same collision domain)
    ✗ Repeaters (extend collision domain)

Example - Hub (single collision domain):
    Hub
    ├─ PC1 ┐
    ├─ PC2 ├─ All share bandwidth, collisions possible
    └─ PC3 ┘

Example - Switch (separate collision domains):
    Switch
    ├─ PC1 → Own collision domain
    ├─ PC2 → Own collision domain
    └─ PC3 → Own collision domain

Modern Ethernet:
    - Full-duplex switches eliminate collisions
    - Collision domains mostly obsolete concept
    - Still relevant for understanding network fundamentals

Broadcast vs Collision Domain:
    Collision Domain    | Broadcast Domain
    --------------------|-------------------
    Layer 1 concept     | Layer 2 concept
    Separated by switch | Separated by router
    About bandwidth     | About message scope
    Obsolete (full-duplex) | Still relevant

See also:
    kb.net.concepts.broadcast_domain
    kb.net.concepts.switching
EOF
}

kb.net.concepts.vlan() {
    cat << 'EOF'
VLAN - Virtual Local Area Network

Definition:
    Logical grouping of devices on different physical network
    segments, creating separate broadcast domains on same switch.

Purpose:
    - Segmentation: Separate network traffic logically
    - Security: Isolate sensitive systems
    - Flexibility: Move devices without rewiring
    - Performance: Reduce broadcast traffic

VLAN Types:

1. Data VLAN (User VLAN):
    - Normal user traffic
    - Most common type

2. Voice VLAN:
    - VoIP traffic
    - Quality of Service (QoS) priority

3. Management VLAN:
    - Network device management
    - Should be separate for security

4. Native VLAN:
    - Untagged traffic on trunk port
    - Default VLAN 1 (should be changed)

VLAN Tagging (802.1Q):
    Ethernet Frame:
    [Dest MAC][Src MAC][VLAN Tag][Type][Data][FCS]
                        └─ 4 bytes: VLAN ID (1-4094)

Port Types:

Access Port:
    - Connects to end devices (PCs, phones)
    - Belongs to single VLAN
    - Untagged traffic

Trunk Port:
    - Connects switches together
    - Carries multiple VLANs
    - Tagged traffic (802.1Q)

Example Configuration:

    Switch1                         Switch2
    ├─ Port 1: VLAN 10 (Access)    ├─ Port 1: VLAN 10 (Access)
    ├─ Port 2: VLAN 20 (Access)    ├─ Port 2: VLAN 20 (Access)
    └─ Port 24: Trunk ──────────── └─ Port 24: Trunk

VLAN Routing (Inter-VLAN):
    Devices in different VLANs need router/L3 switch to communicate

    VLAN 10 (192.168.10.0/24)
        ↓
    Router/L3 Switch
        ↓
    VLAN 20 (192.168.20.0/24)

Benefits:
    ✓ Reduced broadcast traffic
    ✓ Improved security
    ✓ Simplified management
    ✓ Better performance

Common VLANs:
    VLAN 1: Default (avoid using)
    VLAN 10: Users
    VLAN 20: Servers
    VLAN 30: Guests
    VLAN 99: Management

Commands (Cisco):
    show vlan brief
    show interfaces trunk
    switchport mode access
    switchport access vlan 10

See also:
    kb.net.concepts.broadcast_domain
    kb.net.concepts.switching
EOF
}

kb.net.concepts.nat() {
    cat << 'EOF'
NAT - Network Address Translation

Definition:
    Technique to modify IP address information in packet headers
    while in transit, typically to allow private IPs to access internet.

Why NAT exists:
    - IPv4 address exhaustion
    - Security (hide internal network structure)
    - Network flexibility (change ISP without renumbering)

NAT Types:

1. Static NAT (One-to-One):
    Inside Local    → Inside Global
    192.168.1.10    → 203.0.113.10

    Use: Servers that need consistent public IP

2. Dynamic NAT (Pool):
    Inside pool → Outside pool (first available)
    192.168.1.0/24 → 203.0.113.10-20

    Use: Multiple users sharing IP pool

3. PAT - Port Address Translation (NAT Overload):
    Multiple inside IPs → Single outside IP (different ports)

    192.168.1.10:5000 → 203.0.113.5:40000
    192.168.1.20:5000 → 203.0.113.5:40001
    192.168.1.30:5000 → 203.0.113.5:40002

    Use: Home routers, most common NAT type

NAT Terminology:
    Inside Local:   Private IP (192.168.1.10)
    Inside Global:  Public IP mapped to private
    Outside Local:  Public IP as seen from inside
    Outside Global: Actual public IP on internet

NAT Translation Table:
    Inside Local       | Inside Global      | Protocol | Port
    192.168.1.10:5000 | 203.0.113.5:40000 | TCP      | 80

How PAT Works:

    Internal Network (192.168.1.0/24)
    ├─ PC1: 192.168.1.10
    ├─ PC2: 192.168.1.20
    └─ Router (NAT): 192.168.1.1 (inside), 203.0.113.5 (outside)

    PC1 → Google (8.8.8.8)
    1. Packet: 192.168.1.10:5000 → 8.8.8.8:80
    2. NAT translates: 203.0.113.5:40000 → 8.8.8.8:80
    3. Google response: 8.8.8.8:80 → 203.0.113.5:40000
    4. NAT translates back: 8.8.8.8:80 → 192.168.1.10:5000

NAT Limitations:
    - Breaks end-to-end connectivity (violates internet design)
    - Issues with some protocols (FTP active mode, SIP, IPSec)
    - Can't initiate connections from outside (unless port forwarding)
    - Complicates peer-to-peer applications

Port Forwarding (Destination NAT):
    External: 203.0.113.5:80 → Internal: 192.168.1.100:80

    Use: Host web server on private IP, accessible from internet

Commands:
    # Linux (iptables)
    iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
    iptables -t nat -L -n -v

    # Show NAT translations
    conntrack -L

    # Cisco
    show ip nat translations
    show ip nat statistics

See also:
    kb.net.concepts.subnet
    kb.net.concepts.routing
EOF
}

kb.net.concepts.subnet() {
    cat << 'EOF'
Subnet - Subnetwork

Definition:
    Logical subdivision of an IP network, creating smaller networks
    from a larger network address space.

Purpose:
    - Efficient IP allocation
    - Network organization
    - Security segmentation
    - Broadcast domain control
    - Routing optimization

Subnet Mask:
    Defines network vs host portion of IP address

    Binary: 11111111.11111111.11111111.00000000
    Decimal: 255.255.255.0
    CIDR: /24

Subnet Components:
    Network Address:    First address (all host bits 0)
    Broadcast Address:  Last address (all host bits 1)
    Usable IPs:        Addresses between network and broadcast

Example: 192.168.1.0/24
    Network:        192.168.1.0
    Subnet Mask:    255.255.255.0
    First Usable:   192.168.1.1
    Last Usable:    192.168.1.254
    Broadcast:      192.168.1.255
    Total IPs:      256 (254 usable)

Common Subnet Masks:
    /8  = 255.0.0.0         → 16,777,216 addresses (Class A)
    /16 = 255.255.0.0       → 65,536 addresses (Class B)
    /24 = 255.255.255.0     → 256 addresses (Class C)
    /25 = 255.255.255.128   → 128 addresses
    /26 = 255.255.255.192   → 64 addresses
    /27 = 255.255.255.224   → 32 addresses
    /28 = 255.255.255.240   → 16 addresses
    /29 = 255.255.255.248   → 8 addresses
    /30 = 255.255.255.252   → 4 addresses (2 usable, point-to-point)
    /31 = 255.255.255.254   → 2 addresses (RFC 3021, point-to-point only)
    /32 = 255.255.255.255   → 1 address (host route)

Subnetting Example:
    Given: 192.168.1.0/24
    Need: 4 subnets

    Solution: Borrow 2 bits → /26 (2^2 = 4 subnets)

    Subnet 1: 192.168.1.0/26    (192.168.1.0 - 192.168.1.63)
    Subnet 2: 192.168.1.64/26   (192.168.1.64 - 192.168.1.127)
    Subnet 3: 192.168.1.128/26  (192.168.1.128 - 192.168.1.191)
    Subnet 4: 192.168.1.192/26  (192.168.1.192 - 192.168.1.255)

    Each subnet: 64 IPs (62 usable)

VLSM - Variable Length Subnet Mask:
    Different subnet sizes for efficient IP usage

    Network: 10.0.0.0/8
    ├─ HQ: 10.1.0.0/16 (65,534 hosts)
    ├─ Branch1: 10.2.0.0/24 (254 hosts)
    ├─ Branch2: 10.3.0.0/24 (254 hosts)
    └─ Point-to-point: 10.4.0.0/30 (2 hosts)

Supernetting (Route Aggregation):
    Combine multiple networks into larger block

    192.168.0.0/24
    192.168.1.0/24   } → 192.168.0.0/23
    192.168.2.0/24
    192.168.3.0/24

Commands:
    ipcalc 192.168.1.0/24
    sipcalc 192.168.1.0/24

Quick Calculation:
    Hosts = 2^(32-prefix) - 2
    Networks = 2^(borrowed bits)

See also:
    kb.net.subnetting (detailed reference)
    kb.net.concepts.vlan
    kb.net.concepts.routing
EOF
}

kb.net.concepts.dhcp() {
    cat << 'EOF'
DHCP - Dynamic Host Configuration Protocol

Definition:
    Network protocol that automatically assigns IP addresses and
    network configuration to devices on a network.

Purpose:
    - Automatic IP assignment (no manual configuration)
    - Centralized management
    - IP address reuse (leases)
    - Reduced configuration errors

DHCP Process (DORA):

1. Discover:
    Client → Broadcast: "I need an IP address"
    Source: 0.0.0.0, Dest: 255.255.255.255

2. Offer:
    Server → Client: "Here's an available IP"
    Offers: IP address, subnet mask, gateway, DNS

3. Request:
    Client → Broadcast: "I'll take that IP"
    (Broadcast so other servers know it's taken)

4. Acknowledge:
    Server → Client: "It's yours, lease confirmed"

DHCP Lease:
    - Time period IP is assigned to client
    - Typical: 24 hours to 7 days
    - Client renews at 50% of lease time (T1)
    - Client rebinds at 87.5% if renewal fails (T2)

DHCP Information Provided:
    Essential:
        - IP address
        - Subnet mask
        - Default gateway
        - DNS servers

    Optional:
        - NTP servers
        - TFTP server (for PXE boot)
        - Domain name
        - WINS servers

DHCP Reservation:
    Static IP assignment based on MAC address

    MAC: AA:BB:CC:DD:EE:FF → Always gets 192.168.1.100

    Use: Printers, servers, devices needing consistent IP

DHCP Relay (IP Helper):
    Forward DHCP broadcasts across routers

    Client Subnet → Router → DHCP Server (different subnet)

    Needed because DHCP uses broadcasts (don't cross routers)

Ports:
    Server: UDP 67
    Client: UDP 68

Configuration Example (Linux):
    /etc/dhcp/dhcpd.conf

    subnet 192.168.1.0 netmask 255.255.255.0 {
        range 192.168.1.100 192.168.1.200;
        option routers 192.168.1.1;
        option domain-name-servers 8.8.8.8, 8.8.4.4;
        option domain-name "example.com";
        default-lease-time 86400;
        max-lease-time 604800;
    }

    # Reservation
    host printer {
        hardware ethernet AA:BB:CC:DD:EE:FF;
        fixed-address 192.168.1.10;
    }

Troubleshooting:
    □ Client not getting IP: Check DHCP server running
    □ Wrong IP range: Verify DHCP scope configuration
    □ IP conflicts: Check for rogue DHCP servers
    □ Across routers: Verify DHCP relay/IP helper

Commands:
    # Request new IP
    dhclient -r && dhclient eth0          # Linux
    ipconfig /release && ipconfig /renew   # Windows

    # Show lease
    cat /var/lib/dhcp/dhclient.leases     # Linux
    ipconfig /all                          # Windows

    # DHCP server status
    systemctl status isc-dhcp-server      # Linux
    show ip dhcp binding                   # Cisco

See also:
    kb.net.concepts.subnet
    kb.net.protocol.dns
EOF
}

kb.net.concepts.arp() {
    cat << 'EOF'
ARP - Address Resolution Protocol

Definition:
    Protocol used to map IP addresses (Layer 3) to MAC addresses
    (Layer 2) on a local network.

Purpose:
    - Enable communication on Ethernet networks
    - Resolve "Who has IP X.X.X.X? Tell me at MAC YY:YY:YY:YY:YY:YY"

How ARP Works:

1. Host A wants to send to Host B (192.168.1.20)
2. Host A checks ARP cache for 192.168.1.20
3. If not found, Host A broadcasts ARP Request:
   "Who has 192.168.1.20? Tell 192.168.1.10 (MAC: AA:AA:AA:AA:AA:AA)"
4. Host B responds with ARP Reply (unicast):
   "192.168.1.20 is at MAC: BB:BB:BB:BB:BB:BB"
5. Host A caches the mapping and sends packet

ARP Message Types:
    ARP Request:  Broadcast (FF:FF:FF:FF:FF:FF)
    ARP Reply:    Unicast (to requester's MAC)

ARP Cache:
    Temporary table of IP-to-MAC mappings

    IP Address       MAC Address          Type
    192.168.1.1      00:11:22:33:44:55   Dynamic
    192.168.1.20     AA:BB:CC:DD:EE:FF   Dynamic

    Timeout: Typically 2-20 minutes

Gratuitous ARP:
    Host announces own IP-to-MAC mapping (unrequested)

    Uses:
    - Detect IP conflicts
    - Update other hosts' ARP caches
    - Notify of MAC address change (after failover)

Proxy ARP:
    Router responds to ARP requests on behalf of another device

    Use: Allow devices on different subnets to appear on same network

ARP Spoofing (Security Issue):
    Attacker sends fake ARP replies to poison cache

    Attack: "192.168.1.1 is at ATTACKER_MAC"
    Result: Traffic meant for gateway goes to attacker (MITM)

    Mitigation:
    - Static ARP entries for critical hosts
    - ARP inspection on switches
    - Port security

Reverse ARP (RARP):
    Opposite: MAC → IP lookup
    Obsolete (replaced by DHCP)

Commands:
    # View ARP cache
    arp -a                    # All entries
    ip neigh show             # Linux modern

    # Add static entry
    arp -s 192.168.1.1 00:11:22:33:44:55

    # Delete entry
    arp -d 192.168.1.1

    # Clear cache
    ip -s -s neigh flush all  # Linux

    # Monitor ARP traffic
    tcpdump -i eth0 arp
    tcpdump -i eth0 'arp and host 192.168.1.1'

ARP Packet Structure:
    Hardware Type: Ethernet (1)
    Protocol Type: IPv4 (0x0800)
    Hardware Size: 6 (MAC address length)
    Protocol Size: 4 (IP address length)
    Opcode: Request (1) or Reply (2)
    Sender MAC: Source MAC address
    Sender IP: Source IP address
    Target MAC: Destination MAC (00:00:00:00:00:00 in request)
    Target IP: Destination IP

Limitations:
    - Only works on local network (L2)
    - Broadcast overhead
    - Security vulnerabilities (spoofing)
    - IPv6 uses NDP (Neighbor Discovery Protocol) instead

See also:
    kb.net.osi.layer2
    kb.net.osi.layer3
    kb.net.concepts.broadcast_domain
EOF
}

kb.net.concepts.routing() {
    cat << 'EOF'
Routing

Definition:
    Process of selecting paths in a network to send traffic from
    source to destination across multiple networks.

Layer: Network Layer (L3)

Routing Table:
    Destination      Gateway         Interface   Metric
    0.0.0.0/0       192.168.1.1     eth0        0      (Default route)
    192.168.1.0/24  0.0.0.0         eth0        0      (Directly connected)
    10.0.0.0/8      192.168.1.254   eth0        10     (Static/dynamic route)

Route Types:

1. Directly Connected:
    Networks directly attached to router interface
    Metric: 0 (most preferred)

2. Static Routes:
    Manually configured by administrator

    Command: ip route add 10.0.0.0/8 via 192.168.1.254

    Use: Small networks, specific routes, backup paths

3. Dynamic Routes:
    Learned via routing protocols (RIP, OSPF, BGP)
    Automatically update on topology changes

4. Default Route (0.0.0.0/0):
    "Route of last resort" - used when no specific match
    Typically points to ISP or internet gateway

Routing Decision Process:
    1. Check routing table for destination
    2. Find longest prefix match (most specific)
    3. If tie, use lowest metric/administrative distance
    4. Forward packet to next hop
    5. If no match, use default route
    6. If no default, drop packet (destination unreachable)

Longest Prefix Match:
    Packet to: 192.168.1.50

    Routes in table:
    192.168.0.0/16  ← Less specific
    192.168.1.0/24  ← More specific (WINNER)

    Uses most specific match

Administrative Distance (Trustworthiness):
    0   - Directly connected
    1   - Static route
    90  - EIGRP (internal)
    110 - OSPF
    120 - RIP
    200 - EIGRP (external)
    255 - Unknown (never used)

    Lower = More trusted

Routing Protocols:

Distance Vector (RIP):
    - Metric: Hop count
    - Max: 15 hops (16 = unreachable)
    - Updates: Periodic (30 seconds)
    - Convergence: Slow
    - Use: Small, simple networks

Link State (OSPF):
    - Metric: Cost (based on bandwidth)
    - Topology database (SPF tree)
    - Updates: Triggered (only on changes)
    - Convergence: Fast
    - Use: Large enterprise networks

Path Vector (BGP):
    - Internet routing protocol
    - AS (Autonomous System) paths
    - Policy-based routing
    - Use: ISPs, internet backbone

Inter-VLAN Routing:
    Router or L3 switch required for VLANs to communicate

    VLAN 10 (192.168.10.0/24)
        ↓
    Router/L3 Switch
        ↓
    VLAN 20 (192.168.20.0/24)

Router vs Layer 3 Switch:
    Router:
    - Software-based routing
    - More features (NAT, VPN, etc.)
    - Lower performance

    L3 Switch:
    - Hardware-based routing (ASIC)
    - Limited features
    - Higher performance (wire-speed)

Commands:
    # View routing table
    ip route show              # Linux
    route -n                   # Linux (old)
    netstat -rn                # BSD/macOS
    route print                # Windows

    # Add static route
    ip route add 10.0.0.0/8 via 192.168.1.254
    route add -net 10.0.0.0/8 gw 192.168.1.254  # Old syntax

    # Delete route
    ip route del 10.0.0.0/8

    # Default route
    ip route add default via 192.168.1.1

    # Cisco
    show ip route
    ip route 10.0.0.0 255.0.0.0 192.168.1.254

Traceroute:
    Shows path packets take (each hop)

    traceroute 8.8.8.8
    mtr 8.8.8.8               # Continuous traceroute

See also:
    kb.net.osi.layer3
    kb.net.concepts.subnet
    kb.net.concepts.nat
EOF
}

kb.net.concepts.switching() {
    cat << 'EOF'
Switching

Definition:
    Process of forwarding frames between devices on the same network
    using MAC addresses.

Layer: Data Link Layer (L2)

How Switches Work:

1. Learning:
    - Switch receives frame on port
    - Reads source MAC address
    - Adds MAC to MAC address table with port number

2. Forwarding:
    - Reads destination MAC address
    - Looks up MAC in table
    - Forwards frame to correct port

3. Flooding:
    - If destination MAC not in table
    - Forwards to all ports except receiving port
    - (Unknown unicast, broadcast, multicast)

MAC Address Table:
    MAC Address          Port    VLAN
    AA:BB:CC:DD:EE:FF    1       10
    11:22:33:44:55:66    2       10
    FF:EE:DD:CC:BB:AA    3       20

    Aging time: 300 seconds (typical)

Switching Methods:

1. Store-and-Forward:
    - Receives entire frame
    - Checks FCS (error detection)
    - Then forwards if valid
    - Slowest but most reliable

2. Cut-Through:
    - Reads destination MAC only
    - Forwards immediately
    - Fastest but no error checking

3. Fragment-Free:
    - Reads first 64 bytes
    - Catches most collisions
    - Middle ground

Switch Port States (Spanning Tree):
    Disabled:    Admin shutdown
    Blocking:    Not forwarding (prevent loops)
    Listening:   Not forwarding, building topology
    Learning:    Not forwarding, learning MAC addresses
    Forwarding:  Normal operation

Port Types:

Access Port:
    - Connects end devices
    - Single VLAN
    - Untagged frames

Trunk Port:
    - Connects switches
    - Multiple VLANs (802.1Q tagging)
    - Tagged frames

Spanning Tree Protocol (STP):
    Prevents Layer 2 loops

    Without STP:
    Switch A ←→ Switch B
        ↓           ↓
        └──Switch C─┘

    Broadcast loops infinitely → Broadcast storm

    With STP:
    - Elects root bridge
    - Blocks redundant paths
    - Activates if primary path fails

Switch Security Features:

Port Security:
    - Limit MAC addresses per port
    - Violation actions: Protect/Restrict/Shutdown

    switchport port-security maximum 2
    switchport port-security violation shutdown

DHCP Snooping:
    - Prevents rogue DHCP servers
    - Builds trusted database of IP-MAC bindings

Dynamic ARP Inspection (DAI):
    - Prevents ARP spoofing
    - Uses DHCP snooping database

Storm Control:
    - Limits broadcast/multicast traffic
    - Prevents network saturation

VLANs and Switching:
    Switch maintains separate MAC table per VLAN

    VLAN 10:
    MAC              Port
    AA:BB:CC:11:11   1

    VLAN 20:
    MAC              Port
    DD:EE:FF:22:22   2

Commands:
    # Show MAC address table
    show mac address-table         # Cisco
    bridge fdb show                # Linux

    # Show interface status
    show interfaces status
    show interfaces trunk

    # Port configuration
    switchport mode access
    switchport access vlan 10

    # STP info
    show spanning-tree

Layer 2 vs Layer 3:
    L2 Switch:
    - MAC-based forwarding
    - Same network only
    - Faster (hardware-based)
    - Broadcast propagation

    L3 Switch/Router:
    - IP-based forwarding
    - Between networks
    - Routing capability
    - Broadcast isolation

See also:
    kb.net.osi.layer2
    kb.net.concepts.vlan
    kb.net.concepts.broadcast_domain
    kb.net.concepts.collision_domain
EOF
}

kb.net.concepts.gateway() {
    cat << 'EOF'
Default Gateway

Definition:
    Router IP address that serves as the access point or transit
    node to reach devices on other networks.

Purpose:
    - Route traffic outside local subnet
    - Connect local network to internet/other networks
    - Acts as "exit point" for local network

How It Works:

    Local Network: 192.168.1.0/24
    ├─ PC: 192.168.1.10
    ├─ Laptop: 192.168.1.20
    └─ Gateway: 192.168.1.1 → Internet

    When PC wants to reach 8.8.8.8:
    1. PC checks: Is 8.8.8.8 on my subnet? (No)
    2. PC sends packet to default gateway (192.168.1.1)
    3. Gateway routes packet to internet
    4. Response comes back through gateway
    5. Gateway forwards to PC

Routing Decision:
    Destination in same subnet?
    ├─ Yes → Send directly (ARP for MAC, send frame)
    └─ No → Send to default gateway

Multiple Gateways:
    Primary:   192.168.1.1 (default)
    Secondary: 192.168.1.2 (backup, if primary fails)

    Only one active at a time (unless load balancing)

Gateway Configuration:

    Linux:
    ip route add default via 192.168.1.1

    Or via DHCP:
    option routers 192.168.1.1;

    Windows:
    Default Gateway: 192.168.1.1

    Cisco:
    ip default-gateway 192.168.1.1

Verification:
    # Check gateway
    ip route show | grep default
    route -n | grep UG
    netstat -rn | grep default

    # Test connectivity to gateway
    ping 192.168.1.1

    # Test internet through gateway
    ping 8.8.8.8
    traceroute 8.8.8.8

Troubleshooting:
    Can't reach internet but local network works?

    □ Check gateway configuration: ip route show
    □ Ping gateway: ping 192.168.1.1
    □ Ping internet: ping 8.8.8.8
    □ Check DNS: ping google.com
    □ Verify gateway has internet access
    □ Check NAT on gateway

Gateway vs Router:
    Gateway (Generic):
    - Any device connecting networks
    - Could be router, firewall, proxy

    Router (Specific):
    - Layer 3 device
    - Forwards based on IP
    - Most common gateway type

See also:
    kb.net.concepts.routing
    kb.net.concepts.nat
    kb.net.concepts.subnet
EOF
}

# Update help function
kb.net.help() {
    cat << 'EOF'
KB Networking - OSI Model, Protocols, Troubleshooting, Concepts

Usage:
  kb.net.<category>.<function>

Fundamental Concepts:
  kb.net.concepts.broadcast_domain       # Broadcast domain explained
  kb.net.concepts.collision_domain       # Collision domain explained
  kb.net.concepts.vlan                   # Virtual LANs
  kb.net.concepts.nat                    # Network Address Translation
  kb.net.concepts.subnet                 # Subnetting fundamentals
  kb.net.concepts.dhcp                   # DHCP process and configuration
  kb.net.concepts.arp                    # Address Resolution Protocol
  kb.net.concepts.routing                # Routing fundamentals
  kb.net.concepts.switching              # Layer 2 switching
  kb.net.concepts.gateway                # Default gateway explained

OSI Model:
  kb.net.osi_layers                      # All 7 layers overview
  kb.net.osi.layer1                      # Physical layer
  kb.net.osi.layer2                      # Data link layer
  kb.net.osi.layer3                      # Network layer
  kb.net.osi.layer4                      # Transport layer
  kb.net.osi.layer7                      # Application layer

Protocols:
  kb.net.protocol.http                   # HTTP/HTTPS
  kb.net.protocol.dns                    # DNS
  kb.net.protocol.tcp                    # TCP
  kb.net.tcpip_model                     # TCP/IP model

Reference:
  kb.net.ports.common                    # Common port numbers
  kb.net.subnetting                      # Subnetting reference

Troubleshooting:
  kb.net.troubleshoot.connectivity       # General connectivity
  kb.net.troubleshoot.dns                # DNS issues
  kb.net.troubleshoot.packet_capture     # tcpdump usage

Utility:
  kb.net.list [category]                 # List functions
  kb.net.search <query>                  # Search functions
  kb.net.help                            # This help

Examples:
  kb.net.concepts.vlan                   # Learn about VLANs
  kb.net.concepts.nat                    # Understand NAT
  kb.net.osi_layers                      # View OSI model
  kb.net.troubleshoot.connectivity       # Troubleshooting steps

Tab completion:
  kb.net.<TAB>                           # Show all categories
  kb.net.concepts.<TAB>                  # Show all concepts
  kb.net.osi.<TAB>                       # Show OSI layers

Install: curl -sSL https://raw.githubusercontent.com/yourusername/kb-networking/main/install.sh | bash
EOF
}

echo "KB Networking loaded. Type 'kb.net.help' for usage."
