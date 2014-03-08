require 'spec_helper'

describe 'cloudpassage::default' do
  let(:chef_run) { ChefSpec::Runner.new }

  it 'creates the cloudpassage repository' do
    chef_run.converge(described_recipe)
    expect(chef_run).to add_apt_repository('cloudpassage')
  end

end
