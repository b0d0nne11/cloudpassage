require 'chefspec'

describe 'cloudpassage::default' do
  let(:chef_run) { ChefSpec::Runner.new }

  it 'installs cphalo' do
    chef_run.converge(described_recipe)
    expect(chef_run).to install_package('cphalo').with(version: nil)
  end

  it 'installs cphalo version 1.0.0-1' do
    chef_run.node.set['cloudpassage']['version'] = '1.0.0-1'
    chef_run.converge(described_recipe)
    expect(chef_run).to install_package('cphalo').with(version: '1.0.0-1')
  end

  it 'installs or updates cphalo' do
    chef_run.node.set['cloudpassage']['version'] = :latest
    chef_run.converge(described_recipe)
    expect(chef_run).to upgrade_package('cphalo').with(version: nil)
  end
end
