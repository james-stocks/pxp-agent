require 'pxp-agent/config_helper.rb'
require 'pxp-agent/test_helper.rb'

test_name 'just restart broker'

step 'On master, stop then restart the broker' do
  kill_pcp_broker(master)
  run_pcp_broker(master)
end

step 'Perform an inventory_request' do
  assert(is_not_associated?(master, "pcp://example.com/agent"),
        "Agent identity pcp://#{agent}/agent for agent host #{agent} does not appear in pcp-broker's client inventory")
end
