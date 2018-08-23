# Rsync server for ARM based Raspberry PI

## Running
     
     $ docker run --name=rsync-server \
                  -p 873:873  \
                  -v /tmp/rsync/:/rsync/data \
                  -e LOGIN=rsync \
                  -e PASSWORD=rsync \
                  -d -t rpi-rsync-server 
      
## Debugging
    
    $ docker exec -it rsync-server sh
    
    $ docker logs -f rsync-server
