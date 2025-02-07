#!/usr/bin/env bash

# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


# Stop all hadoop daemons.  Run this on master node.

#echo "This script is Deprecated. Instead use stop-dfs.sh and stop-yarn.sh"

bin=`dirname "${BASH_SOURCE-$0}"`
bin=`cd "$bin"; pwd`

DEFAULT_LIBEXEC_DIR="$bin"/../libexec
HADOOP_LIBEXEC_DIR=${HADOOP_LIBEXEC_DIR:-$DEFAULT_LIBEXEC_DIR}
. $HADOOP_LIBEXEC_DIR/hadoop-config.sh

# stop hdfs daemons if hdfs is present
if [ -f "${HADOOP_HDFS_HOME}"/sbin/stop-dfs.sh ]; then
  "${HADOOP_HDFS_HOME}"/sbin/stop-dfs.sh --config $HADOOP_CONF_DIR
fi

# stop yarn daemons if yarn is present
if [ -f "${HADOOP_HDFS_HOME}"/sbin/stop-yarn.sh ]; then
  "${HADOOP_HDFS_HOME}"/sbin/stop-yarn.sh --config $HADOOP_CONF_DIR
fi
