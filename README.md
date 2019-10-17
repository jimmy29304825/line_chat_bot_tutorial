# line_chat_bot_tutorial
## Jupyter Notebook connect LongDB(using ODBC package)
```sh
# Enter to jupyter's container
sudo docker exec -it line-chat-bot-jupyter bash

# Download ODBC package
cd /tmp; wget https://splice-releases.s3.amazonaws.com/odbc-driver/Linux64/splice_odbc_linux64-2.7.62.0.tar.gz

# Untar file
tar -zxvf splice_odbc_linux64-2.7.62.0.tar.gz

# Install package
cd splice_odbc_linux64-2.7.62.0; ./install.sh

# Edit odbc.ini file 
# enter > set URL = [LongDB's IP] > enter
# or change at /tmp/splice_odbc_linux64-2.7.62.0/odbc.ini
nano /tmp/splice_odbc_linux64-2.7.62.0/odbc.ini
# URL = 127.0.0.1 change to LongDB's IP
```

```ipnbpython
import pyodbc
# Connect to LongDB
cnxn=pyodbc.connect("DSN=SpliceODBC64")

# Call sql command
cursor=cnxn.cursor()

# Run sql command
cursor.execute("select * from sys.systables")

# Get one row out
row=cursor.fetchone()
print('row:',row)

# Get all row out
row=cursor.fetchall()
print('row:',row)
```