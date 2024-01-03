# dw-monitor

## Installation

Run the install script:

```shell
./scripts/install.sh
```

## Optional extras

### Aliases

Add aliases for frequently used commands to `~/.bash_aliases`:

```shell
# Start cAdvisor, Prometheus, Grafana
alias amon="cd /path/to/dw-monitor && docker compose up -d"

# Stop cAdvisor, Prometheus, Grafana
alias smon="cd /path/to/dw-monitor && docker compose down"
```

Set `/path/to/` to the location of the repository on your machine.

## Uninstall

To delete all the data and Docker images, run:

```shell
./scripts/uninstall.sh
```

## Networking

The following ports are exposed:

| Service            | Port  | Protocol              |
|--------------------|-------|-----------------------|
| cadvisor           | 29040 | HTTP                  |
| prometheus         | 29050 | HTTP                  |
| grafana            | 29060 | HTTP                  |

The configuration is loaded from `./.env` during startup. The default values are in `./template_env/docker-compose.env`.

## License

Copyright (c) 2023 Hein Bekker. Licensed under the GNU Affero General Public License, version 3.
