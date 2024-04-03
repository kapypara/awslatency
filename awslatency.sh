#!/usr/bin/env bash

# A quick script to test latency times between AWS datacenters
#
# 28 Jan 2017 - jorgedlt@gmail.com

sites=$( cat $0 | grep '^#\.' | sed -e 's/^#\.//' |
  awk '{print $1}' | tr -d ' ')
data=$( cat $0 | grep '^#\.' | sed -e 's/^#\.//' )

for i in $sites; do
  echo "$data"  | grep $i | cut -d' ' -f3,4
  pingraw=$(/sbin/ping -W 5000 -c 3 ${i})
  packets=$(echo "${pingraw}" | grep packets | cut -d',' -f1,2,3)
  roundtrip=$(echo "${pingraw}" | grep min.avg.max | cut -d'/' -f5)
  echo "     $packets $roundtrip ms"
done

# AWS DataCenters Data - 03 APR2024
#. dynamodb.us-east-1.amazonaws.com	us-east-1 (Virginia)
#. dynamodb.us-east-2.amazonaws.com	us-east-2 (Ohio)
#. dynamodb.us-west-1.amazonaws.com	us-west-1 (California)
#. dynamodb.us-west-2.amazonaws.com	us-west-2 (Oregon)
#. dynamodb.ca-central-1.amazonaws.com	ca-central-1 (Central)
#. dynamodb.eu-west-1.amazonaws.com	eu-west-1 (Ireland)
#. dynamodb.eu-west-2.amazonaws.com	eu-west-2 (London)
#. dynamodb.eu-west-3.amazonaws.com	eu-west-3 (Paris)
#. dynamodb.eu-central-1.amazonaws.com	eu-central-1 (Frankfurt)
#. dynamodb.eu-central-2.amazonaws.com	eu-central-2 (Zurich)
#. dynamodb.eu-south-1.amazonaws.com	eu-south-1 (Milan)
#. dynamodb.eu-south-2.amazonaws.com	eu-south-2 (Spain)
#. dynamodb.eu-north-1.amazonaws.com	eu-north-1 (Stockholm)
#. dynamodb.il-central-1.amazonaws.com	il-central-1 (Tel Aviv)
#. dynamodb.me-south-1.amazonaws.com	me-south-1 (Bahrain)
#. streams.dynamodb.me-central-1.amazonaws.com	me-central-1 (UAE)
#. dynamodb.af-south-1.amazonaws.com	af-south-1 (Cape Town)
#. dynamodb.ap-east-1.amazonaws.com	ap-east-1 (Hong Kong)
#. dynamodb.ap-southeast-3.amazonaws.com	ap-southeast-3 (Jakarta)
#. dynamodb.ap-south-1.amazonaws.com	ap-south-1 (Mumbai)
#. dynamodb.ap-south-2.amazonaws.com	ap-south-2 (Hyderabad)
#. dynamodb.ap-northeast-3.amazonaws.com	ap-northeast-3 (Osaka)
#. dynamodb.ap-northeast-2.amazonaws.com	ap-northeast-2 (Seoul)
#. dynamodb.ap-southeast-1.amazonaws.com	ap-southeast-1 (Singapore)
#. dynamodb.ap-southeast-2.amazonaws.com	ap-southeast-2 (Sydney)
#. dynamodb.ap-southeast-4.amazonaws.com	ap-southeast-4 (Melbourne)
#. dynamodb.ap-northeast-1.amazonaws.com	ap-northeast-1 (Tokyo)
#. dynamodb.sa-east-1.amazonaws.com	sa-east-1 (São Paulo)
#. dynamodb.cn-north-1.amazonaws.com.cn	cn-north-1 (Beijing)
#. dynamodb.cn-northwest-1.amazonaws.com.cn	cn-northwest-1 (Ningxia)
#. dynamodb.us-gov-east-1.amazonaws.com	us-gov-east-1
#. dynamodb.us-gov-west-1.amazonaws.com	us-gov-west-1

