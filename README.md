# DEEP as a Service generic container

![DEEP-Hybrid-DataCloud logo](https://marketplace.deep-hybrid-datacloud.eu/images/logo-deep.png)

This is a container that will simply run the DEEP as a Service API component,
with a dummy application (model) that does almost nothing.

# Running the container

## Directly from Docker Hub

To run the Docker container directly from Docker Hub and start using the API
simply run the following command:

```bash
$ docker run -ti -p 5000:5000 deephdc/deep-oc-generic-container
```

This command will pull the Docker container grom the Docker Hub
[`deephdc`](https://hub.docker.com/u/deephdc/) organization.

## Building the container

If you want to build the container directly in your machine (because you want
to modify the `Dockerfile` for instance) follow the following instructions:

Building the container:

1. Get the `DEEP-OC-generic-container` repository (this repo):

    ```bash
    $ git clone https://github.com/indigo-dc/DEEP-OC-generic-container
    ```

2. Build the container:

    ```bash
    $ cd DEEP-OC-generic-container
    $ docker build -t deephdc/deep-oc-generic-container .
    ```

3. Run the container:

    ```bash
    $ docker run -ti -p 5000:5000 deephdc/deep-oc-generic-container
    ```

These three steps will download the repository from GitHub and will build the
Docker container locally on your machine. You can inspect and modify the
`Dockerfile` in order to check what is going on. For instance, you can pass the
`--debug=True` flag to the `deepaas-run` command, in order to enable the debug
mode.

# Connect to the API

Once the container is up and running, browse to `http://localhost:5000` to get
the [OpenAPI (Swagger)](https://www.openapis.org/) documentation page.
