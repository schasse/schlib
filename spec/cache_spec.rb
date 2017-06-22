# frozen_string_literal: true

require 'spec_helper'
require 'schlib/cache'

RSpec.describe Schlib::Cache do
  let(:c) { Schlib::Cache.new }
  after { c.clear }

  describe '#cache' do
    it 'is possible to cache an integer' do
      expect(c.cache(:my_int) { 10 }).to eq 10
    end

    it 'persists a value for a cache key' do
      expect(c.cache(:my_int) { 10 }).to eq(c.cache(:my_int) { 20 })
    end
  end

  describe '#reset' do
    it 'deletes a single cache entry' do
      cache = c.cache(:my_int) { 10 }
      expect(c.cache(:my_int) { 20 }).to eq cache
      c.reset(:my_int)
      expect(c.cache(:my_int) { 20 }).to eq 20
    end
  end
end
