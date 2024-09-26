
### --- Installation of the MongoDB database 4.0 version to be compatible to the Alteryz Controller




az ssh vm --ip 10.106.103.10 #Mongo Server

az ssh vm --ip 10.106.103.11 

10.107.3.7


sudo chown -R $(whoami) /usr/local/share/man /usr/local/share/

chmod u+w /usr/local/share/man /usr/local/share/man/


brew update && brew install azure-cli


az cloud set --name AzureCloud  

az login


sudo service mongod stop
sudo apt-get purge mongodb-org*
sudo rm -r /var/log/mongodb
sudo rm -r /var/lib/mongodb

sudo apt-get remove mongodb* --purge



az ssh vm --ip 10.106.103.10


sudo su

apt-get update

apt-get install ssh

sudo apt install dirmngr gnupg apt-transport-https ca-certificates software-properties-common


sudo wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -


echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list


cd /etc/apt/sources.list.d/

sudo apt-get update

sudo apt-key list | \
 grep "expired: " | \
 sed -ne 's|pub .*/\([^ ]*\) .*|\1|gp' | \
 xargs -n1 sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys

#sudo userdel -r mongodb
#sudo groupdel mongodb
#sudo adduser mongodb
#sudo groupadd mongodb
#useradd -G mongodb mongodb

sudo apt-get update # to update newly listed mongodb 4.0 

sudo apt install mongodb-org -y
mongod --version



sudo apt-get install libssl1.0-dev

sudo apt-get update 

sudo chown -R mongodb:mongodb /var/lib/mongodb
sudo chown -R mongodb:mongodb /var/log/mongodb


sudo chown mongodb:mongodb /tmp/mongodb-27017.sock
chmod u+x /tmp/mongodb-27017.sock

sudo apt-get update

sudo rm -rf /tmp/mongodb-27017.sock
sudo service mongod start

sudo su

sudo systemctl stop mongod
sudo systemctl start mongod
sudo systemctl enable mongod
sudo systemctl status mongod



sudo systemctl stop mongod

sudo systemctl restart mongod

sudo systemctl status mongod

sudo mkdir -p /data/db/

sudo chown -R mongodb:mongodb /data/db

mongo --eval 'db.runCommand({ connectionStatus: 1 })'

sudo vi /etc/mongod.conf

# network interfaces
net:
  port: 27017
  bindIp: 127.0.0.1,10.106.103.10

#security:
security:
  authorization: enabled


sudo systemctl restart mongod

sudo systemctl status mongod

sudo chown {username} /data/db



netstat -an | grep 27017


`root@vmgtmongodb1dev:/#` 

mongosh

 use admin

 db.createUser(
  {
    user: "mongoAdmin",
    pwd: "1Mq0zAd9#qTN",
    roles: [ { role: "userAdminAnyDatabase", db: "admin" }]
 }
)

use admin;
db.grantRolesToUser('mongoAdmin', [{ role: 'root', db: 'admin' }])

db.auth( "mongoAdmin", '1Mq0zAd9#qTN' )


10.106.103.10

use AlteryxService

 db.createUser( { user: "alteryxController", pwd: "6!i43YNji7Af", roles: [ "readWrite" ]} )


 use AlteryxGallery

  db.createUser( { user: "alteryxController", pwd: "6!i43YNji7Af", roles: [ "readWrite"]} )



use AlteryxGallery_Lucene

  db.createUser( { user: "alteryxController", pwd: "6!i43YNji7Af", roles: [ "readWrite" ]} )
  

admin
ZP34SxKuGNhjbqVh

db.auth( "mongoAdmin", '1Mq0zAd9#qTN' )


db.getCollectionNames()

db.dropUser("alteryxController")

mongosh -u mongoAdmin -p --authenticationDatabase admin


mongosh -u alteryxController -p --authenticationDatabase AlteryxService

mongosh -u alteryxController -p --authenticationDatabase AlteryxGallery



mongorestore -u alteryxController -password  --authenticationDatabase --db AlteryxService  /mnt/gt_alteryx_private_share_dev/Alteryx_Backup/AlteryxService/


$mongorestore --host databasehost:12345 --username restoreuser --password restorepwd --authenticationDatabase admin --db targetdb ./path/to/dump/


mongodb://alteryxController:6!i43YNji7Af@10.106.103.9:27017/?authSource=AlteryxService&readPreference=primary&appname=MongoDB%20Compass&directConnection=true&ssl=false


mongodb://AlteryxController:6!i43YNji7Af@10.106.103.9:27017/?authSource=admin&readPreference=primary&appname=MongoDB%20Compass&directConnection=true&ssl=false


mongo -u alteryxController  10.106.103.10:27017/AlteryxService

mongod 10.106.103.10:27017/AlteryxService -u alteryxController -p 6!i43YNji7Af


`root@vmgtmongodb1dev:/#` mongosh

show dbs




ip a |grep inet


# for documentation of all options, see:
#   http://docs.mongodb.org/manual/reference/configuration-options/

# Where and how to store data.
storage:
  dbPath: /data/db
  journal:
    enabled: true
#  engine:
#  wiredTiger:














-- scp  10.109.32.4:gt_alteryx_private_share_dev/mongodb_backup /data/db/

mount -v -t nfs 10.109.32.4:/gt_alteryx_private_share_prod/mongodb_backup /mnt/gt_alteryx_private_share_prod

