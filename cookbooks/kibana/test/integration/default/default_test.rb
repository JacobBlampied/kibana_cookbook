# # encoding: utf-8

# Inspec test for recipe kibana::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe service 'kibana' do
  it {should be_running}
  it {should be_enabled}
end

describe port(5601) do
  it {should be_listening}
end
