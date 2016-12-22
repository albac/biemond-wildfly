class Puppet::Provider::Wildfly < Puppet::Provider
  confine :feature => :puppet_x_wildfly_api_client

  def cli
    require 'puppet_x/wildfly/api_client'
    require 'puppet_x/wildfly/operation_request'

    timeout = @resource.parameters.include?(:timeout)? resource[:timeout] : 60

    api_client = PuppetX::Wildfly::APIClient.new(@resource[:host], @resource[:port], @resource[:username], @resource[:password], timeout)
    PuppetX::Wildfly::OperationRequest.new(api_client)
  end
end