# docker-nym-mixnode
## build
```
docker build -t nym-mixnode:latest .
```

## init
```
docker run -v $PWD/node-data:/home/nym/.nym/ -it localhost/nym-mixnode:latest init --id $NYM_NODE_ID --host $(curl ifconfig.me)
```

## run
Start node
```
docker run --net host -v $PWD/node-data:/home/nym/.nym/ -it localhost/nym-mixnode:latest run --id $NYM_NODE_ID
```

Check node
```
docker run -v $PWD/node-data:/home/nym/.nym/ -it localhost/nym-mixnode:latest node-details --id $NYM_NODE_ID
```
