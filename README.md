# Dockerized SSH and Python Container
This simple container contains an SSH server and Python, which I use as an internal tool.  You SSH into it using the `pythonssh` user and the public keys URL is passed through with the `PUBLIC_KEYS_URL` environment variable.

---

_Example:_
```bash
docker run -d -p 2222:22 --name my-server -e PUBLIC_KEYS_URL=https://github.com/fred-drake.keys ghcr.io/fred-drake/python-ssh:latest
```

_And call it with:_
```bash
$ ssh pythonssh@localhost -p 2222
```
