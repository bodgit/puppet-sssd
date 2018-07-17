require 'spec_helper'

describe 'SSSD::Provider::HostID' do
  it { is_expected.to allow_values('ipa', 'none') }
  it { is_expected.not_to allow_value('invalid') }
end
