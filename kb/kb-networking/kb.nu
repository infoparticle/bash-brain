# KB Networking Module for Nushell
# Converted from bash-brain with nested tables and Nushell superpowers
# Install: Save to ~/.config/nushell/kb/net.nu

# OSI Model - All Layers Overview
export def "kb net osi" [] {
    [
        {
            layer: 7
            name: "Application"
            protocols: "HTTP, FTP, SMTP, DNS"
            devices: "User applications"
            data_unit: "Data"
            mnemonic: "Away"
        }
        {
            layer: 6
            name: "Presentation"
            protocols: "SSL/TLS, JPEG, ASCII"
            devices: "Data formatting"
            data_unit: "Data"
            mnemonic: "Pizza"
        }
        {
            layer: 5
            name: "Session"
            protocols: "NetBIOS, RPC"
            devices: "Session management"
            data_unit: "Data"
            mnemonic: "Sausage"
        }
        {
            layer: 4
            name: "Transport"
            protocols: "TCP, UDP"
            devices: "End-to-end delivery"
            data_unit: "Segment/Datagram"
            mnemonic: "Throw"
        }
        {
            layer: 3
            name: "Network"
            protocols: "IP, ICMP, Routing"
            devices: "Routers, L3 switches"
            data_unit: "Packet"
            mnemonic: "Not"
        }
        {
            layer: 2
            name: "Data Link"
            protocols: "Ethernet, MAC, ARP"
            devices: "Switches, Bridges"
            data_unit: "Frame"
            mnemonic: "Do"
        }
        {
            layer: 1
            name: "Physical"
            protocols: "Cables, Hubs, Signals"
            devices: "NICs, Cables, Hubs"
            data_unit: "Bits"
            mnemonic: "Please"
        }
    ]
}

# OSI Layer 1 - Physical
export def "kb net osi l1" [] {
    {
        layer: 1
        name: "Physical Layer"
        function: "Transmit raw bit stream over physical medium"
        responsibilities: [
            "Electrical/optical specifications"
            "Cable types and connectors"
            "Voltage levels"
            "Bit transmission timing"
        ]
        devices: [
            {type: "Cables", examples: "Ethernet, Fiber"}
            {type: "Hubs", function: "Broadcast to all ports"}
            {type: "Repeaters", function: "Signal amplification"}
            {type: "NICs", function: "Network interface cards"}
        ]
        troubleshooting: {
            checks: [
                "Check cable connections"
                "Look for link lights on NIC"
                "Test with different cable"
                "Check port on switch/router"
                "Verify cable type (crossover vs straight)"
            ]
            commands: [
                {cmd: "ethtool eth0", purpose: "Check link status"}
                {cmd: "ip link show", purpose: "Show interface status"}
                {cmd: "dmesg | grep eth", purpose: "Hardware detection logs"}
            ]
        }
    }
}

# OSI Layer 2 - Data Link
export def "kb net osi l2" [] {
    {
        layer: 2
        name: "Data Link Layer"
        function: "Frame creation, MAC addressing, error detection"
        responsibilities: [
            "Frame creation and MAC addressing"
            "Error detection (CRC)"
            "Flow control"
            "Access control (CSMA/CD)"
        ]
        protocols: [
            {name: "Ethernet", standard: "IEEE 802.3"}
            {name: "Wi-Fi", standard: "IEEE 802.11"}
            {name: "PPP", standard: "Point-to-Point Protocol"}
            {name: "ARP", standard: "Address Resolution Protocol"}
        ]
        devices: [
            {type: "Switches", function: "Forward based on MAC address"}
            {type: "Bridges", function: "Connect network segments"}
            {type: "WAPs", function: "Wireless Access Points"}
        ]
        mac_address: {
            format: "48-bit (6 bytes)"
            example: "AA:BB:CC:DD:EE:FF"
            structure: {
                oui: "First 3 bytes (manufacturer)"
                nic: "Last 3 bytes (device-specific)"
            }
        }
        troubleshooting: {
            checks: [
                "Check MAC address table on switch"
                "Look for duplicate MAC addresses"
                "Verify VLAN configuration"
                "Check for MAC filtering"
            ]
            commands: [
                {cmd: "ip link show", purpose: "Show MAC address"}
                {cmd: "arp -a", purpose: "View ARP cache"}
                {cmd: "ip neigh", purpose: "ARP table (modern)"}
                {cmd: "tcpdump -e", purpose: "Show ethernet headers"}
            ]
        }
    }
}

