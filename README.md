# Compare API frameworks
Inspired by `The Crystal Language from ~scratch~ ruby by Sérgio Gil` presented on [Ruby Unconf 2018](https://rubyunconf.eu).
It seemed that crystal is quite easy to try for people who are used to ruby.

So, let's compare Ruby(grape) to Crystal(kemal) performance, ease of use and programmer happiness =)
... or at least some of the previous =D

## Test responses
static:
```
{"hello":"dolly"}
```

random (where the number is generated using `rand(365)`):
```
{"your_happy_number":203}
```
## crude results
Despite default behavior without any performance optimizations was initially aimed. Few adjustments were tried on grape.
All data were measured on same computer with [ab](https://httpd.apache.org/docs/2.4/programs/ab.html) with same params (`-n 1000 -c 6`)

### static response
| framework and options   | response |    RPS   |
|-------------------------|----------|----------|
| grape puma              |  random  |   756.23 |
| grape puma              |  static  |   791.94 |
| grape puma jbuilder     |  random  |   753.28 |
| grape puma jbuilder     |  static  |   758.33 |
| grape webrick           |  random  |   525.55 |
| grape webrick           |  static  |   523.55 |
| grape webrick jbuilder  |  random  |   518.51 |
| grape webrick jbuilder  |  static  |   523.67 |
| kemal                   |  random  |  6964.32 |
| kemal                   |  static  |  7206.53 |

### oj - worth it?
Some say `oj` is great for handling JSONs, I expect they are fast in parsing, but purely for outputting it does not seems to bring much difference

| framework and options   | response | RPS with OJ | without |
|-------------------------|----------|-------------|---------|
| grape puma jbuilder     |  random  |      750.76 |  753.28 |
| grape puma jbuilder     |  static  |      772.48 |  758.33 |
| grape puma              |  random  |      745.31 |  756.23 |
| grape puma              |  static  |      775.52 |  791.94 |
| grape webrick jbuilder  |  random  |      517.64 |  518.51 |
| grape webrick jbuilder  |  static  |      514.47 |  523.67 |

