require 'pxp-agent/config_helper.rb'
require 'pxp-agent/test_helper.rb'

test_name 'just restart broker'

step 'On master, stop then restart the broker' do
  kill_pcp_broker(master)
  run_pcp_broker(master)
end

step 'On each agent, test that a 2nd association has occurred' do
  show_pcp_logs_on_failure do
    agents.each_with_index do |agent|
      assert(is_not_associated?(master, "pcp://#{agent}/agent"),
             "Agent identity pcp://#{agent}/agent for agent host #{agent} does not appear in pcp-broker's client inventory")
    end
  end
end
