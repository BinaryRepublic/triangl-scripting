# Installation

### 1. Move shell script

```bash
sudo mv rip_updater.sh /usr/local/bin
```

### 2. Move init script

```bash
sudo mv rip_updater_init /etc/init.d/rip_updater
```

### 3. Create Log

```bash
sudo mkdir /usr/local/share/router_ip_updater_log
sudo echo -e 'IP79=\nIPD4=\nIPE6=\nIP6E=\nRASPPI=' > /usr/local/share/router_ip_updater_log/.router_update_log
```

### 4. Enable Autostart

```bash
sudo update-rc.d rip_updater enable
```

**IN case the service isn't automatically started on boot try:**

```bash
sudo update-rc.d rip_updater defaults
```

# TODO

- Fix the stop method in init script
