module ProfilerConcern
  extend ActiveSupport::Concern
  included do
    before_action :profiler_authorize_request
  end

  def profiler_authorize_request
    Rack::MiniProfiler.authorize_request if Rails.env.profile?
  end

end
