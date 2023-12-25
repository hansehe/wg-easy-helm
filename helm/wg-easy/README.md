# WireGuard Easy

## Introduction

The WireGuard Easy deploys a vpn solution, check out:
- https://github.com/wg-easy/wg-easy

## Installing the Chart

To install the chart with the release name `wg-easy` run:

```bash
$ helm repo add wg-easy https://raw.githubusercontent.com/hansehe/wg-easy-helm/master/helm/charts
$ helm install wg-easy wg-easy/wg-easy
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install wg-easy -f values.yaml wg-easy/wg-easy
```

## Configuration

Find all possible configuration values here:
- https://github.com/hansehe/wg-easy-helm/blob/master/helm/wg-easy/values.yaml
