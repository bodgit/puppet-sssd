require 'spec_helper'

describe 'validate_sssd_search_base' do
  it { expect { should run.with_params(123) }.to raise_error(/Requires either an array or string to work with/) }
  it { expect { should run.with_params([123]) }.to raise_error(/Requires either an array or string to work with/) }
  it { expect { should run.with_params([]) }.to raise_error(/Requires an array with at least 1 element/) }
  it { expect { should run.with_params('invalid') }.to raise_error(/is not a valid SSSD search base/) }
  it { expect { should run.with_params('invalid?subtree?') }.to raise_error(/is not a valid SSSD search base/) }
  it { expect { should run.with_params('dc=example,dc=com?invalid?') }.to raise_error(/is not a valid SSSD search base/) }
  it { expect { should run.with_params('dc=example,dc=com?subtree?invalid') }.to raise_error(/is not a valid SSSD search base/) }
  it { expect { should run.with_params(['invalid']) }.to raise_error(/is not a valid SSSD search base/) }
  it { should run.with_params('dc=example,dc=com') }
  it { should run.with_params('dc=example,dc=com?subtree?') }
  it { should run.with_params('cn=host_specific,dc=example,dc=com?subtree?(host=thishost)?dc=example.com?subtree?') }
  it {
    should run.with_params([
      'dc=example,dc=com',
      'dc=example,dc=com?subtree?',
      'cn=host_specific,dc=example,dc=com?subtree?(host=thishost)?dc=example.com?subtree?',
    ])
  }
end