# OSI Layer 3 - Network
export def "kb net osi l3" [] {
    {
        layer: 3
        name: "Network Layer"
        function: "Logical addressing, routing, packet forwarding"
        responsibilities: [
            "Logical addressing (IP)"
            "Routing between networks"
            "Packet forwarding"
            "Fragmentation and reassembly"
        ]
        protocols: [
            {name: "IPv4", type: "Addressing"}
            {name: "IPv6", type: "Addressing"}
            {name: "ICMP", type: "Control", uses: "ping, traceroute"}
            {name: "OSPF", type: "Routing", scope: "Interior"}
            {name: "BGP", type: "Routing", scope: "Exterior"}
            {name: "RIP", type: "Routing", scope: "Interior"}
        ]
        devices: [
            {type: "Routers", function: "Forward based on IP address"}
            {type: "Layer 3 Switches", function: "Hardware-accelerated routing"}
        ]
        ipv4: {
            format: "32-bit (4 octets)"
            example: "192.168.1.1"
            classes: [
                {class: "A", range: "1-126", default_mask: "/8"}
                {class: "B", range: "128-191", default_mask: "/16"}
                {class: "C", range: "192-223", default_mask: "/24"}
            ]
            private_ranges: [
                {range: "10.0.0.0/8", hosts: "16,777,216"}
                {range: "172.16.0.0/12", hosts: "1,048,576"}
                {range: "192.168.0.0/16", hosts: "65,536"}
            ]
        }
        troubleshooting: {
            checks: [
                "Verify IP address configuration"
                "Check subnet mask"
                "Verify default gateway"
                "Test with ping"
                "Trace route to destination"
            ]
            commands: [
                {cmd: "ip addr show", purpose: "Show IP addresses"}
                {cmd: "ip route show", purpose: "Show routing table"}
                {cmd: "ping 8.8.8.8", purpose: "Test connectivity"}
                {cmd: "traceroute 8.8.8.8", purpose: "Trace route"}
                {cmd: "mtr 8.8.8.8", purpose: "Combined ping/traceroute"}
            ]
        }
    }
}

# OSI Layer 4 - Transport
export def "kb net osi l4" [] {
    {
        layer: 4
        name: "Transport Layer"
        function: "End-to-end communication, port multiplexing"
        protocols: {
            tcp: {
                name: "Transmission Control Protocol"
                characteristics: [
                    "Connection-oriented"
                    "Reliable, ordered delivery"
                    "Flow control (sliding window)"
                    "3-way handshake: SYN → SYN-ACK → ACK"
                ]
                use_cases: "HTTP, SSH, FTP, SMTP"
                handshake: [
                    {step: 1, direction: "Client → Server", packet: "SYN"}
                    {step: 2, direction: "Server → Client", packet: "SYN-ACK"}
                    {step: 3, direction: "Client → Server", packet: "ACK"}
                ]
                states: [
                    {state: "LISTEN", description: "Waiting for connection"}
                    {state: "SYN_SENT", description: "Sent SYN, waiting"}
                    {state: "ESTABLISHED", description: "Connection active"}
                    {state: "FIN_WAIT", description: "Closing connection"}
                    {state: "TIME_WAIT", description: "Waiting before close"}
                    {state: "CLOSED", description: "Connection closed"}
                ]
            }
            udp: {
                name: "User Datagram Protocol"
                characteristics: [
                    "Connectionless"
                    "No reliability guarantees"
                    "Low overhead"
                    "Fast"
                ]
                use_cases: "DNS, DHCP, Streaming, Gaming"
            }
        }
        port_ranges: [
            {range: "0-1023", type: "Well-known", requires: "root"}
            {range: "1024-49151", type: "Registered", requires: "normal"}
            {range: "49152-65535", type: "Dynamic", requires: "ephemeral"}
        ]
        troubleshooting: {
            checks: [
                "Check if port is open (listening)"
                "Verify firewall rules"
                "Look for connection timeouts"
                "Check for port conflicts"
            ]
            commands: [
                {cmd: "netstat -tuln", purpose: "Show listening ports"}
                {cmd: "ss -tuln", purpose: "Modern netstat"}
                {cmd: "lsof -i :80", purpose: "What's using port 80"}
                {cmd: "nc -zv host 80", purpose: "Test port connectivity"}
            ]
        }
    }
}

