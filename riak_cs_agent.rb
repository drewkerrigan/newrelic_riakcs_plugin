#!/usr/bin/env ruby
require 'rubygems'
require 'bundler/setup'
require 'newrelic_plugin'
require 'json'
require 'base64'
require 'hmac-sha1'
require 'rest-client'

module RiakCSAgent

  class Metric

    attr_accessor :key, :name, :unit, :arr_index, :processor

    def initialize(key, name, unit, arr_index)
      @processor = NewRelic::Processor::EpochCounter.new
      @key = key
      @name = name
      @unit = unit
      @arr_index = arr_index
    end

  end

  class Agent < NewRelic::Plugin::Agent::Base
    agent_guid 'com.basho.riak_cs_agent'
    agent_version '0.1.0'
    agent_config_options :host, :port, :access_id, :secret_key
    agent_human_labels('RiakCS') { "#{host}:#{port}" }

    def setup_metrics

      @metrics = [
          Metric.new('block_get', 'Block/Get/Total', 'Operations', 0),
          Metric.new('block_get', 'Block/Get/Rate', 'Operations/Seconds', 1),
          Metric.new('block_get', 'Block/Get/Latency/Mean', 'Microseconds', 2),
          Metric.new('block_get', 'Block/Get/Latency/Median', 'Microseconds', 3),
          Metric.new('block_get', 'Block/Get/Latency/95', 'Microseconds', 4),
          Metric.new('block_get', 'Block/Get/Latency/99', 'Microseconds', 5),
          Metric.new('block_put', 'Block/Put/Total', 'Operations', 0),
          Metric.new('block_put', 'Block/Put/Rate', 'Operations/Seconds', 1),
          Metric.new('block_put', 'Block/Put/Latency/Mean', 'Microseconds', 2),
          Metric.new('block_put', 'Block/Put/Latency/Median', 'Microseconds', 3),
          Metric.new('block_put', 'Block/Put/Latency/95', 'Microseconds', 4),
          Metric.new('block_put', 'Block/Put/Latency/99', 'Microseconds', 5),
          Metric.new('block_delete', 'Block/Delete/Total', 'Operations', 0),
          Metric.new('block_delete', 'Block/Delete/Rate', 'Operations/Seconds', 1),
          Metric.new('block_delete', 'Block/Delete/Latency/Mean', 'Microseconds', 2),
          Metric.new('block_delete', 'Block/Delete/Latency/Median', 'Microseconds', 3),
          Metric.new('block_delete', 'Block/Delete/Latency/95', 'Microseconds', 4),
          Metric.new('block_delete', 'Block/Delete/Latency/99', 'Microseconds', 5),
          Metric.new('service_get_buckets', 'Service/GetBuckets/Total', 'Operations', 0),
          Metric.new('service_get_buckets', 'Service/GetBuckets/Rate', 'Operations/Seconds', 1),
          Metric.new('service_get_buckets', 'Service/GetBuckets/Latency/Mean', 'Microseconds', 2),
          Metric.new('service_get_buckets', 'Service/GetBuckets/Latency/Median', 'Microseconds', 3),
          Metric.new('service_get_buckets', 'Service/GetBuckets/Latency/95', 'Microseconds', 4),
          Metric.new('service_get_buckets', 'Service/GetBuckets/Latency/99', 'Microseconds', 5),
          Metric.new('bucket_list_keys', 'Bucket/ListKeys/Total', 'Operations', 0),
          Metric.new('bucket_list_keys', 'Bucket/ListKeys/Rate', 'Operations/Seconds', 1),
          Metric.new('bucket_list_keys', 'Bucket/ListKeys/Latency/Mean', 'Microseconds', 2),
          Metric.new('bucket_list_keys', 'Bucket/ListKeys/Latency/Median', 'Microseconds', 3),
          Metric.new('bucket_list_keys', 'Bucket/ListKeys/Latency/95', 'Microseconds', 4),
          Metric.new('bucket_list_keys', 'Bucket/ListKeys/Latency/99', 'Microseconds', 5),
          Metric.new('bucket_create', 'Bucket/Create/Total', 'Operations', 0),
          Metric.new('bucket_create', 'Bucket/Create/Rate', 'Operations/Seconds', 1),
          Metric.new('bucket_create', 'Bucket/Create/Latency/Mean', 'Microseconds', 2),
          Metric.new('bucket_create', 'Bucket/Create/Latency/Median', 'Microseconds', 3),
          Metric.new('bucket_create', 'Bucket/Create/Latency/95', 'Microseconds', 4),
          Metric.new('bucket_create', 'Bucket/Create/Latency/99', 'Microseconds', 5),
          Metric.new('bucket_delete', 'Bucket/Delete/Total', 'Operations', 0),
          Metric.new('bucket_delete', 'Bucket/Delete/Rate', 'Operations/Seconds', 1),
          Metric.new('bucket_delete', 'Bucket/Delete/Latency/Mean', 'Microseconds', 2),
          Metric.new('bucket_delete', 'Bucket/Delete/Latency/Median', 'Microseconds', 3),
          Metric.new('bucket_delete', 'Bucket/Delete/Latency/95', 'Microseconds', 4),
          Metric.new('bucket_delete', 'Bucket/Delete/Latency/99', 'Microseconds', 5),
          Metric.new('bucket_get_acl', 'Bucket/GetAcl/Total', 'Operations', 0),
          Metric.new('bucket_get_acl', 'Bucket/GetAcl/Rate', 'Operations/Seconds', 1),
          Metric.new('bucket_get_acl', 'Bucket/GetAcl/Latency/Mean', 'Microseconds', 2),
          Metric.new('bucket_get_acl', 'Bucket/GetAcl/Latency/Median', 'Microseconds', 3),
          Metric.new('bucket_get_acl', 'Bucket/GetAcl/Latency/95', 'Microseconds', 4),
          Metric.new('bucket_get_acl', 'Bucket/GetAcl/Latency/99', 'Microseconds', 5),
          Metric.new('bucket_put_acl', 'Bucket/PutAcl/Total', 'Operations', 0),
          Metric.new('bucket_put_acl', 'Bucket/PutAcl/Rate', 'Operations/Seconds', 1),
          Metric.new('bucket_put_acl', 'Bucket/PutAcl/Latency/Mean', 'Microseconds', 2),
          Metric.new('bucket_put_acl', 'Bucket/PutAcl/Latency/Median', 'Microseconds', 3),
          Metric.new('bucket_put_acl', 'Bucket/PutAcl/Latency/95', 'Microseconds', 4),
          Metric.new('bucket_put_acl', 'Bucket/PutAcl/Latency/99', 'Microseconds', 5),
          Metric.new('object_get', 'Object/Get/Total', 'Operations', 0),
          Metric.new('object_get', 'Object/Get/Rate', 'Operations/Seconds', 1),
          Metric.new('object_get', 'Object/Get/Latency/Mean', 'Microseconds', 2),
          Metric.new('object_get', 'Object/Get/Latency/Median', 'Microseconds', 3),
          Metric.new('object_get', 'Object/Get/Latency/95', 'Microseconds', 4),
          Metric.new('object_get', 'Object/Get/Latency/99', 'Microseconds', 5),
          Metric.new('object_put', 'Object/Put/Total', 'Operations', 0),
          Metric.new('object_put', 'Object/Put/Rate', 'Operations/Seconds', 1),
          Metric.new('object_put', 'Object/Put/Latency/Mean', 'Microseconds', 2),
          Metric.new('object_put', 'Object/Put/Latency/Median', 'Microseconds', 3),
          Metric.new('object_put', 'Object/Put/Latency/95', 'Microseconds', 4),
          Metric.new('object_put', 'Object/Put/Latency/99', 'Microseconds', 5),
          Metric.new('object_head', 'Object/Head/Total', 'Operations', 0),
          Metric.new('object_head', 'Object/Head/Rate', 'Operations/Seconds', 1),
          Metric.new('object_head', 'Object/Head/Latency/Mean', 'Microseconds', 2),
          Metric.new('object_head', 'Object/Head/Latency/Median', 'Microseconds', 3),
          Metric.new('object_head', 'Object/Head/Latency/95', 'Microseconds', 4),
          Metric.new('object_head', 'Object/Head/Latency/99', 'Microseconds', 5),
          Metric.new('object_delete', 'Object/Delete/Total', 'Operations', 0),
          Metric.new('object_delete', 'Object/Delete/Rate', 'Operations/Seconds', 1),
          Metric.new('object_delete', 'Object/Delete/Latency/Mean', 'Microseconds', 2),
          Metric.new('object_delete', 'Object/Delete/Latency/Median', 'Microseconds', 3),
          Metric.new('object_delete', 'Object/Delete/Latency/95', 'Microseconds', 4),
          Metric.new('object_delete', 'Object/Delete/Latency/99', 'Microseconds', 5),
          Metric.new('object_get_acl', 'Object/GetAcl/Total', 'Operations', 0),
          Metric.new('object_get_acl', 'Object/GetAcl/Rate', 'Operations/Seconds', 1),
          Metric.new('object_get_acl', 'Object/GetAcl/Latency/Mean', 'Microseconds', 2),
          Metric.new('object_get_acl', 'Object/GetAcl/Latency/Median', 'Microseconds', 3),
          Metric.new('object_get_acl', 'Object/GetAcl/Latency/95', 'Microseconds', 4),
          Metric.new('object_get_acl', 'Object/GetAcl/Latency/99', 'Microseconds', 5),
          Metric.new('object_put_acl', 'Object/PutAcl/Total', 'Operations', 0),
          Metric.new('object_put_acl', 'Object/PutAcl/Rate', 'Operations/Seconds', 1),
          Metric.new('object_put_acl', 'Object/PutAcl/Latency/Mean', 'Microseconds', 2),
          Metric.new('object_put_acl', 'Object/PutAcl/Latency/Median', 'Microseconds', 3),
          Metric.new('object_put_acl', 'Object/PutAcl/Latency/95', 'Microseconds', 4),
          Metric.new('object_put_acl', 'Object/PutAcl/Latency/99', 'Microseconds', 5)
      ]
    end

    def poll_cycle
      stats = JSON.parse(riak_cs_get("http://#{host}:#{port}","/riak-cs/stats",access_id,secret_key))

      for metric in @metrics
        report_metric metric.name,
                      metric.unit,
                      metric.processor.process(stats[metric.key][metric.arr_index])
      end

    end

    def riak_cs_get(cs_host, path, access_id, secret_key)

      header_date = Time.now.strftime("%a, %d %B %Y %I:%M:%S EDT")
      auth_string = "GET\n\napplication/json\n#{header_date}\n/#{path}"
      hash_code = Base64.encode64((HMAC::SHA1.new(secret_key) << auth_string).digest).strip
      auth_header = "AWS #{access_id}:#{hash_code}"

      RestClient.proxy = ENV["HTTP_PROXY"] unless ENV['HTTP_PROXY'].nil?
      data = RestClient.get "#{cs_host}#{path}", {
          'Authorization' => auth_header,
          'Content-Type' => 'application/json',
          'Date' => header_date
      }

      data

    end
  end

  NewRelic::Plugin::Setup.install_agent :riak_cs, RiakCSAgent
  NewRelic::Plugin::Run.setup_and_run
end
