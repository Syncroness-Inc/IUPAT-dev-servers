# Setting Up Youtrack and Teamcity with Docker
## Youtrack
### AWS
1. Create a Lightsail or EC2 instance with at least 2 Gb RAM
2. Open port 443
3. Create and record static IP for instance
4. Install Docker and docker-compose
### Server
1. Copy "docker_youtrack" directory to instance 
2. Modify docker_youtrack/nginx/yt_default.conf with the Static IP/Hostmane
3. Put ssl certs into docker_youtrack/certs directory
  * files named nginx.crt and nginx.key or modify yt_default with correct cert names.
3. Verify youtrack data directories inside docker_youtrack
  * youtrack/data
  * youtrack/logs
  * youtrack/conf
  * youtrack/backups
4. Make owner of those directories 13001
  * `chown -R 13001:13001 {dir}`
5. Start with docker from within docker_youtrack directory
  * 'docker-compose up -d'
## TeamCity
### AWS
Create a Lightsail or EC2 instance with at least 4 Gb RAM
2. Open port 443
3. Create and record static IP for instance
4. Install Docker and docker-compose
### Server
1. Copy "docker_teamcity" directory to instance 
2. Modify docker_teamcity/nginx/tc_default.conf with the Static IP/Hostmane
3. Put ssl certs into docker_teamcity/certs directory
  * files named nginx.crt and nginx.key or modify yt_default with correct cert names.
4. Start with docker from within docker_youtrack directory
  * 'docker-compose up -d'
5. Setup initial DB
  * `docker run -it --rm --net dockerteamcity_default --link tc_postgres:postgres postgres psql -h postgres -U postgres`
  * `create database teamcity;`
  * `create user tc_user with encrypted password 'magpie123';`
  * `grant all privileges on database teamcity to tc_user;`
