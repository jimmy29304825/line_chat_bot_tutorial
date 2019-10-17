# line_chat_bot_tutorial
## Setup line_chat_bot enviorment(jupyter and ngrok web server)
```sh
git clone https://github.com/jimmy29304825/line_chat_bot_tutorial.git
cd line_chat_bot_tutorial
sh build.sh
sh start.sh
# check the url which system gives you and put in line designer
```
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

# enter >> set URL = [LongDB's IP] >> enter

# or Edit odbc.ini file 
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
