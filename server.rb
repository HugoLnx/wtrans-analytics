require "sinatra"
require "./analytics_client"
require "json"

get "/downloads.json" do
  headers["Content-Type"] = "application/json"
  headers["Access-Control-Allow-Origin"] = "http://wtrans.inf.puc-rio.br*" 
  JSON.unparse(AnalyticsClient.get_downloads)
end
