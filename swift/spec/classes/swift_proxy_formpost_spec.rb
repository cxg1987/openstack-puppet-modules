require 'spec_helper'

describe 'swift::proxy::formpost' do

  let :facts do
    {}
  end

  let :pre_condition do
    'concat { "/etc/swift/proxy-server.conf": }'
  end

  let :fragment_file do
    "/var/lib/puppet/concat/_etc_swift_proxy-server.conf/fragments/31_swift-proxy-formpost"
  end

  it { is_expected.to contain_file(fragment_file).with_content(/[filter:formpost]/) }
  it { is_expected.to contain_file(fragment_file).with_content(/use = egg:swift#formpost/) }

end
