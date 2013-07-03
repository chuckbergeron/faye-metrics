class FayeMetrics

  attr_reader :faye_rack_adapter

  def initialize(app, faye_rack_adapter)
    @app   = app
    @stats = {
      clients_connected: 0
    }
    @faye_rack_adapter = faye_rack_adapter

    bind(:handshake)  { @stats[:clients_connected] += 1}
    bind(:disconnect) { @stats[:clients_connected] -= 1}
  end

  # Right now, this fires for all HTTP calls (favicon.ico, application.css, etc.) :(
  def call(env)
    request = Rack::Request.new(env)
    info = process_info

    @stats.merge!({
      pid:    info[0],
      cpu:    info[1],
      memory: formatted_memory(info[2]),
      time:   formatted_time
    })

    info.each { |v| puts "#{v}" }

    env['stats'] = @stats

    @app.call(env)
  end

  private

    def bind(type, &block)
      faye_rack_adapter.bind(type) do
        yield
      end
    end

    # This is the current process & it's memory usage (ie. thin)
    def process_info
      `ps ax -o pid,%cpu,rss | grep -E "^[[:space:]]*#{$$}"`.strip.split
    end

    def formatted_memory(memory)
      (memory.to_i / 1000)
    end

    # Only use the hours and minutes
    def formatted_time
      lstart = `ps ax -o pid,lstart | grep -E "^[[:space:]]*#{$$}"`

      seconds = (Time.now - Time.parse(lstart)).to_i

      binding.pry

      minutes = seconds / 60
      hours   = minutes / 60
      days    = hours   / 24

      formatted = elapsed_seconds
      # "#{formatted[0]}h#{formatted[1]}m"
    end

end
