node 'os-controller' {
  class { 'openstack::controller' :
    public_address 	    => "${ipaddress_eth0}",
    admin_email             => 'yfauser@vmware.com',
    admin_password          => 'OpenStack1!',
    rabbit_password         => 'OpenStack1!',
    keystone_db_password    => 'OpenStack1!',
    keystone_admin_token    => 'OpenStack1!',
    glance_db_password      => 'OpenStack1!',
    glance_user_password    => 'OpenStack1!',
    nova_db_password        => 'OpenStack1!',
    nova_user_password      => 'OpenStack1!',
    secret_key              => '12345',
    mysql_root_password     => 'OpenStack1!',
    quantum_user_password   => 'OpenStack1!',
    quantum_db_password     => 'OpenStack1!',
    public_interface        => 'eth0',
    internal_address        => "${ipaddress_eth0}",
    cinder                  => false,
    ovs_local_ip            => "${ipaddress_eth1}",
    bridge_interface        => 'eth2',
    metadata_shared_secret  => 'OpenStack1!',
  }
}
node /os-compute\d+/ {
class { 'openstack::compute' :   
    internal_address        => "${ipaddress_eth0}",
    nova_user_password      => 'OpenStack1!',
    rabbit_password         => 'OpenStack1!',
    nova_db_password        => 'OpenStack1!',
    db_host                 => '192.168.178.232',  # This is the address of your OS-Controller Node
    keystone_host           => '192.168.178.232',  # This is the address of your OS-Controller Node
    quantum_host            => '192.168.178.232',  # This is the address of your OS-Controller Node
    ovs_local_ip            => "${ipaddress_eth1}",
    rabbit_host             => '192.168.178.232',  # This is the address of your OS-Controller Node
    glance_api_servers      => '192.168.178.232',  # This is the address of your OS-Controller Node
    vncproxy_host           => '192.168.178.232',  # This is the address of your OS-Controller Node
    vncserver_listen        => "${ipaddress_eth1}",
    manage_volumes          => false,
  }    
}
