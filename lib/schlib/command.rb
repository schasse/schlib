# frozen_string_literal: true

require 'English'

module Schlib
  class Command
    def initialize(logger = nil)
      @logger = logger
    end

    def run(command, approve_exitcode: false)
      logger&.debug command
      output = `#{command} 2>&1`
      logger&.debug output
      if approve_exitcode && !$CHILD_STATUS.success?
        raise ScriptError, 'COMMAND FAILED!'
      end
      output
    end

    private

    attr_reader :logger
  end
end
