# Elastic Curator

Project's repository: https://github.com/elastic/curator.git

## Running

### Usage

```console
$ docker run --rm 4ops/es-curator

Usage: curator [OPTIONS] ACTION_FILE

  Curator for Elasticsearch indices.

  See http://elastic.co/guide/en/elasticsearch/client/curator/current

Options:
  --config PATH  Path to configuration file. Default: ~/.curator/curator.yml
  --dry-run      Do not perform any changes.
  --version      Show the version and exit.
  --help         Show this message and exit.
```

### Action example

```console
$ docker run -v="$PWD/examples:/config:ro" --rm 4ops/es-curator --config /config/curator.yaml /config/delete-indices.yaml

2019-11-20 08:24:24,701 INFO      Action ID: 1: "delete_indices" not performed because "disable_action" is set to True
2019-11-20 08:24:24,701 INFO      Job completed.
```

## Configuraton

See [examples](/examples/) directory or in official [repo](https://github.com/elastic/curator/tree/master/examples)
