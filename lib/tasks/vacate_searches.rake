namespace :vacate_searches do
  desc 'Vacate week-old searches'
  task vacate: :environment do
    Search.where('created_at < ?', (Date.today - 7.days)).destroy_all
  end
end
