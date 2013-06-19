class FayeMetrics

  attr_reader :faye_rack_adapter

  def initialize(app, options)
    @app = app
    @stats = {
      clients_connected: 0,
      pid: store_memory_usage[0],
      memory: store_memory_usage[1]
    }

    @faye_rack_adapter = options[:faye_rack_adapter]

    bind(:handshake)  { @stats[:clients_connected] += 1}
    bind(:disconnect) { @stats[:clients_connected] -= 1}

    store_memory_usage
  end

  def call(env)
    request = Rack::Request.new(env)

    env['stats'] = @stats

    @app.call(env)
  end

  private

    def bind(type, &block)
      faye_rack_adapter.bind(type) do
        yield
      end
    end

    def store_memory_usage
      pid, size = `ps ax -o pid,rss | grep -E "^[[:space:]]*#{$$}"`.strip.split.map(&:to_i)
    end

end
