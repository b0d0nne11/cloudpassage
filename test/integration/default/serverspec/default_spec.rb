require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

describe 'repose::default' do

  it 'installs CloudPassage Halo' do
      expect(package('cphalo')).to be_installed
  end

  it 'starts the CloudPassage Halo service' do
     expect(service('cphalod')).to be_enabled
  end

end
