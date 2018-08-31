# Rsync server for ARM based Raspberry PI

[![CircleCI](https://circleci.com/gh/jordan38/rpi-rsync-server/tree/master.svg?style=svg)](https://circleci.com/gh/jordan38/rpi-rsync-server/tree/master)

## Running
     
    $ docker run --name=rsync-server \
                  -p 873:873  \
                  -v {path/host}:/rsync/data \
                  -e LOGIN={login} \
                  -e PASSWORD={password} \
                  -d -t rpi-rsync-server 
      
## Customizing

    Edit file rsyncd.conf with your own properties and build.

    $ docker build -t rpi-rsync-server .

## Debugging
        
    $ docker exec -it rsync-server sh
    
    $ docker logs -f rsync-server
        
    $ rsync rsync://{RSYNC_SERVEUR_IP}:{RSYNC_PORT}/
    
    $ rsync -avP --no-perms --password-file=credential.secret /path/to/dir rsync://<docker>:<port>/<module_rsync>/
    
## Where to find logging file ?

    Inside the container you can find the log file for rsync in /var/log/rsync/rsync.log
    
    
    


