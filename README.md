# Setting Up Youtrack and Teamcity with Docker
## Youtrack
### AWS
1. Create a Lightsail or EC2 instance with at least 2 Gb RAM
2. Open port 443
3. Create and record static IP for instance
4. Install Docker
### Server
1. Modify docker_youtrack/nginx/yt_default.conf with the Static IP/Hostmane
2. Copy "docker_youtrack" directory to instance
3. Make youtrack data directories inside docker_youtrack
  * youtrack/data
  * youtrack/logs
  * youtrack/conf
  * youtrack/backups
4. make owner of those directories 13001
  * "chown -R 13001:13001 {dir}"
