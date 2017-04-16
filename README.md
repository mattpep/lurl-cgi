# lurl
little url app

There are lots of public URL shortners. This is my own.

# Functionality

This app has no mechanism (from the web) to add URLs. This is intentional, as
it prevents the need to write a login or authentication system.

# Configuration

This script is run in a CGI context rather than as a resident server.
It requires one environment variable `REDIS_DB` which points to the desired
redis database (in the format used by the `redis` gem).

Key values are strings; no hashes, sets or lists needed.


The key is specified as a required query string parameter called `target`.

There is an optional query string parameter called `show_invalid_key` which is
a bit more verbose. It potentially leaks the fact there is an app running which
responds to certain keys. This is likely useful only for debug purposes rather
than in a general-purpose public-facing situation.

# Webserver configuration

Info to come.

# License

[MIT](LICENSE.TXT)
