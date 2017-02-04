# frozen_string_literal: true
require 'spec_helper'
require 'schlib/spinner'

RSpec.describe Schlib::Spinner do
  it 'returns the result of the block' do
    expect(Schlib::Spinner.wait_for { 1 }).to eq 1
  end
end
