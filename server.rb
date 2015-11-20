require "sinatra"
require "./analytics_client"
require "json"

get "/downloads.json" do
  headers["Content-Type"] = "application/json"
  JSON.unparse(AnalyticsClient.get_downloads)
end