mongorestore --host=10.109.32.4  -u "c_joseph.nemuri@viasat.com" -p "Winter2#221234"  --db AlteryxService /data/db/ --authenticationDatabase "admin"

sudo ufw allow 80

az ssh vm --ip 10.106.103.10

mongosh -u alteryxController -p --authenticationDatabase AlteryxService

mongorestore --port 27017 --db AlteryxService  /mnt/gt_alteryx_private_share_dev/Alteryx_Backup/AlteryxService/


lsof +D ./ | awk '{print $2}' | tail -n +2 | xargs -r kill -9

root@vmgtmongodb1dev:/mnt/gt_alteryx_private_share_dev/Alteryx_Backup/AlteryxService# 

sudo mongorestore --db AlteryxService --nsExclude 'test.*1' /mnt/gt_alteryx_private_share_dev/Alteryx_Backup/AlteryxService/

mongorestore --db AlteryxService --dbpath /mnt/gt_alteryx_private_share_dev/Alteryx_Backup/AlteryxService/



mongorestore -d  AlteryxService /mnt/gt_alteryx_private_share_dev/Alteryx_Backup/AlteryxService/ --nsInclude="*"

mongorestore -u alteryxController -p 6!i43YNji7Af --authenticationDatabase admin -d AlteryxService /mnt/gt_alteryx_private_share_dev/Alteryx_Backup/AlteryxService/


mongorestore --nsInclude 'AlteryxService.*' --drop /mnt/gt_alteryx_private_share_dev/Alteryx_Backup/AlteryxService/


sudo mongorestore --db AlteryxService /mnt/gt_alteryx_private_share_dev/Alteryx_Backup/AlteryxService/



mongorestore -d  AlteryxService /mnt/gt_alteryx_landing_prod/mongodb_backup/mongodb_backup_2023_04_11/AlteryxService/ --nsExclude="test.*"
mongorestore -d  AlteryxGallery /mnt/gt_alteryx_landing_prod/mongodb_backup/mongodb_backup_2023_04_11/AlteryxGallery/ --nsExclude="test.*"
mongorestore -d  AlteryxGallery_Lucene /mnt/gt_alteryx_landing_prod/mongodb_backup/mongodb_backup_2023_04_11/AlteryxGallery_Lucene/ --nsExclude="test.*"
mongorestore -d AlteryxService /mnt/gt_alteryx_landing_prod/mongodb_backup/mongodb_backup_2023_04_11/admin/ --nsExclude="test.*"


sudo systemctl stop mongod

sudo systemctl restart mongod

sudo systemctl status mongod

db.auth( "mongoAdmin", '1Mq0zAd9#qTN' )



mongorestore -u 'mongoAdmin' -p '1Mq0zAd9#qTN' --authenticationDatabase=admin -d  AlteryxService /backup/mongodb_backup/AlteryxService/ --nsExclude="test.*"
mongorestore -u 'mongoAdmin' -p '1Mq0zAd9#qTN' --authenticationDatabase=admin -d  AlteryxGallery /backup/mongodb_backup/AlteryxGallery/ --nsExclude="test.*"
mongorestore -u 'mongoAdmin' -p '1Mq0zAd9#qTN' --authenticationDatabase=admin -d  AlteryxGallery_Lucene /backup//mongodb_backup/AlteryxGallery_Lucene/ --nsExclude="test.*"
mongorestore -u 'mongoAdmin' -p '1Mq0zAd9#qTN' --authenticationDatabase=admin -d  admin /backup/mongodb_backup/admin/ --nsExclude="test.*"

mongorestore --authenticationDatabase=admin --uri mongodb://mongoAdmin:1Mq0zAd9#qTN@localhost/admin?ssl=false&authSource=admin /backup/mongodb_backup/admin/ --nsExclude="test.*"


Add to hostfile

# localhost name resolution is handled within DNS itself.
#	127.0.0.1       localhost
#	::1             localhost
10.106.103.6     gt-alteryx-controller.viasat-gt-dev.az.viasat.com




# encryption
#restart mongod

#RuntimeSettings
#

10.109.32.4:/gt_alteryx_private_share_dev /mnt/gt_alteryx_private_share_dev nfs defaults,nofail 0


sudo mongod --port 27017 --dbpath /data/db --replSet MasterReplicaSet

sudo mongod --port 27017 --dbpath /data/db --replSet ArbReplicaSet



cfg = { _id: "MasterReplicaSet", members:[
{_id: 1, host: '10.107.3.7:27017'},
{_id: 2, host: '10.107.3.6:27017'}]
}

rs.initiate(config)

chown -R mongodb:mongodb /data/db
systemctl restart mongod


mongorestore -d  AlteryxService /mnt/gt_alteryx_landing_prod/mongodb_backup/mongodb_backup_2023_05_05/AlteryxService/ --nsExclude="test.*"
mongorestore -d  AlteryxGallery /mnt/gt_alteryx_landing_prod/mongodb_backup/mongodb_backup_2023_05_05/AlteryxGallery/ --nsExclude="test.*"
mongorestore -d  AlteryxGallery_Lucene /mnt/gt_alteryx_landing_prod/mongodb_backup/mongodb_backup_2023_05_05/AlteryxGallery_Lucene/ --nsExclude="test.*"
mongorestore -d AlteryxService /mnt/gt_alteryx_landing_prod/mongodb_backup/mongodb_backup_2023_05_05/admin/ --nsExclude="test.*"