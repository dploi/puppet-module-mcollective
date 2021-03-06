# This class provides parameters for all other classes in the mcollective 
# module.  This class should be inherited.
class mcollective::params {

  $mc_topicprefix       = '/topic/'
  $mc_main_collective   = 'mcollective'
  $mc_collectives       = ''
  $mc_logfile           = '/var/log/mcollective.log'
  $mc_loglevel          = 'info'
 
  # Default to daemonize, but on systems using upstart, dont daemonize
  $mc_daemonize         = $operatingsystem ? {
    /(?i-mx:ubuntu|debian)/ => $lsbdistrelease ? {
									/(?i-mx:11\.04|10\.10|10\.04)/ => '1',
									default => '0',
							   },
    default          => '1',
  }
 
  $mc_security_provider = 'psk'
  $mc_security_psk      = 'changemeplease'

  $nrpe_dir = $operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|oel)/ => '/etc/nrpe.d',
    default                            => '/etc/nagios/nrpe.d',
  }
  $mc_service_name = $operatingsystem ? {
    /(?i-mx:darwin)/ => 'com.puppetlabs.mcollective',
    default          => 'mcollective',
  }

  $mc_libdir = $operatingsystem ? {
    /(?i-mx:ubuntu|debian)/        => '/usr/share/mcollective/plugins',
    /(?i-mx:centos|fedora|redhat|FreeBSD)/ => '/usr/libexec/mcollective',
  }

  $plugin_base = "${mc_libdir}/mcollective"

  $plugin_subs = [
    "${plugin_base}/agent",
    "${plugin_base}/application",
    "${plugin_base}/audit",
    "${plugin_base}/connector",
    "${plugin_base}/facts",
    "${plugin_base}/registration",
    "${plugin_base}/security",
    "${plugin_base}/util",
  ]

  $client_config_owner  = '0'
  $client_config_group  = '0'
  $server_config_owner  = '0'
  $server_config_group  = '0'

  $stomp_user    = 'mcollective'
  $stomp_passwd  = 'secret'
  $stomp_server  = 'stomp'
  $stomp_port    = '61613'
  $stomp_ssl     = false

  $fact_source = 'yaml'
  $yaml_facter_source = "/etc/mcollective/facts.yaml"

  $server_ssl_server_public   = '/etc/mcollective/ssl/server.pem'
  $server_ssl_server_private  = '/etc/mcollective/ssl/server-private.pem'
  $server_ssl_client_cert_dir = '/etc/mcollective/ssl/clients/'

  $client_ssl_server_public   = '/etc/mcollective/ssl/server.pem'
  $client_ssl_client_private  = '/etc/mcollective/ssl/client-private.pem'
  $client_ssl_client_public   = '/etc/mcollective/ssl/client.pem'

  $policy_dir = '/etc/mcollective/policies/'

  $package_version = "installed"

  $client_config_file = "/etc/mcollective/client.cfg"
  $server_config_file = "/etc/mcollective/server.cfg"
  
  $pubkeypath = "/etc/mcollective/pubkeys/"
  
  $server_ssh_host_rsa_key = '/etc/ssh/ssh_host_rsa_key'
  
  $puppet_classes_file = '/var/lib/puppet/state/classes.txt'
}
