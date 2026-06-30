# ssh-cert-playground

## Playground

### Start

```bash
./start.sh
```

### Tail server logs

```bash
./scripts/tail-server-logs.sh
```

### Login to server from client

```bash
./scripts/attach-client.sh

# Attempt to login with no signed key
ssh test1@server -- id

# Attempt to login with with signed key
/generate-signed-key.sh test1
ssh test1@server -- id

# Attempt to login with with signed key but wrong principal
ssh test2@server -- id

# Attempt to login with with signed key
/generate-signed-key.sh test2
ssh test2@server -- id
```

### Rotate CA

```bash
scripts/generate-ca.sh
```

### Stop

```bash
./start.sh
```
