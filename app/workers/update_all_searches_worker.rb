class UpdateAllSearchesWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { daily.hour_of_day(6) }

  def perform
    Search.pluck(:id).each do |search_id|
      time_to_perform = rand(0.0..747.0).minutes.from_now
      ScraperWorker.perform_at(time_to_perform, search_id)
    end
  end
end
