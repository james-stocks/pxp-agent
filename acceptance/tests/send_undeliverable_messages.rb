require 'pxp-agent/test_helper.rb'

test_name 'try sending undeliverable messages' do

  step "Send an rpc_non_blocking_request to all agents" do
    target_identities = []
    agents.each do |agent|
      target_identities << "pcp://#{agent}/agent"
    end
    50.times do
      begin
        responses = rpc_fire_and_forget(master, target_identities,
                                        'pxp-module-puppet', 'run',
                                        {:env => [], :flags => ['--noop',
                                                                '--onetime',
                                                                '--no-daemonize']
                                        })
      rescue => exception
        fail("Exception occurred when trying to run Puppet on all agents: #{exception.message}")
      end
    end
  end # test step
end # test
