# Amazon Linux 2023 Setup Script

A Bash script to provision an Amazon Linux 2023 with various options.

## How to Use

### Download and Run the Script

```bash
# Give execute permission
chmod +x setup.sh

# Run with sudo
sudo ./setup.sh [OPTIONS]
```

### Available Options

| Option        | Description                                                      |
| ------------- | ---------------------------------------------------------------- |
| `--timezone`  | Set timezone to Asia/Jakarta                                     |
| `--update`    | Update installed packages and package cache                      |
| `--dev-tools` | Install Git, Curl, ZIP, Python3, Python3-pip                     |
| `--docker`    | Install Docker                                                   |
| `--all`       | Run all options                                                  |
| `--help`      | Show usage help                                                  |
