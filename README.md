#### To start a container

-   Pull the image

```bash
docker pull ewarehouse/baza-wallet-api
```

-   Run it

```bash
docker run -it -v ~/baza-wallet-api-data:/data -p 127.0.0.1:8070:8070 -e WALLET_API_RPC_PASSWORD=changethis ewarehouse/baza-wallet-api
```

-   The volume is added for convenience, you can put your existing wallet file there or provide this directory as path for creating new wallet, so that it will be easier to backup and add persistency to the wallet file.

NOTE: If you are running the container with --user flag and using a host directory to mount volume. You should create the directory first with same user ownership or change ownership of the directory to avoid `failed to create directory error`.
