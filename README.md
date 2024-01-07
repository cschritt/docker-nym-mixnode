# docker-nym-mixnode
This Dockerfile sets up a minimal environment for running a Nym mixnode using the Nym mixnet privacy platform. It is based on the Debian stable-slim image and installs the necessary dependencies for the Nym mixnode binary.

## Image Details
- **Base Image:** `debian:stable-slim`
- **Nym Version:** The `VERSION` argument is set to `v2023.5-rolo`.
- **Exposed Ports:**
  - `1789`: Mixnode communication port.
  - `1790`: Mixnode metrics port.
  - `8000`: Mixnode HTTP API port.
- **Volumes:**
  - `/home/nym/.nym`


## Usage
Clone the Nym repository:
```bash
git clone https://github.com/cschritt/docker-nym-mixnode.git
```

### Build the docker image
Build the Docker image with the following command:
```bash
docker build -t nym-mixnode:latest --build-arg VERSION=v2023.5-rolo .
```

### Using compose
> [!IMPORTANT]
> Make sure to adjust the configuration and environment variables according to your specific requirements before running the Docker Compose commands.

1. Adjust the volume configuration and `NYM_NODE_ID` in the `docker-compose.yml` file to your needs (see [configuration](#configuration)).

2. Run the following command to initialize the Nym mixnode:
```bash
docker-compose run init
```

3. After the initialization is successful, start the Nym mixnode:
```bash
docker-compose up mixnode
```

The mixnode service will expose ports `1789`, `1790`, and `8000` for communication.

## Configuration
### Volumes
- `nym-node-data`: Persistent volume for storing Nym node data.

### Environment Variables
- `NYM_NODE_ID`: Specifies the ID for the Nym node. In this example, it is set to `node-01`. You can customize this value as needed.

## Note


For more information on Nym, visit [Nym Tech GitHub](https://github.com/nymtech/nym).

Happy mixing! 🕵️‍♂️🌐
