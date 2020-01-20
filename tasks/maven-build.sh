#!/bin/bash

M2_HOME=${HOME}/.m2
mkdir -p ${M2_HOME}
 
M2_LOCAL_REPO="${ROOT_FOLDER}/.m2"
 
mkdir -p "${M2_LOCAL_REPO}/repository"
 
cat > ${M2_HOME}/settings.xml <<EOF
 
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0
                          https://maven.apache.org/xsd/settings-1.0.0.xsd">
      <localRepository>${M2_LOCAL_REPO}/repository</localRepository>
</settings>
 
EOF

cd source-code || echo "missing input resource: source-code"

echo "Using MAVEN_OPTS: ${MAVEN_OPTS}"

mvn verify ${MAVEN_ARGS}