# OSI Layer 7 - Application
export def "kb net osi l7" [] {
    {
        layer: 7
        name: "Application Layer"
        function: "User-facing protocols and services"
        protocols: [
            {name: "HTTP/HTTPS", port: "80/443", purpose: "Web traffic"}
            {name: "SSH", port: 22, purpose: "Secure shell"}
            {name: "FTP", port: 21, purpose: "File transfer"}
            {name: "SMTP", port: 25, purpose: "Email sending"}
            {name: "DNS", port: 53, purpose: "Name resolution"}
            {name: "DHCP", port: "67/68", purpose: "IP assignment"}
            {name: "SNMP", port: "161/162", purpose: "Network management"}
        ]
        troubleshooting: {
            checks: [
                "Check application logs"
                "Verify service is running"
                "Test with protocol-specific tools"
                "Check authentication/authorization"
            ]
            commands: [
                {cmd: "curl -I https://example.com", purpose: "HTTP headers"}
                {cmd: "dig example.com", purpose: "DNS lookup"}
                {cmd: "nslookup example.com", purpose: "DNS query"}
                {cmd: "openssl s_client -connect host:443", purpose: "Test SSL/TLS"}
            ]
        }
    }
}

# Common Ports
export def "kb net ports" [] {
    [
        {port: 20, protocol: "TCP", service: "FTP Data"}
        {port: 21, protocol: "TCP", service: "FTP Control"}
        {port: 22, protocol: "TCP", service: "SSH"}
        {port: 23, protocol: "TCP", service: "Telnet"}
        {port: 25, protocol: "TCP", service: "SMTP"}
        {port: 53, protocol: "UDP/TCP", service: "DNS"}
        {port: 67, protocol: "UDP", service: "DHCP Server"}
        {port: 68, protocol: "UDP", service: "DHCP Client"}
        {port: 80, protocol: "TCP", service: "HTTP"}
        {port: 110, protocol: "TCP", service: "POP3"}
        {port: 143, protocol: "TCP", service: "IMAP"}
        {port: 443, protocol: "TCP", service: "HTTPS"}
        {port: 3306, protocol: "TCP", service: "MySQL"}
        {port: 5432, protocol: "TCP", service: "PostgreSQL"}
        {port: 6379, protocol: "TCP", service: "Redis"}
        {port: 8080, protocol: "TCP", service: "HTTP Alt"}
        {port: 8443, protocol: "TCP", service: "HTTPS Alt"}
        {port: 27017, protocol: "TCP", service: "MongoDB"}
        {port: 3389, protocol: "TCP", service: "RDP"}
        {port: 5900, protocol: "TCP", service: "VNC"}
    ]
}

# VLAN Concept
export def "kb net concept vlan" [] {
    {
        name: "VLAN (Virtual LAN)"
        definition: "Logical network segmentation at Layer 2"
        purpose: {
            segmentation: "Separate network traffic logically"
            security: "Isolate sensitive systems"
            flexibility: "Move devices without rewiring"
            performance: "Reduce broadcast traffic"
        }
        types: [
            {type: "Data VLAN", use: "Normal user traffic", common: true}
            {type: "Voice VLAN", use: "VoIP traffic with QoS", common: true}
            {type: "Management VLAN", use: "Network device management", security: "Critical"}
            {type: "Native VLAN", use: "Untagged trunk traffic", default: 1}
        ]
        port_types: {
            access: {
                connects: "End devices (PCs, phones)"
                vlans: "Single VLAN"
                traffic: "Untagged"
            }
            trunk: {
                connects: "Switch-to-switch"
                vlans: "Multiple VLANs"
                traffic: "Tagged (802.1Q)"
            }
        }
        tagging: {
            standard: "802.1Q"
            tag_size: "4 bytes"
            vlan_range: "1-4094"
            frame_structure: "Dest MAC | Src MAC | VLAN Tag | Type | Data | FCS"
        }
        common_vlans: [
            {id: 1, name: "Default", note: "Avoid using"}
            {id: 10, name: "Users", use: "Workstations"}
            {id: 20, name: "Servers", use: "Server farm"}
            {id: 30, name: "Guests", use: "Guest WiFi"}
            {id: 99, name: "Management", use: "Network devices"}
        ]
        benefits: [
            "Reduced broadcast traffic"
            "Improved security"
            "Simplified management"
            "Better performance"
        ]
    }
}

