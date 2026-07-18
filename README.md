# 🔍 Reconnex - Automated Recon Tool

<div align="center">

![Reconnex Logo](https://img.shields.io/badge/Reconnex-Recon%20Automation-red?style=for-the-badge)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
![Status](https://img.shields.io/badge/Status-Active-brightgreen?style=flat-square)
![Version](https://img.shields.io/badge/Version-0.1-blue?style=flat-square)

**An advanced automated reconnaissance tool for bug bounty hunters and security researchers**

[Features](#-features) • [Installation](#-installation) • [Usage](#-usage) • [Workflow](#-workflow) • [Tools](#-integrated-tools) • [Contributing](#-contributing)

</div>

---

## 📋 Table of Contents

- [About](#-about)
- [Features](#-features)
- [Installation](#-installation)
- [Quick Start](#-quick-start)
- [Workflow Phases](#-workflow-phases)
- [Integrated Tools](#-integrated-tools)
- [Usage Guide](#-usage-guide)
- [Output Files](#-output-files)
- [Advanced Options](#-advanced-options)
- [Troubleshooting](#-troubleshooting)
- [Contributing](#-contributing)
- [License](#-license)

---

## 🎯 About

**Reconnex** is a comprehensive bash-based reconnaissance automation framework designed for bug bounty hunters and penetration testers. It streamlines the entire recon process by orchestrating multiple industry-leading tools into a single, efficient workflow.

### Why Reconnex?

- ⚡ **Automated** - Eliminates manual tool execution
- 🔄 **Comprehensive** - Covers all major recon phases
- 📊 **Organized** - Structured output for easy analysis
- 🛠️ **Flexible** - Integrate your own tools
- 🎨 **User-Friendly** - Colorized output and clear progress indicators

---

## ✨ Features

### Core Capabilities

| Feature | Description | Phase |
|---------|-------------|-------|
| 🔎 **Subdomain Enumeration** | Multi-source subdomain discovery | Phase 1 |
| 🌐 **Live Host Detection** | Identify responsive servers | Phase 2 |
| 📸 **Web Screenshots** | Automated visual reconnaissance | Phase 3 |
| 🏛️ **Archive Mining** | Historical URL discovery | Phase 4 |
| 🔓 **Vulnerability Scanning** | Automated security testing | Phase 5 |
| 🔑 **Parameter Discovery** | Hidden parameter enumeration | Phase 5 |
| 📝 **JavaScript Analysis** | Client-side code reconnaissance | Phase 5 |
| 📋 **Consolidated Reports** | Merged and deduplicated results | Throughout |

---

## 🚀 Installation

### Prerequisites

Ensure you have the following tools installed:

```bash
# Core tools
- subfinder
- findomain
- amass
- assetfinder
- dnsx
- httpx
- katana
- eyewitness
- gau
- waybackurls
- nuclei
- nmap
- nikto
- paramspider
- arjun
- subjs
```

### Installation Steps

#### Option 1: Automated Installation (Recommended)

```bash
git clone https://github.com/ChaudhariParthh/Reconnex.git
cd Reconnex
chmod +x Reconnex_CLI.sh

# Run with sudo for tool installation
sudo ./Reconnex_CLI.sh example.com
```

#### Option 2: Manual Setup

```bash
# Clone the repository
git clone https://github.com/ChaudhariParthh/Reconnex.git
cd Reconnex

# Make script executable
chmod +x Reconnex_CLI.sh

# Ensure all dependencies are installed
# (Install tools based on your OS and package manager)
```

---

## 🎬 Quick Start

### Basic Usage

```bash
./Reconnex_CLI.sh example.com
```

### What Happens

1. ✅ Script validates input
2. ✅ Subdomain enumeration begins
3. ✅ Live hosts are probed
4. ✅ Screenshots are captured
5. ✅ Archives are searched
6. ✅ Vulnerabilities are scanned
7. ✅ Results are consolidated

---

## 🔄 Workflow Phases

```
┌─────────────────────────────────────────────────────────────────┐
│                     RECONNEX WORKFLOW                            │
├─────────────────────────────────────────────────────────────────┤
│                                                                   │
│  [1/5] SUBDOMAIN ENUMERATION                                    │
│  ├─ Subfinder → subfinder.txt                                   │
│  ├─ Findomain → findomain.txt                                   │
│  ├─ Amass → amass.txt                                           │
│  ├─ Assetfinder → assetfinder.txt                               │
│  ├─ DNSX → dnsx.txt                                             │
│  └─ Consolidated → all_subdomains.txt                           │
│                                                                   │
│  ↓                                                                │
│                                                                   │
│  [2/5] LIVE HOST ENUMERATION                                    │
│  ├─ HTTPX Probing → live_subdomains.txt                         │
│  └─ Katana Crawling → live_endpoints.txt                        │
│                                                                   │
│  ↓                                                                │
│                                                                   │
│  [3/5] VISUAL RECONNAISSANCE                                    │
│  └─ EyeWitness Screenshots → screenshots/                       │
│                                                                   │
│  ↓                                                                │
│                                                                   │
│  [4/5] ARCHIVE MINING                                           │
│  ├─ GAU → gau.txt                                               │
│  ├─ Wayback URLs → wayback.txt                                  │
│  └─ Consolidated → all_urls.txt                                 │
│                                                                   │
│  ↓                                                                │
│                                                                   │
│  [5/5] SECURITY SCANNING                                        │
│  ├─ Nuclei (Templates) → nuclei.txt                             │
│  ├─ Nmap (Services/Versions) → nmap.txt                         │
│  ├─ Nikto (Web Server) → nikto.txt                              │
│  ├─ ParamSpider → param.txt                                     │
│  ├─ Arjun (Parameters) → arjun_params.txt                       │
│  └─ Subjs (JavaScript) → (pending)                              │
│                                                                   │
└─────────────────────────────────────────────────────────────────┘
```

### Phase Details

<details>
<summary><strong>Phase 1️⃣: Subdomain Enumeration</strong></summary>

Discovers all subdomains of the target domain using multiple sources:

- **Subfinder**: Fast, recursive subdomain discovery
- **Findomain**: Passive subdomain enumeration
- **Amass**: Comprehensive passive source aggregation
- **Assetfinder**: Asset discovery engine
- **DNSX**: DNS resolution and validation

**Output**: `all_subdomains.txt` - Complete deduplicated list

</details>

<details>
<summary><strong>Phase 2️⃣: Live Host Detection</strong></summary>

Identifies which discovered subdomains are actively responding:

- **HTTPX**: Rapid HTTP/HTTPS probe
- **Katana**: Web crawler for endpoint discovery

**Output**: `live_endpoints.txt` - All responsive hosts and endpoints

</details>

<details>
<summary><strong>Phase 3️⃣: Visual Reconnaissance</strong></summary>

Captures screenshots of discovered web applications:

- **EyeWitness**: Automated visual recon with thumbnail gallery

**Output**: `screenshots/` - Directory with visual artifacts

</details>

<details>
<summary><strong>Phase 4️⃣: Archive Mining</strong></summary>

Discovers historical URLs and endpoints:

- **GAU**: Greatest URLs discovery from multiple archives
- **Wayback Machine**: Historical endpoint discovery

**Output**: `all_urls.txt` - Comprehensive URL database

</details>

<details>
<summary><strong>Phase 5️⃣: Security Scanning</strong></summary>

Multi-vector vulnerability assessment:

- **Nuclei**: Template-based vulnerability scanning
- **Nmap**: Service and version enumeration
- **Nikto**: Web server vulnerability scanning
- **ParamSpider**: Parameter discovery
- **Arjun**: Hidden parameter detection
- **Subjs**: JavaScript reconnaissance

**Outputs**: Multiple scan results in dedicated files

</details>

---

## 🛠️ Integrated Tools

| Tool | Purpose | Phase |
|------|---------|-------|
| **Subfinder** | Subdomain enumeration | 1 |
| **Findomain** | Passive subdomain discovery | 1 |
| **Amass** | Advanced source aggregation | 1 |
| **Assetfinder** | Asset discovery | 1 |
| **DNSX** | DNS resolution validation | 1 |
| **HTTPX** | HTTP probing | 2 |
| **Katana** | Web crawling & endpoint discovery | 2 |
| **EyeWitness** | Web screenshots | 3 |
| **GAU** | URL history gathering | 4 |
| **Wayback URLs** | Archive endpoint mining | 4 |
| **Nuclei** | Automated vulnerability scanning | 5 |
| **Nmap** | Port & service scanning | 5 |
| **Nikto** | Web server assessment | 5 |
| **ParamSpider** | Parameter discovery | 5 |
| **Arjun** | Hidden parameter detection | 5 |
| **Subjs** | JavaScript analysis | 5 |

---

## 📖 Usage Guide

### Basic Execution

```bash
# Start reconnaissance on a target domain
./Reconnex_CLI.sh example.com

# The script will:
# 1. Validate the target format
# 2. Create working directory in current location
# 3. Execute all 5 phases sequentially
# 4. Generate reports and consolidate results
```

### Analyzing Results

#### Subdomain Analysis

```bash
# View total unique subdomains discovered
wc -l all_subdomains.txt

# Find specific subdomain patterns
grep -i "api" all_subdomains.txt
grep -i "admin" all_subdomains.txt
grep -i "staging" all_subdomains.txt
```

#### Live Hosts Analysis

```bash
# Count responsive hosts
wc -l live_endpoints.txt

# Filter for specific patterns
grep -i "staging" live_endpoints.txt
```

#### Vulnerability Review

```bash
# Check nuclei findings
cat nuclei.txt | sort -u

# Review web server vulnerabilities
cat nikto.txt

# Analyze port/service information
cat nmap.txt
```

---

## 📁 Output Files

| Filename | Content | Size | Importance |
|----------|---------|------|------------|
| `all_subdomains.txt` | All discovered, deduplicated subdomains | Large | ⭐⭐⭐⭐⭐ |
| `live_endpoints.txt` | Active hosts and crawled endpoints | Large | ⭐⭐⭐⭐⭐ |
| `all_urls.txt` | Historical and discovered URLs | Very Large | ⭐⭐⭐⭐ |
| `nuclei.txt` | Template-based vulnerability findings | Medium | ⭐⭐⭐⭐⭐ |
| `nmap.txt` | Port and service enumeration | Medium | ⭐⭐⭐⭐ |
| `nikto.txt` | Web server vulnerabilities | Small | ⭐⭐⭐ |
| `param.txt` | Parameters from ParamSpider | Large | ⭐⭐⭐ |
| `arjun_params.txt` | Hidden parameters discovered | Medium | ⭐⭐⭐ |
| `screenshots/` | Web application screenshots | Large | ⭐⭐⭐ |
| `subfinder.txt` | Subfinder results (before dedup) | Medium | ⭐⭐ |
| `findomain.txt` | Findomain results (before dedup) | Medium | ⭐⭐ |
| `amass.txt` | Amass results (before dedup) | Large | ⭐⭐ |
| `gau.txt` | GAU archive URLs | Very Large | ⭐⭐ |
| `wayback.txt` | Wayback Machine URLs | Very Large | ⭐⭐ |

---

## 🔧 Advanced Options

### Customization

Edit `Reconnex_CLI.sh` to modify:

```bash
# Tool directory
TOOL_DIR="/usr/bin"

# Number of threads (for multi-threaded tools)
THREADS=5

# EyeWitness thread count
EYEWITNESS_THREADS=10

# Timeout values for scans
TIMEOUT=10
```

### Excluding Phases

Comment out specific phases to skip them:

```bash
# Example: Skip Phase 3 (Screenshots)
# echo -e "${YELLOW}...${NC}"
# eyewitness --web -f live_subdomains.txt ...
```

---

## ⚠️ Troubleshooting

### Common Issues

<details>
<summary><strong>❌ "Command not found" errors</strong></summary>

**Solution**: Ensure all tools are installed and in `$PATH`:

```bash
# Check if tool is installed
which subfinder

# If not found, install via package manager or download binary
# Example (Linux):
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
```

</details>

<details>
<summary><strong>❌ Permission denied</strong></summary>

**Solution**: Make the script executable:

```bash
chmod +x Reconnex_CLI.sh
```

</details>

<details>
<summary><strong>❌ No results from tools</strong></summary>

**Solution**: Verify target domain and network connectivity:

```bash
# Check if domain is valid
nslookup example.com

# Verify tools are working individually
subfinder -d example.com -silent
```

</details>

<details>
<summary><strong>❌ Out of memory errors</strong></summary>

**Solution**: Reduce thread counts or run phases individually:

```bash
# Modify thread count in script
THREADS=2  # Reduce from default
```

</details>

<details>
<summary><strong>❌ Timeout errors from remote sources</strong></summary>

**Solution**: Increase timeout values or retry:

```bash
# Most tools support retry flags
# Check individual tool documentation
```

</details>

---

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

### How to Contribute

1. **Fork** the repository
2. **Create** a feature branch (`git checkout -b feature/amazing-feature`)
3. **Commit** your changes (`git commit -m 'Add amazing feature'`)
4. **Push** to the branch (`git push origin feature/amazing-feature`)
5. **Open** a Pull Request

### Areas for Contribution

- 🐛 Bug fixes and improvements
- 🛠️ New tool integrations
- 📚 Documentation enhancements
- 🎨 UI/UX improvements
- 🔧 Performance optimizations
- 🧪 Testing and validation

---

## 📝 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

```
MIT License

Copyright (c) 2025 CyberParth

Permission is hereby granted, free of charge, to any person obtaining a copy...
```

---

## 👤 Author

**CyberParth** (ChaudhariParthh)

- 🔗 GitHub: [@ChaudhariParthh](https://github.com/ChaudhariParthh)
- 📧 Contact: Available via GitHub

---

## 🙏 Acknowledgments

Special thanks to the developers of:
- Project Discovery tools (Subfinder, Nuclei, etc.)
- OWASP community
- Bug bounty hunters worldwide

---

## 📞 Support & Questions

- 💬 Open an [Issue](https://github.com/ChaudhariParthh/Reconnex/issues)
- 🔍 Check existing [Issues](https://github.com/ChaudhariParthh/Reconnex/issues?q=is%3Aissue)
- 📖 Review [Documentation](README.md)

---

## 🗓️ Changelog

### v0.1 (Current)
- ✅ Core recon workflow implemented
- ✅ Multi-source subdomain enumeration
- ✅ Live host detection
- ✅ Visual reconnaissance
- ✅ Archive mining
- ✅ Vulnerability scanning

### Planned Features
- 🔜 Configuration file support
- 🔜 Scheduled recon runs
- 🔜 Result comparison & delta reporting
- 🔜 Web dashboard
- 🔜 API integration

---

<div align="center">

### ⭐ If you find this tool useful, please consider giving it a star!

**Made with ❤️ by CyberParth**

[⬆ Back to Top](#-reconnex---automated-recon-tool)

</div>
