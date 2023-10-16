# spec/whenever_spec.rb
require 'spec_helper'

describe 'Schedule' do
  before do
    load 'Rakefile' # Makes sure rake tasks are loaded so you can assert in rake jobs
  end

  it 'has a rake task that runs every week' do
    schedule = Whenever::Test::Schedule.new(file: 'config/schedule.rb')
    task_name = schedule.jobs[:rake].first[:task]
    expect(task_name).to include('vacate_searches:vacate')
  end
end
