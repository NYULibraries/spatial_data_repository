# spec/whenever_spec.rb
require 'spec_helper'

describe 'Whenever Schedule' do
  before do
    load 'Rakefile' # Makes sure rake tasks are loaded so you can assert in rake jobs
  end

  it 'should have a rake task that runs every week' do
    schedule = Whenever::Test::Schedule.new(file: 'config/schedule.rb')
    task_name = schedule.jobs[:rake].first[:task]
    task_name.should include('vacate_searches:vacate')
  end
end
