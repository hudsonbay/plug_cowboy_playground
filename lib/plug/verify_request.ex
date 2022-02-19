defmodule PlugCowboyPlayground.Plug.VerifyRequest do
  @moduledoc """
  The first thing to note is we have defined a new exception `IncompleteRequestError`
  which we’ll raise in the event of an invalid request.

  The second portion of our Plug is the `call/2` function.
  This is where we decide whether or not to apply our verification logic.
  Only when the request’s path is contained in our :paths option will we call `verify_request!/2`.

  The last portion of our plug is the private function `verify_request!/2` which verifies
  whether the required `:fields` are all present. In the event that some are missing, we
  raise `IncompleteRequestError`.

  We’ve set up our Plug to verify that all requests to /upload include
  both "content" and "mimetype". Only then will the route code be executed.
  """
  defmodule IncompleteRequestError do
    @moduledoc """
    Error raised when a required field is missing.
    """

    defexception message: "", plug_status: 400
  end

  def init(options), do: options

  def call(%Plug.Conn{request_path: path} = conn, opts) do
    if path in opts[:paths], do: verify_request!(conn.params, opts[:fields])
    conn
  end

  defp verify_request!(params, fields) do
    verified =
      params
      |> Map.keys()
      |> contains_fields?(fields)

    unless verified, do: raise(IncompleteRequestError)
  end

  defp contains_fields?(keys, fields), do: Enum.all?(fields, &(&1 in keys))
end
