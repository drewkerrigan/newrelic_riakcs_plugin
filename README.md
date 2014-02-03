#New Relic Riak CS Agent


A New Relic Riak CS Agent.


##Summary of Metrics

For more information on the meaning of these metrics, please visit [docs.basho.com](http://docs.basho.com/riakcs/latest/cookbooks/Monitoring-and-Metrics/).

| Riak CS Key | Riak CS Stat | New Relic Stat | Unit of Measure |
| ----------- | ------------ | -------------- | --------------- |
| block_get | meter_count | Block/Get/Total | Operations |
| block_get | meter_rate | Block/Get/Rate | Operations/Seconds |
| block_get | latency_mean |Block/Get/Latency/Mean | Microseconds |
| block_get | latency_median | Block/Get/Latency/Median | Microseconds |
| block_get | latency_95 | Block/Get/Latency/95 | Microseconds |
| block_get | latency_99 | Block/Get/Latency/99 | Microseconds |
| block_put | meter_count | Block/Put/Total | Operations |
| block_put | meter_rate | Block/Put/Rate | Operations/Seconds |
| block_put | latency_mean | Block/Put/Latency/Mean | Microseconds |
| block_put | latency_median | Block/Put/Latency/Median | Microseconds |
| block_put | latency_95 | Block/Put/Latency/95 | Microseconds |
| block_put | latency_99 | Block/Put/Latency/99 | Microseconds |
| block_delete | meter_count | Block/Delete/Total | Operations |
| block_delete | meter_rate | Block/Delete/Rate | Operations/Seconds |
| block_delete | latency_mean | Block/Delete/Latency/Mean | Microseconds |
| block_delete | latency_median | Block/Delete/Latency/Median | Microseconds |
| block_delete | latency_95 | Block/Delete/Latency/95 | Microseconds |
| block_delete | latency_99 | Block/Delete/Latency/99 | Microseconds |
| service_get_buckets | meter_count | Service/GetBuckets/Total | Operations |
| service_get_buckets | meter_rate | Service/GetBuckets/Rate | Operations/Seconds |
| service_get_buckets | latency_mean | Service/GetBuckets/Latency/Mean | Microseconds |
| service_get_buckets | latency_median | Service/GetBuckets/Latency/Median | Microseconds |
| service_get_buckets | latency_95 | Service/GetBuckets/Latency/95 | Microseconds |
| service_get_buckets | latency_99 | Service/GetBuckets/Latency/99 | Microseconds |
| bucket_list_keys | meter_count | Bucket/ListKeys/Total | Operations |
| bucket_list_keys | meter_rate | Bucket/ListKeys/Rate | Operations/Seconds |
| bucket_list_keys | latency_mean | Bucket/ListKeys/Latency/Mean | Microseconds |
| bucket_list_keys | latency_median | Bucket/ListKeys/Latency/Median | Microseconds |
| bucket_list_keys | latency_95 | Bucket/ListKeys/Latency/95 | Microseconds |
| bucket_list_keys | latency_99 | Bucket/ListKeys/Latency/99 | Microseconds |
| bucket_create | meter_count | Bucket/Create/Total | Operations |
| bucket_create | meter_rate | Bucket/Create/Rate | Operations/Seconds |
| bucket_create | latency_mean | Bucket/Create/Latency/Mean | Microseconds |
| bucket_create | latency_median | Bucket/Create/Latency/Median | Microseconds |
| bucket_create | latency_95 | Bucket/Create/Latency/95 | Microseconds |
| bucket_create | latency_99 | Bucket/Create/Latency/99 | Microseconds |
| bucket_delete | meter_count | Bucket/Delete/Total | Operations |
| bucket_delete | meter_rate | Bucket/Delete/Rate | Operations/Seconds |
| bucket_delete | latency_mean | Bucket/Delete/Latency/Mean | Microseconds |
| bucket_delete | latency_median |Bucket/Delete/Latency/Median | Microseconds |
| bucket_delete | latency_95 | Bucket/Delete/Latency/95 | Microseconds |
| bucket_delete | latency_99 | Bucket/Delete/Latency/99 | Microseconds |
| bucket_get_acl | meter_count | Bucket/GetAcl/Total | Operations |
| bucket_get_acl | meter_rate | Bucket/GetAcl/Rate | Operations/Seconds |
| bucket_get_acl | latency_mean | Bucket/GetAcl/Latency/Mean | Microseconds |
| bucket_get_acl | latency_median | Bucket/GetAcl/Latency/Median | Microseconds |
| bucket_get_acl | latency_95 | Bucket/GetAcl/Latency/95 | Microseconds |
| bucket_get_acl | latency_99 | Bucket/GetAcl/Latency/99 | Microseconds |
| bucket_put_acl | meter_count | Bucket/PutAcl/Total | Operations |
| bucket_put_acl | meter_rate | Bucket/PutAcl/Rate | Operations/Seconds |
| bucket_put_acl | latency_mean | Bucket/PutAcl/Latency/Mean | Microseconds |
| bucket_put_acl | latency_median | Bucket/PutAcl/Latency/Median | Microseconds |
| bucket_put_acl | latency_95 | Bucket/PutAcl/Latency/95 | Microseconds |
| bucket_put_acl | latency_99 | Bucket/PutAcl/Latency/99 | Microseconds |
| object_get | meter_count | Object/Get/Total | Operations |
| object_get | meter_rate | Object/Get/Rate | Operations/Seconds |
| object_get | latency_mean | Object/Get/Latency/Mean | Microseconds |
| object_get | latency_median | Object/Get/Latency/Median | Microseconds |
| object_get | latency_95 | Object/Get/Latency/95 | Microseconds |
| object_get | latency_99 | Object/Get/Latency/99 | Microseconds |
| object_put | meter_count | Object/Put/Total | Operations |
| object_put | meter_rate | Object/Put/Rate | Operations/Seconds |
| object_put | latency_mean | Object/Put/Latency/Mean | Microseconds |
| object_put | latency_median | Object/Put/Latency/Median | Microseconds |
| object_put | latency_95 | Object/Put/Latency/95 | Microseconds |
| object_put | latency_99 | Object/Put/Latency/99 | Microseconds |
| object_head | meter_count | Object/Head/Total | Operations |
| object_head | meter_rate | Object/Head/Rate | Operations/Seconds |
| object_head | latency_mean | Object/Head/Latency/Mean | Microseconds |
| object_head | latency_median | Object/Head/Latency/Median | Microseconds |
| object_head | latency_95 | Object/Head/Latency/95 | Microseconds |
| object_head | latency_99 | Object/Head/Latency/99 | Microseconds |
| object_delete | meter_count | Object/Delete/Total | Operations |
| object_delete | meter_rate | Object/Delete/Rate | Operations/Seconds |
| object_delete | latency_mean | Object/Delete/Latency/Mean | Microseconds |
| object_delete | latency_median | Object/Delete/Latency/Median | Microseconds |
| object_delete | latency_95 | Object/Delete/Latency/95 | Microseconds |
| object_delete | latency_99 | Object/Delete/Latency/99 | Microseconds |
| object_get_acl | meter_count | Object/GetAcl/Total | Operations |
| object_get_acl | meter_rate | Object/GetAcl/Rate | Operations/Seconds |
| object_get_acl | latency_mean | Object/GetAcl/Latency/Mean | Microseconds |
| object_get_acl | latency_median | Object/GetAcl/Latency/Median | Microseconds |
| object_get_acl | latency_95 | Object/GetAcl/Latency/95 | Microseconds |
| object_get_acl | latency_99 | Object/GetAcl/Latency/99 | Microseconds |
| object_put_acl | meter_count | Object/PutAcl/Total | Operations |
| object_put_acl | meter_rate | Object/PutAcl/Rate | Operations/Seconds |
| object_put_acl | latency_mean | Object/PutAcl/Latency/Mean | Microseconds |
| object_put_acl | latency_median | Object/PutAcl/Latency/Median | Microseconds |
| object_put_acl | latency_95 | Object/PutAcl/Latency/95 | Microseconds |
| object_put_acl | latency_99 | Object/PutAcl/Latency/99 | Microseconds |