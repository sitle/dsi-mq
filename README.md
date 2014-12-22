# dsi-mq

Ce cookbook simplifie la mise en oeuvre d'une message queue en cluster.

## Supported Platforms

* Ubuntu
* Debian

## Attributes

* ```default['dsi-mq']['admin']```
* ```default['dsi-mq']['admin_password']```
* ```default['dsi-mq']['user']```
* ```default['dsi-mq']['user_password']```
* ```default['dsi-mq']['cluster']```
* ```default['dsi-mq']['nodes']```
* ```default['dsi-mq']['cookie']```
* ```default['dsi-mq']['vip']```
* ```default['dsi-mq']['bind']```
* ```default['dsi-mq']['keypass']```

## Usage

### dsi-mq::default

Inclure `dsi-mq` dans la `run_list`:

```json
{
  "run_list": [
    "recipe[dsi-mq::default]"
  ]
}
```

## License and Authors

Author:: Leonard TAVAE (<leonard.tavae@informatique.gov.pf>)
