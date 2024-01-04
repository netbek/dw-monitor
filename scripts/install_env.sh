#!/bin/bash
set -e

scripts_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
root_dir="${scripts_dir}/.."

source "${scripts_dir}/variables.sh"
source "${scripts_dir}/functions.sh"

function echo_help() {
    echo "Usage: $0 [-f|--force]"
}

cd "${root_dir}"

template_env_dir="./template_env"
env_dir="./.env_files"

mkdir -p "${env_dir}"

force=false
quiet=false

while [[ $# -gt 0 ]]; do
    case "$1" in
        -f|--force)
            force=true
            shift
            ;;
        --quiet)
            quiet=true
            shift
            ;;
        --help)
            echo_help
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            echo_help
            exit 1
            ;;
    esac
done

# Render .env files
templates=(
    env.jinja2                                ./.env
    env_files/cadvisor.env.jinja2             ${env_dir}/cadvisor.env
    env_files/grafana.env.jinja2              ${env_dir}/grafana.env
    env_files/prometheus.env.jinja2           ${env_dir}/prometheus.env
)
context=()

for ((i = 1; i < ${#templates[@]}; i+=2)); do
    template_file="${templates[i-1]}"
    output_file="${templates[i]}"

    if [ -f "${output_file}" ] && [ "$force" == false ]; then
        if [ "$quiet" == false ]; then
            echo "Skipped ${template_file} because ${output_file} exists"
        fi
    else
        render_template "${template_env_dir}" "${template_file}" "${context[@]}" > "${output_file}"

        if [ -f "${output_file}" ]; then
            if [ "$quiet" == false ]; then
                echo "${tput_green}Created ${output_file}${tput_reset}"
            fi
        fi
    fi
done
