#!/bin/bash
apt update
apt install -y openjdk-8-jdk maven gradle ant
echo 'export JAVA_HOME="/usr/lib/jvm/open-jdk"' >> ~/.bashrc