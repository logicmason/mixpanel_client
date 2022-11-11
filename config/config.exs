import Config

if Mix.env() == :test do
  config :mixpanel_client, :config,
    active: true,
    token: ""
end
