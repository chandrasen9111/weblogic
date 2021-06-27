import os
import socket

ADMIN_SERVER_USERNAME      = os.environ.get("ADMIN_SERVER_USERNAME")
ADMIN_SERVER_PASSWORD      = os.environ.get("ADMIN_SERVER_PASSWORD")
DOMAIN_NAME                = os.environ.get("DOMAIN_NAME")
DOMAIN_PATH = "/u01/oracle/user_projects/domains/" + DOMAIN_NAME
dsName      = os.environ.get("DS_NAME")
DS_DRIVER = os.environ.get("DS_DRIVER")
DS_USER_NAME = os.environ.get("DS_USER_NAME")
dbpassword = os.environ.get("DS_PASSWORD")
DS_URL = os.environ.get("DS_URL")
NEW_ENC_PASSWORD = encrypt(dbpassword,DOMAIN_PATH)
DS_MBEAN="/JDBCSystemResources/"+dsName+"/JdbcResource/"+ dsName + "/JDBCDriverParams/NO_NAME_0"

readDomain(DOMAIN_PATH)

cd(DS_MBEAN)
set('DriverName',DS_DRIVER)
set('URL',DS_URL)
set('PasswordEncrypted',NEW_ENC_PASSWORD)
set('Url',DS_URL)
cd('Properties/NO_NAME_0/Property/user')
set('Value', DS_USER_NAME)

updateDomain()