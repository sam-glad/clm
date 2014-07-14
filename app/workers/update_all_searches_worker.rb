class UpdateAllSearchesWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { daily.hour_of_day(6) }

  def perform
    Search.find_each.each do |search|
      time_to_perform = Time.zone.now + rand(0.0..747.0).minutes
      search.update!(run_time: time_to_perform)
      ScraperWorker.perform_at(time_to_perform, search.id)
    end
  end
end
