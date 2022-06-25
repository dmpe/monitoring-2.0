# OpenSearch RPM based installation for Production purposes (Examples)

<https://opensearch.org/docs/latest/opensearch/cluster/>

<https://opensearch.org/docs/latest/opensearch/install/important-settings/>

<https://www.instaclustr.com/blog/understanding-and-configuring-elasticsearch-node-types/>

<https://www.elastic.co/guide/en/elasticsearch/guide/current/hardware.html#_memory>


Masters @ 3 Bare Metal:
- 8 GB RAM each
- 4 CPUs
- a bit of disk

Data Nodes @ 2 Bare Metals:

- 64 GB Ram each
- 4 or 8 CPU (cores better than GHz)
- >=500 GB local ssd disk


## Use

<https://opensearch.org/docs/latest/opensearch/install/rpm/>

```
sudo cp -R etc/yum.repos.d/*.repo /etc/yum.repos.d/
sudo cp etc/opensearch/opensearch_cluster_mng1.yml /etc/opensearch/opensearch.yml
sudo yum install opensearch

cd /var/lib/opensearch
sudo rm -rf ./nodes

./bin/generate-certs.sh
sudo cp -R ./*.pem /etc/opensearch/
sudo chmod 600 /etc/opensearch/*.pem

# not needed
./securityadmin.sh -cd ../securityconfig/ -icl -nhnv \
   -cacert /etc/opensearch/root-ca.pem \
   -cert /etc/opensearch/node1.pem \
   -key /etc/opensearch/node1-key.pem


curl -XGET https://localhost:9200 -u 'admin:admin' --insecure
curl -XGET https://localhost:9200/_cat/config?v -u 'admin:admin' --insecure


sudo systemctl start opensearch.service
sudo systemctl stop opensearch.service
sudo systemctl start opensearch-performance-analyzer.service
sudo systemctl stop opensearch-performance-analyzer.service
```

# OpenSearch-Dashboard

Assumes Nginx, etc. proxy that Loadbalances OpenSearch Instance. Hence, disables TLS

1 VM or 1 HW:

- 4 CPU, 8 RAM, 20 GB Disk?

Aka very little

## Use


```
sudo yum install opensearch-dashboards
sudo systemctl start opensearch-dashboards.service
sudo systemctl stop opensearch-dashboards.service

sudo cp etc/opensearch-dashboards/opensearch_dashboards.yml /etc/opensearch-dashboards/opensearch_dashboards.yml
```