# lurl
little url app

There are lots of public URL shortners. This is my own.

# Functionality

This app has no mechanism (from the web) to add URLs. This is intentional, as
it prevents the need to write a login or authentication system.

# Configuration

This script is run in a CGI context rather than as a resident server.
It requires one environment variable `URL_FILE` which contains lines in the
following format:

```
key|destinationurl
```

The key is specified as a query string parameter called `target`.

# Webserver configuration

Info to come.

# License

[MIT](LICENSE.TXT)
