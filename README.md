# 🖥️ NFS File Sharing Setup

## 📌 Project Overview

This project demonstrates how to configure a Network File System (NFS) Server and Client on Linux. NFS enables multiple Linux systems to share files and directories over a network, allowing centralized storage and seamless file access.

---

# 🎯 Objectives

- Configure an NFS Server
- Configure an NFS Client
- Share directories across Linux systems
- Mount remote file systems
- Verify file sharing
- Understand centralized storage in Linux

---

# 🛠️ Technologies Used

- Ubuntu Linux
- NFS Server
- NFS Client
- Linux File System
- Bash
- Linux Networking

---

# 📂 Project Structure

```text
nfs-file-sharing-setup/
│
├── client/
│   └── mount-command.txt
│
├── server/
│   ├── exports.conf
│   └── shared-file.txt
│
├── lab_file/
│   └── shared-file.txt
│
├── commands.sh
├── README.md
│
└── screenshots/
    ├── 1-project-structure.png
    ├── 2-server-config-created.png
    ├── 3-shared-directory-created.png
    ├── 4-exports-configured.png
    ├── 5-nfs-service-running.png
    ├── 6-client-mounted-share.png
    ├── 7-file-access-verified.png
    ├── 8-showmount-output.png
    └── 9-final-project-status.png
```

---

# ⚙️ How the Project Works

The NFS server exports a shared directory to the network.

The client mounts that shared directory to a local mount point.

Although the client accesses the files locally, the files remain physically stored on the server.

```
Server (/shared)
        │
        ▼
 NFS Network Share
        │
        ▼
Client (/mnt/nfs-share)
```

---

# 🚀 Installation

Update packages

```bash
sudo apt update
```

Install NFS packages

```bash
sudo apt install -y nfs-kernel-server nfs-common
```

Create shared directory

```bash
sudo mkdir -p /shared
```

Copy sample file

```bash
sudo cp lab_file/shared-file.txt /shared/
```

Configure exports

```bash
sudo cp server/exports.conf /etc/exports
```

Reload configuration

```bash
sudo exportfs -ra
```

Restart service

```bash
sudo systemctl restart nfs-kernel-server
```

Create mount point

```bash
sudo mkdir -p /mnt/nfs-share
```

Mount NFS share

```bash
sudo mount -t nfs localhost:/shared /mnt/nfs-share
```

Verify

```bash
ls -l /mnt/nfs-share
```

Unmount

```bash
sudo umount /mnt/nfs-share
```

---

# 📸 Screenshots

### 1 Project Structure

```
tree
```

### 2 Server Configuration

```
cat server/exports.conf
```

### 3 Shared Directory

```
ls -l /shared
```

### 4 Exports Applied

```
cat /etc/exports
```

### 5 NFS Service Running

```
sudo systemctl status nfs-kernel-server
```

### 6 Client Mounted Share

```
mount | grep nfs
```

### 7 File Access Verified

```
cat /mnt/nfs-share/shared-file.txt
```

### 8 Export Verification

```
showmount -e localhost
```

### 9 Final Project Status

```
mount | grep nfs

showmount -e localhost

ls -l /mnt/nfs-share
```

---

# 💡 What I Learned

- How NFS provides centralized file sharing.
- Difference between server storage and client mount points.
- How Linux exports shared directories.
- How clients mount remote file systems.
- Basic Linux storage administration.
- Enterprise-style shared storage concepts.

---

# 🌍 Real-World Applications

- Enterprise file servers
- Shared project directories
- Centralized backup storage
- Virtual machine storage
- Shared development environments
- Linux infrastructure management

---

# ✅ Conclusion

This project provided practical experience in configuring an NFS Server and Client for centralized file sharing. It strengthened my understanding of Linux storage administration, remote file system mounting, and enterprise-style network file sharing.
