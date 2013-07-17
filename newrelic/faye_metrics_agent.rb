#
# An abstracted interface layer for sending your Faye processes stats to NewRelic
#

require "newrelic_plugin"

module FayeMetricsAgent

  class Agent < NewRelic::Plugin::Agent::Base

    agent_guid "com.medeo.faye_metrics"
    agent_version "0.0.1"
    agent_config_options :hertz  # frequency of the periodic functions
    agent_human_labels("Faye Metrics Agent") { "development data" }

    def poll_cycle
      x = Time.now.to_f * hertz * Math::PI * 2
      report_metric "SIN",     "Value", Math.sin(x) + 1.0
    end

  end

  #
  # Register this agent with the component.
  #
  NewRelic::Plugin::Setup.install_agent :example, FayeMetricsAgent

  #
  # Launch the agent; this never returns.
  #
  NewRelic::Plugin::Run.setup_and_run

end
