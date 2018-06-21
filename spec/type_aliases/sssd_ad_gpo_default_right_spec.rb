require 'spec_helper'

describe 'SSSD::AD::GPO::Default::Right' do
  it { is_expected.to allow_values('interactive', 'remote_interactive', 'network', 'batch', 'service', 'permit', 'deny') }
  it { is_expected.not_to allow_value('invalid') }
end
