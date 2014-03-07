require 'chefspec'

describe 'cloudpassage::default' do
  let(:chef_run) { ChefSpec::Runner.new }

  it 'enables and starts the cphalod service' do
    chef_run.converge(described_recipe)
    expect(chef_run).to enable_service('cphalod')
    expect(chef_run).to start_service('cphalod').with(
      start_command:   'service cphalod start   --daemon-key=CHANGE_ME',
      restart_command: 'service cphalod restart --daemon-key=CHANGE_ME',
    )
  end

end
