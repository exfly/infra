# dashboard 都要添加此内容

## dashboard

postgres: https://grafana.com/grafana/dashboards/9628

## bugs

```
# https://github.com/grafana/grafana/issues/10786#issuecomment-734447429

Workaround
Under this lines

"templating": {
      "list": [
insert this:

{
        "hide": 0,
        "label": "datasource",
        "name": "DS_PROMETHEUS",
        "options": [],
        "query": "prometheus",
        "refresh": 1,
        "regex": "",
        "type": "datasource"
},

```
