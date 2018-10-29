# Installation

```bash
scp -r triangl-package-updater root@<IP Address>:/
```

### Configuration

```bash
mv /triangl-package-updater/keep_running /etc/init.d/
sh /triangl-package-updater/triangl_packet_updater.sh
cat /etc/config/network | grep 'macaddr' | grep -o '.\{2\}:.\{2\}:.\{2\}:.\{2\}:.\{2\}:.\{2\}' | tr [a-z] [A-Z] >\
/triangl-package-updater/my_mac
```

### Test the init.d-script


```bash
/etc/init.d/keep_running start
```

```bash
/ect/init.d/keep_running stop
```

Check using `ps` if all of the following processes were terminated correctly:
- `rssi-rssi-polling`
- `sh /triangl-package-updater/triangl_keep_running.sh`
- `airodump-ng --output-format csv --write test.csv --channel 6 --berlin 14 mon0`

#### Enable the init.d-script

:heavy_exclamation_mark: If the init.d-script fails the router will be locked in a boot loop. :heavy_exclamation_mark:
Please test the init.d-scrip before enabling it.

```bash
/etc/init.d/keep_running enable
```
