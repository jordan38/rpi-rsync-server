# Rsync server for ARM based Raspberry PI

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
        
    $ rsync -rdt rsync://{RSYNC_SERVEUR_IP}:{RSYNC_PORT}/
    


