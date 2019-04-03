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
3. Verify or create youtrack data directories inside docker_youtrack
  * youtrack/data
  * youtrack/logs
  * youtrack/conf
  * youtrack/backups
4. Make owner of those directories 13001
  * `chown -R 13001:13001 {dir}`
5. Start with docker from within docker_youtrack directory
  * `docker-compose up -d`
## TeamCity
### AWS
1. Create a Lightsail or EC2 instance with at least 2 Gb RAM (or at least 4 for a single local agent +4gb for each local agent)
2. Open port 443
3. Create and record static IP for instance
4. Install Docker and docker-compose
### Server
1. Download the git repository https://github.com/Syncroness-Inc/IUPAT-dev-servers/ 
2. Modify docker_teamcity/nginx/tc_default.conf with the Static IP/Hostmane
3. Put ssl certs into docker_teamcity/certs directory
  * files named nginx.crt and nginx.key or modify yt_default with correct cert names.
4. Start with docker from within docker_youtrack directory
  * `docker-compose -p teamcity up -d`
5. Connect to Teamcity using https://{configured URL/IP}
6. Setup Teamcity DB Connection
  * Type: PostgreSql
  * server: tc_postgres
  * database: teamcity
  * user: tc_user
  * pass: supersecret (Please change this to something secure in the docker-compose.yml file before building)
  
### Server Update
1. `docker-compose -p teamcity stop`
2. `docker rm teamcity`
3. `docker pull jetbrains/teamcity-server`
4. `docker-compose -p teamcity up -d`
  
### TeamCity build Agent
1. Create a Lightsail or EC2 instance with at least 4Gb per agent running on machine
2. Install Docker
3. Download the git repository https://github.com/Syncroness-Inc/IUPAT-dev-servers/
4. Build the java based agent
  * from the docker_teamcity/javaAgent directory
  * run 'docker build -f JavaAgent -t javaagent .'
5. Run the agent
  * 'docker run -it --name fast_agent --restart unless-stopped -e SERVER_URL="{temacity server internal IP}:8111" -e AGENT_NAME="Agent 007" -e TZ="US/Mountain" -v /home/ubuntu/agentConfig:/data/teamcity_agent/conf -v /etc/timzone:/etc/timzone:ro javaagent'
  * for multiple agents, change the agent config volume, and Agent name.
