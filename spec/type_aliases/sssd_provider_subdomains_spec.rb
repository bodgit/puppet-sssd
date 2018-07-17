require 'spec_helper'

describe 'SSSD::Provider::Subdomains' do
  it { is_expected.to allow_values('ipa', 'ad', 'none') }
  it { is_expected.not_to allow_value('invalid') }
end
