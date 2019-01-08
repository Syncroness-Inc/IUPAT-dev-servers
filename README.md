# Setting Up Youtrack and Teamcity with Docker
## Youtrack
### AWS
1. Create a Lightsail or EC2 instance with at least 2 Gb RAM
2. Open port 443
3. Create and record static IP for instance
4. Install Docker
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
  * "chown -R 13001:13001 {dir}"
