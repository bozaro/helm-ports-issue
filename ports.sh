#!/bin/bash
set -e

run_test () {
	TEST=$1
	
	# Install chart
	helm upgrade --install ports ports --wait --values "${TEST}"

	echo "## Test: $TEST"
	echo "### VALUES"
	echo '```'
	cat "${TEST}"
	echo '```'
	echo "### EXPECTED"
	echo '```'
	helm template ports --values "${TEST}" | yq '.spec.template.spec.containers[].ports'
	echo '```'
	echo "### ACTUAL"
	echo '```'
	kubectl get pods --selector=app=ports -o json | jq '.items|map(select(.metadata|has("deletionTimestamp")|not))[].spec.containers[].ports'
	echo '```'
	echo
}

# Ensure chart is not installed
helm list -q | grep -x ports && helm uninstall ports

run_test  00_values_3_ports.yaml
run_test  10_values_2_ports.yaml
