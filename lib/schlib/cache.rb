# frozen_string_literal: true
require 'json'

module Schlib
  class Cache
    def initialize(cache_file = '/tmp/schlib_cache.tmp')
      @cache_file = cache_file
    end

    def cache(cache_key)
      mutable_cache_data = data
      thing = mutable_cache_data[cache_key] ||= yield
      File.write cache_file, JSON.dump(mutable_cache)
      thing
    end

    def data
      File.write cache_file, Marshal.dump({}) unless File.exist? cache_file
      JSON.parse File.read cache_file
    end

    private

    attr_reader :cache_file
  end
end
