require 'googleauth'
require "google/apis/analytics_v3"

module AnalyticsClient
  extend self

  Analytics = Google::Apis::AnalyticsV3
  ENV['GOOGLE_APPLICATION_CREDENTIALS'] = "./wtrans-de3a1e4ee2a9.json"
  SCOPES = ["https://www.googleapis.com/auth/analytics.readonly"]
  
  def get_downloads
   service = Analytics::AnalyticsService.new
   service.authorization = Google::Auth.get_application_default(SCOPES)

   result = service.get_ga_data("ga:110869796", "2010-10-01", "today", "ga:totalEvents", dimensions: "ga:eventLabel")
   result.rows.reduce(Hash.new) do |hash, (label, total_events)|
     hash.merge(label => total_events)
   end
  end
end
