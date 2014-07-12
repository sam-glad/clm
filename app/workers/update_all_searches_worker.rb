class UpdateAllSearchesWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { daily }

  def perform
    Search.pluck(:ids).each do |search_id|
      time_to_perform = rand(800..1400).minutes.from_now.from_now
      ScraperWorker.perform_at(time_to_perform, search_id)
    end
  end
end