# NAT Concept
export def "kb net concept nat" [] {
    {
        name: "NAT (Network Address Translation)"
        definition: "Modify IP addresses in packet headers during transit"
        why_exists: [
            "IPv4 address exhaustion"
            "Security (hide internal IPs)"
            "Network flexibility"
        ]
        types: {
            static: {
                mapping: "One-to-one"
                example: "192.168.1.10 → 203.0.113.10"
                use_case: "Servers needing consistent public IP"
            }
            dynamic: {
                mapping: "Pool-based (first available)"
                example: "192.168.1.0/24 → 203.0.113.10-20"
                use_case: "Multiple users sharing IP pool"
            }
            pat: {
                name: "Port Address Translation (NAT Overload)"
                mapping: "Many-to-one with different ports"
                examples: [
                    "192.168.1.10:5000 → 203.0.113.5:40000"
                    "192.168.1.20:5000 → 203.0.113.5:40001"
                    "192.168.1.30:5000 → 203.0.113.5:40002"
                ]
                use_case: "Home routers (most common)"
            }
        }
        terminology: {
            inside_local: "Private IP (192.168.1.10)"
            inside_global: "Public IP mapped to private"
            outside_local: "Public IP as seen from inside"
            outside_global: "Actual public IP on internet"
        }
        limitations: [
            "Breaks end-to-end connectivity"
            "Issues with some protocols (FTP, SIP, IPSec)"
            "Can't initiate connections from outside"
            "Complicates peer-to-peer applications"
        ]
    }
}

# Broadcast Domain Concept
export def "kb net concept broadcast" [] {
    {
        name: "Broadcast Domain"
        layer: 2
        definition: "Network segment where broadcast frames are received by all devices"
        separated_by: [
            {device: "Routers", always: true}
            {device: "Layer 3 switches", when: "routing enabled"}
            {device: "VLANs", method: "logical separation"}
        ]
        not_separated_by: [
            {device: "Hubs", reason: "L1 - everything forwarded"}
            {device: "Switches", reason: "L2 - within same VLAN"}
            {device: "Bridges", reason: "L2 - forward broadcasts"}
        ]
        broadcast_types: [
            {type: "Limited", address: "255.255.255.255", scope: "Local segment only"}
            {type: "Directed", address: "192.168.1.255", scope: "Specific subnet"}
        ]
        design_considerations: {
            max_hosts: "< 500 typically"
            issues_when_large: [
                "Network congestion"
                "Security concerns (broadcasts visible to all)"
                "Performance degradation"
            ]
        }
    }
}

# Subnetting Reference
export def "kb net subnet" [] {
    [
        {cidr: "/24", mask: "255.255.255.0", hosts: 256, usable: 254, note: "Class C"}
        {cidr: "/25", mask: "255.255.255.128", hosts: 128, usable: 126, note: "Half of /24"}
        {cidr: "/26", mask: "255.255.255.192", hosts: 64, usable: 62, note: "Quarter of /24"}
        {cidr: "/27", mask: "255.255.255.224", hosts: 32, usable: 30, note: "Small office"}
        {cidr: "/28", mask: "255.255.255.240", hosts: 16, usable: 14, note: "Very small"}
        {cidr: "/29", mask: "255.255.255.248", hosts: 8, usable: 6, note: "Tiny subnet"}
        {cidr: "/30", mask: "255.255.255.252", hosts: 4, usable: 2, note: "Point-to-point"}
        {cidr: "/31", mask: "255.255.255.254", hosts: 2, usable: 2, note: "RFC 3021 p2p"}
        {cidr: "/32", mask: "255.255.255.255", hosts: 1, usable: 1, note: "Host route"}
    ]
}

