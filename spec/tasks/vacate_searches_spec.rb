require 'timecop'

RSpec.describe "Vacate Searches", :type => :task do

  context "vacate_searches:vacate" do

    before do
      # Freeze time as task is time-sensitive
      Timecop.freeze Time.now
    end

    after { Timecop.return }

    it "deletes searches older than 1 week" do
      create(:search, created_at: 2.week.ago)
      expect { invoke_task }.to change { Search.count }.by(-1)
    end

    it "does not delete newer searches" do
      create(:search, created_at: 2.days.ago)
      expect { invoke_task }.not_to change { Search.count }
    end

    private

    def invoke_task
      task = Rake::Task["vacate_searches:vacate"]
      # Ensure task is re-enabled, as rake tasks by default are disabled
      # after running once within a process http://pivotallabs.com/how-i-test-rake-tasks/
      task.reenable
      task.invoke
    end

  end


end
