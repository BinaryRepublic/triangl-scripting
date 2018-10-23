# Installation

```bash
scp -R triangl-package-updater root@<IP Address>:/
```

```bash
# On the router
mv /triangl-package-updater/keep_running /etc/init.d/
```

### Test the init.d-script


```bash
/etc/init.d/keep_running start
```

```bash
/ect/init.d/keep_running stop
```

Check using `ps` if all of the following processes were terminated correctly:
- `helloworld`
- `sh /triangl-package-updater/triangl_keep_running.sh`
- `airodump-ng --output-format csv --write test.csv --channel 6 --berlin 14 mon0`

