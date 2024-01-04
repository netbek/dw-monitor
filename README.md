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

Set `/path/to/` to the location of the repository on your machine. If you prefer to run the containers in the foreground, then omit the `-d` option.

## Uninstall

To delete all the data and Docker images, run:

```shell
./scripts/uninstall.sh
```

## Usage

Start the cAdvisor, Prometheus and Grafana containers in detached mode:

```shell
docker compose up -d
```

If you prefer to run the containers in the foreground, then omit the `-d` option.

## Dashboards

The following Docker containers provide dashboards. The `open.sh` script only opens a URL or application, so remember to start the relevant container(s) beforehand.

| Service            | Command                            |
|--------------------|------------------------------------|
| `cadvisor`         | `./scripts/open.sh cadvisor`       |
| `grafana`          | `./scripts/open.sh grafana`        |
| `prometheus`       | `./scripts/open.sh prometheus`     |

## Networking

The following ports are exposed:

| Service            | Port  | Protocol              |
|--------------------|-------|-----------------------|
| cadvisor           | 29040 | HTTP                  |
| prometheus         | 29050 | HTTP                  |
| grafana            | 29060 | HTTP                  |

The configuration is loaded from `./.env` during startup.

## Resources

- [cAdvisor docs](https://github.com/google/cadvisor/blob/master/README.md)
- [Grafana docs](https://grafana.com/docs/grafana/latest/)
- [Prometheus docs](https://prometheus.io/docs/introduction/overview/)

## License

Copyright (c) 2023 Hein Bekker. Licensed under the GNU Affero General Public License, version 3.
