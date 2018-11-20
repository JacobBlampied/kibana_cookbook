#
# Cookbook:: kibana
# Spec:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

describe package 'kibana' do
  it { should be_installed }
end

describe service 'kibana' do
  it {should be_running}
  it {should be_enabled}
end