# Troubleshooting Connectivity
export def "kb net fix connectivity" [] {
    {
        approach: "Bottom-up (Layer 1 to Layer 7)"
        steps: [
            {
                layer: "L1 - Physical"
                checks: [
                    "Check cable connections"
                    "Verify link lights"
                    "Test with different cable"
                ]
                command: "ip link show eth0"
            }
            {
                layer: "L2 - Data Link"
                checks: [
                    "Check MAC address"
                    "Verify switch port"
                    "Check ARP table"
                ]
                command: "arp -a"
            }
            {
                layer: "L3 - Network"
                checks: [
                    "Verify IP address"
                    "Check subnet mask"
                    "Verify default gateway"
                    "Test local connectivity"
                    "Test external connectivity"
                ]
                commands: [
                    {cmd: "ip addr show", check: "IP config"}
                    {cmd: "ip route show", check: "Gateway"}
                    {cmd: "ping 127.0.0.1", check: "Loopback"}
                    {cmd: "ping <gateway>", check: "Local network"}
                    {cmd: "ping 8.8.8.8", check: "Internet"}
                ]
            }
            {
                layer: "L4 - Transport"
                checks: [
                    "Check listening ports"
                    "Verify firewall rules"
                    "Test port connectivity"
                ]
                commands: [
                    {cmd: "ss -tuln", check: "Listening ports"}
                    {cmd: "iptables -L", check: "Firewall"}
                    {cmd: "nc -zv host port", check: "Port test"}
                ]
            }
            {
                layer: "L7 - Application"
                checks: [
                    "Check DNS resolution"
                    "Test service"
                    "Check logs"
                ]
                commands: [
                    {cmd: "dig example.com", check: "DNS"}
                    {cmd: "curl http://host", check: "Service"}
                    {cmd: "journalctl -u service", check: "Logs"}
                ]
            }
        ]
        quick_diagnostics: [
            {test: "ping 127.0.0.1", validates: "TCP/IP stack"}
            {test: "ping <gateway>", validates: "Local network"}
            {test: "ping 8.8.8.8", validates: "Internet (IP)"}
            {test: "ping google.com", validates: "Internet (DNS)"}
        ]
    }
}

# DHCP Concept
export def "kb net concept dhcp" [] {
    {
        name: "DHCP (Dynamic Host Configuration Protocol)"
        purpose: "Automatic IP address assignment"
        process: {
            name: "DORA"
            steps: [
                {
                    step: "Discover"
                    direction: "Client → Broadcast"
                    message: "I need an IP address"
                    addresses: {src: "0.0.0.0", dst: "255.255.255.255"}
                }
                {
                    step: "Offer"
                    direction: "Server → Client"
                    message: "Here's an available IP"
                    includes: ["IP address", "Subnet mask", "Gateway", "DNS"]
                }
                {
                    step: "Request"
                    direction: "Client → Broadcast"
                    message: "I'll take that IP"
                    why_broadcast: "Inform other servers it's taken"
                }
                {
                    step: "Acknowledge"
                    direction: "Server → Client"
                    message: "It's yours, lease confirmed"
                }
            ]
        }
        lease: {
            typical_duration: "24 hours to 7 days"
            renewal_at: "50% of lease time (T1)"
            rebind_at: "87.5% if renewal fails (T2)"
        }
        ports: {
            server: {port: 67, protocol: "UDP"}
            client: {port: 68, protocol: "UDP"}
        }
        provides: {
            essential: ["IP address", "Subnet mask", "Default gateway", "DNS servers"]
            optional: ["NTP servers", "TFTP server", "Domain name", "WINS servers"]
        }
    }
}

# TCP/IP Model
export def "kb net tcpip" [] {
    [
        {
            tcpip_layer: "Application"
            osi_equivalent: "L7, L6, L5"
            protocols: "HTTP, FTP, DNS, SSH"
        }
        {
            tcpip_layer: "Transport"
            osi_equivalent: "L4"
            protocols: "TCP, UDP"
        }
        {
            tcpip_layer: "Internet"
            osi_equivalent: "L3"
            protocols: "IP, ICMP, ARP"
        }
        {
            tcpip_layer: "Network Access"
            osi_equivalent: "L2, L1"
            protocols: "Ethernet, WiFi"
        }
    ]
}

