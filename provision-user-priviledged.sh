#!/bin/sh

curl https://shipyard.demo.gs/install.sh | bash

echo export KUBECONFIG="$HOME/.shipyard/yards/shipyard/kubeconfig.yml" >> "$HOME"/.bashrc
