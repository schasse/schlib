# frozen_string_literal: true

require 'spec_helper'
require 'schlib/cache'

RSpec.describe Schlib::Cache do
  let(:c) { Schlib::Cache.new }
  after { c.clear }

  it 'is possible to cache an integer' do
    expect(c.cache(:my_int) { 10 }).to eq 10
  end

  it 'persists a value for a cache key' do
    expect(c.cache(:my_int) { 10 }).to eq(c.cache(:my_int) { 20 })
  end
end