# Protocol: HTTP
export def "kb net protocol http" [] {
    {
        name: "HTTP/HTTPS"
        port: {http: 80, https: 443}
        layer: 7
        methods: [
            {method: "GET", purpose: "Retrieve resource"}
            {method: "POST", purpose: "Submit data"}
            {method: "PUT", purpose: "Update resource"}
            {method: "DELETE", purpose: "Remove resource"}
            {method: "HEAD", purpose: "Get headers only"}
            {method: "OPTIONS", purpose: "Get allowed methods"}
        ]
        status_codes: [
            {range: "1xx", type: "Informational"}
            {range: "2xx", type: "Success", examples: "200 OK, 201 Created"}
            {range: "3xx", type: "Redirection", examples: "301 Moved, 302 Found"}
            {range: "4xx", type: "Client Error", examples: "400 Bad Request, 404 Not Found"}
            {range: "5xx", type: "Server Error", examples: "500 Internal, 503 Unavailable"}
        ]
        common_headers: [
            "Host: example.com"
            "User-Agent: Mozilla/5.0"
            "Content-Type: application/json"
            "Authorization: Bearer <token>"
        ]
    }
}

# Protocol: DNS
export def "kb net protocol dns" [] {
    {
        name: "DNS (Domain Name System)"
        port: 53
        protocols: ["UDP", "TCP"]
        layer: 7
        record_types: [
            {type: "A", purpose: "IPv4 address"}
            {type: "AAAA", purpose: "IPv6 address"}
            {type: "CNAME", purpose: "Canonical name (alias)"}
            {type: "MX", purpose: "Mail exchange"}
            {type: "NS", purpose: "Name server"}
            {type: "TXT", purpose: "Text records"}
            {type: "SOA", purpose: "Start of authority"}
        ]
        resolution_process: [
            {step: 1, action: "Check local cache"}
            {step: 2, action: "Query recursive resolver (ISP DNS)"}
            {step: 3, action: "Query root DNS servers"}
            {step: 4, action: "Query TLD servers (.com, .org)"}
            {step: 5, action: "Query authoritative name server"}
            {step: 6, action: "Return IP address"}
        ]
        public_servers: [
            {provider: "Google", ips: ["8.8.8.8", "8.8.4.4"]}
            {provider: "Cloudflare", ips: ["1.1.1.1", "1.0.0.1"]}
            {provider: "Quad9", ips: ["9.9.9.9"]}
        ]
    }
}

#######################
# UTILITY FUNCTIONS
#######################

# Search across all networking knowledge
export def "kb net search" [query: string] {
    let commands = (help commands | where name =~ "kb net" | select name usage)
    $commands | where name =~ $query or usage =~ $query
}

# List all networking commands
export def "kb net list" [] {
    help commands | where name =~ "kb net" | select name usage | sort-by name
}

# Find a specific port
export def "kb net port" [port_number: int] {
    kb net ports | where port == $port_number
}

# Filter ports by service name
export def "kb net port find" [service: string] {
    kb net ports | where service =~ $service
}

# Show well-known ports only
export def "kb net ports well-known" [] {
    kb net ports | where port < 1024
}

# Show registered ports only
export def "kb net ports registered" [] {
    kb net ports | where port >= 1024 and port < 49152
}

# Calculate subnet info
export def "kb net subnet calc" [cidr: string] {
    let prefix = ($cidr | split row "/" | get 1 | into int)
    let hosts = (2 ** (32 - $prefix))
    let usable = $hosts - 2
    
    {
        cidr: $cidr
        prefix: $prefix
        total_hosts: $hosts
        usable_hosts: $usable
        network_bits: $prefix
        host_bits: (32 - $prefix)
    }
}

