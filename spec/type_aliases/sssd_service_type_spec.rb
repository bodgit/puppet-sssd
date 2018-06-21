require 'spec_helper'

describe 'SSSD::Type' do
  it { is_expected.to allow_values('nss', 'pam', 'sudo', 'autofs', 'ssh', 'pac', 'ifp') }
  it { is_expected.not_to allow_value('invalid') }
end
