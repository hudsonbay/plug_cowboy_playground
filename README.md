# PlugCowboyPlayground

Simple project implementing a HTTP serverusing the PlugCowboy Elixir library. Cowboy is a simple HTTP server for Erlang and Plug will provide us with a connection adapter for that web server.

It aims to provide a playground to try new things with plugs.

## Installation

```sh
mix deps.get
```

## How to interact with this project

Start the server with:

```sh
mix run --no-halt
```

Once everything is finished compiling, and `[info] Starting application...` appears, open a web browser to <http://127.0.0.1:8080>. It should display:

```
Hello World!
```
