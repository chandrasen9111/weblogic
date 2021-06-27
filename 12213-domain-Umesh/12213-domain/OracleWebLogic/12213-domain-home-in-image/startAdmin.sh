sudo docker run -d \
     --name weblogic-testing \
     --publish 7002:7001 \
     --publish 9003:9002 \
	 --env DOMAIN_NAME=mwidomain \
     --env SSL_ENABLED=false \
     --env ADMIN_PORT=7001 \
     --env ADMIN_SERVER_SSL_PORT=7002 \
     --env MANAGED_SERVER_NAME="CS_MS1 FP_MS1 FM_MS1" \
     --env MANAGED_SERVER_NEEDS_JMS="true true false" \
     --env MANAGED_SERVER_PORT="8001 8002 8003" \
     --env MANAGED_SERVER_SSL_PORT="10001 10002 10003" \
     --env MANAGED_SERVER_NAME_BASE=MS \
     --env MACHINE_NAME=$(hostname) \
     --env CONFIGURED_MANAGED_SERVER_COUNT=4 \
     --env DEBUG_PORT=8453 \
     --env DEBUG_FLAG=true \
     --env ADMIN_NAME=admin-server \
     --env ADMIN_HOST=wlsadmin \
     --env CLUSTER_NAME="cluster-1" \
     --env CUSTOM_SSL_ENABLED=false \
     --env DB_PORT=1527 \
     --env DS_NAME=DS2 \
     --env DS_JNDI_NAME="jndi/ds3" \
     --env DS_DRIVER="oracle.jdbc.OracleDriver" \
     --env DS_USER_NAME=CUSTOMERINFO \
     --env DS_PASSWORD="PWD4CUSTOMERINFO" \
     --env DS_DB_NAME="XEPDB1" \
     --env DS_URL="jdbc:oracle:thin:@//10.115.85.92:1522/XEPDB1" \
     --env DS_INITIAL_CAPACITY="1" \
     --env PRODUCTION_MODE_ENABLED=true \
     --env CLUSTER_TYPE=DYNAMIC \
     --env JAVA_OPTIONS='-Dweblogic.StdoutDebugEnabled=false' \
     --env T3_CHANNEL_PORT=30012 \
     --env T3_PUBLIC_ADDRESS=kubernetes \
     --env ADMIN_SERVER_USERNAME=weblogic \
     --env ADMIN_SERVER_PASSWORD=weblogic1 \
     --env WEBLOGIC_JAVA_OPTIONS="-Dweblogic.StdoutDebugEnabled=false" \
	 --env PROPERTIES_FILE_DIR="/u01/oracle/properties" \
     --restart always \
     --volume $PWD/properties/docker-run:/u01/oracle/properties \
     domain-home-in-image:12.2.1.3 \
     startAdminServer.sh