# Compare two OSI layers
export def "kb net osi compare" [layer1: int, layer2: int] {
    let layers = (kb net osi)
    let l1 = ($layers | where layer == $layer1 | first)
    let l2 = ($layers | where layer == $layer2 | first)
    
    [
        {aspect: "Layer", layer1: $l1.layer, layer2: $l2.layer}
        {aspect: "Name", layer1: $l1.name, layer2: $l2.name}
        {aspect: "Protocols", layer1: $l1.protocols, layer2: $l2.protocols}
        {aspect: "Data Unit", layer1: $l1.data_unit, layer2: $l2.data_unit}
    ]
}

# Export knowledge to JSON
export def "kb net export" [filepath: string] {
    {
        osi: (kb net osi)
        ports: (kb net ports)
        subnets: (kb net subnet)
        tcpip: (kb net tcpip)
    } | to json | save -f $filepath
    
    print $"Knowledge exported to ($filepath)"
}

# Quick reference card
export def "kb net cheat" [] {
    {
        common_commands: [
            {task: "Check IP", cmd: "ip addr show"}
            {task: "Check routes", cmd: "ip route show"}
            {task: "Test connectivity", cmd: "ping 8.8.8.8"}
            {task: "DNS lookup", cmd: "dig example.com"}
            {task: "Show ports", cmd: "ss -tuln"}
            {task: "Trace route", cmd: "traceroute example.com"}
        ]
        remember: [
            "OSI: Please Do Not Throw Sausage Pizza Away"
            "Layer 1: Physical (cables, bits)"
            "Layer 2: Data Link (MAC, switches)"
            "Layer 3: Network (IP, routing)"
            "Layer 4: Transport (TCP/UDP, ports)"
            "Layer 7: Application (HTTP, DNS)"
        ]
        quick_tests: [
            "ping 127.0.0.1 → Test TCP/IP stack"
            "ping gateway → Test local network"
            "ping 8.8.8.8 → Test internet"
            "ping google.com → Test DNS"
        ]
    }
}

# Interactive layer explorer
export def "kb net osi explore" [] {
    print "OSI Model Layers:"
    print ""
    kb net osi | each {|layer|
        print $"Layer ($layer.layer): ($layer.name)"
        print $"  Protocols: ($layer.protocols)"
        print $"  Data Unit: ($layer.data_unit)"
        print ""
    }
}

# Find related concepts
export def "kb net related" [concept: string] {
    match $concept {
        "vlan" => ["broadcast_domain", "switching", "osi l2"]
        "nat" => ["routing", "subnet", "osi l3"]
        "dhcp" => ["subnet", "dns", "osi l7"]
        "arp" => ["osi l2", "osi l3", "broadcast_domain"]
        "broadcast" => ["vlan", "switching", "collision"]
        _ => []
    }
}

# Main help
export def "kb net" [] {
    print "KB Networking - Beautiful tables for network concepts
    
Core Commands:
  kb net osi                    OSI model overview (all 7 layers)
  kb net osi l1                 Physical layer (detailed)
  kb net osi l2                 Data link layer (detailed)
  kb net osi l3                 Network layer (detailed)
  kb net osi l4                 Transport layer (detailed)
  kb net osi l7                 Application layer (detailed)
  
Concepts:
  kb net concept vlan           VLAN explained
  kb net concept nat            NAT explained
  kb net concept broadcast      Broadcast domains
  kb net concept dhcp           DHCP process
  
References:
  kb net ports                  Common port numbers
  kb net subnet                 Subnet mask reference
  kb net tcpip                  TCP/IP model
  
Protocols:
  kb net protocol http          HTTP/HTTPS details
  kb net protocol dns           DNS details
  
Troubleshooting:
  kb net fix connectivity       Step-by-step connectivity fix
  
Utilities (Nushell superpowers!):
  kb net search <query>         Search all commands
  kb net list                   List all commands
  kb net port <number>          Find port by number
  kb net port find <service>    Find port by service name
  kb net ports well-known       Ports < 1024
  kb net subnet calc <cidr>     Calculate subnet info
  kb net osi compare <l1> <l2>  Compare two layers
  kb net export <file>          Export to JSON
  kb net cheat                  Quick reference card
  kb net related <concept>      Find related topics
  
Pipeline Examples:
  kb net ports | where port > 1000
  kb net osi | where layer < 4
  kb net subnet | where usable > 100
  kb net ports | where service =~ 'HTTP'
  
Pro tip: All commands return structured data - pipe them!
"
}
