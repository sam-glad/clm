class ScraperWorker
  include Sidekiq::Worker

  def perform(search_id)
    Search.find(search_id).update_results
  end
end
