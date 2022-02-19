# PlugCowboyPlayground

Simple project implementing a HTTP server using the PlugCowboy Elixir library. Cowboy is a simple HTTP server for Erlang and Plug will provide us with a connection adapter for that web server.

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

```json
Welcome
```

Then, go to <http://127.0.0.1:8080/audioslave>, or any other path. It should output:

```json
Oops!
```

with a `404` response.

To test the `VerifyRequest` plug, open <http://127.0.0.1:8080/upload> in your browser and you’ll see that the page simply isn’t working. You’ll just see an error page provided by our server.

Now let’s add our required params by going to <http://127.0.0.1:8080/upload?content=thing1&mimetype=thing2>. Now we should see our `Uploaded` message.
