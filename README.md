# Rsync server for ARM based Raspberry PI

## Running

     $ docker create --detach \
                  --name rsync-server \
                  --port 873:873
                  --env NAME=NAS_BACKUP \
                  --env LOGIN=login \
                  --env PASSWORD=password \
                  --volume <path to data>:/media/rsync \
                  --restart unless-stopped \
                  rpi-rsync-server
     
     $ docker      run  \
                   --name rsync-server \
                   -p 873:873
                   --env NAME=NAS_BACKUP \
                   --env LOGIN=login \
                   --env PASSWORD=password \
                   --volume /usr/bin/qemu-arm-static:/usr/bin/qemu-arm-static
                   --volume <path to data>:/media/rsync \
                   --restart unless-stopped \
                   rpi-rsync-server
      

## Customising

## Debugging

After running docker exec ddclient setup look up, if configuration was set right:

    $ docker exec rsync-server cat /etc/default/rsync
    
    $ docker exec rsync-server cat /etc/default/rsyncd.conf
    
Finally you could dig into the container:

    $ docker exec -it rsync-server bash
    
To monitor the logs of the container in realtime
    
    $ docker logs -f rsync-server

## Contributing

### License