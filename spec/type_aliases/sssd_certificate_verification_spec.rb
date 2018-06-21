require 'spec_helper'

describe 'SSSD::Certificate::Verification' do
  it { is_expected.to allow_value('no_ocsp') }
  it { is_expected.to allow_value('no_verification') }
  it { is_expected.to allow_value(['ocsp_default_responder', 'test']) }
  it { is_expected.to allow_value(['ocsp_default_responder_signing_cert', 'test']) }
  it { is_expected.not_to allow_value('invalid') }
end
