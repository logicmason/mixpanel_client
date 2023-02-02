# Mixpanel

Elixir client for the Mixpanel API, forked from: https://github.com/agevio/mixpanel_api_ex

This repo is forked because I needed to make some updates to avoid dependency clashes and the
original project doesn't appear to be accepting pull requests anymore. It's on github for
convenience but please don't expect support. @agevio, if you would like these downstream
changes as a PR to mixpanel_api_ex, just say the word!

## Installation

The package can be installed as:

  1. Add `mixpanel_client` to your list of dependencies in `mix.exs`:

  ```elixir
  def deps do
    [{:mixpanel_client, github: "logicmason/mixpanel_client"}]
  end
  ```

  2. Ensure `mixpanel_client` is started before your application:

  ```elixir
  def application do
    [applications: [:mixpanel_client]]
  end
  ```

  3. Ensure your Mixpanel token was placed in config file:
  ```elixir
  config :mixpanel_client, token: "<Put API token here>", active: true
  ```

  4. Disable sending requests to API for tests:
  ```elixir
  config :mixpanel_client, token: "", active: false
  ```

## Usage

  1. Track events with `Mixpanel.track/3` function:

  ```elixir
  iex> Mixpanel.track("Signed up", %{"Referred By" => "friend"}, distinct_id: "13793")
  :ok
  iex> Mixpanel.track("Level Complete", %{"Level Number" => 9}, distinct_id: "13793", time: 1358208000, ip: "203.0.113.9")
  :ok
  ```

  2. Track profile updates with `Mixpanel.engage/4` function:

  ```elixir
  iex> Mixpanel.engage("13793", "$set", %{"Address" => "1313 Mockingbird Lane"}, ip: "123.123.123.123")
  :ok
  iex> Mixpanel.engage("13793", "$set", %{"Address" => "1313 Mockingbird Lane", "Birthday" => "1948-01-01"}, ip: "123.123.123.123")
  :ok
  ```
