# frozen_string_literal: true

module Schlib
  class Spinner
    def self.wait_for
      thread = create_spinner_thread
      value = yield
      thread.kill
      thread.join
      value
    end

    private_class_method

    def self.create_spinner_thread
      Thread.new do
        begin
          i = 0
          frames = %w[▁ ▃ ▅ ▆ ▇ █ ▇ ▆ ▅ ▃]
          loop do
            frame = frames[i % frames.size]
            print "\rLoading #{frame} ... "
            sleep 0.1
            i += 1
          end
        ensure
          print "\rLoading ▇ ... done\n\n"
        end
      end
    end
  end
end
