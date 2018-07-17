require 'spec_helper'

describe 'SSSD::Search::Base' do
  it { is_expected.to allow_value('dc=example,dc=com') }
  it { is_expected.to allow_value('dc=example,dc=com?subtree?') }
  it { is_expected.to allow_value('cn=host_specific,dc=example,dc=com?subtree?(host=thishost)?dc=example.com?subtree?') }
  it { is_expected.not_to allow_value('invalid') }
  it { is_expected.not_to allow_value(123) }
end
