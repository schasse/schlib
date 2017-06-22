# frozen_string_literal: true

require 'spec_helper'
require 'schlib/command'

RSpec.describe Schlib::Command do
  let(:c) { Schlib::Command.new }

  it 'returns the output of the command' do
    expect(c.run('ls lib/')).to eq "schlib\n"
  end

  it 'raises an error when exitcode is approved' do
    expect { c.run('wtf', approve_exitcode: true) }
      .to raise_exception ScriptError
  end
end
