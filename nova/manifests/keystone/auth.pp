# == Class: nova::keystone::auth
#
# Creates nova endpoints and service account in keystone
#
# === Parameters:
#
# [*password*]
#   Password to create for the service user
#
# [*auth_name*]
#   (optional) The name of the nova service user
#   Defaults to 'nova'
#
# [*auth_name_v3*]
#   (optional) The name of the nova v3 service user
#   Defaults to 'novav3'
#
# [*service_name*]
#   (optional) Name of the service.
#   Defaults to the value of auth_name, but must differ from the value
#   of service_name_v3.
#
# [*service_name_v3*]
#   (optional) Name of the v3 service.
#   Defaults to the value of auth_name_v3, but must differ from the value
#   of service_name.
#
# [*service_description*]
#   (optional) Description for keystone service.
#   Defaults to 'Openstack Compute Service'.
#
# [*service_description_v3*]
#   (optional) Description for keystone v3 service.
#   Defaults to 'Openstack Compute Service v3'.
#
# [*service_description_ec2*]
#   (optional) DEPRECATED. Description for keystone ec2 service.
#   Defaults to undef.
#
# [*public_url*]
#   (optional) The endpoint's public url. (Defaults to 'http://127.0.0.1:8774/v2/%(tenant_id)s')
#   This url should *not* contain any version or trailing '/'.
#
# [*internal_url*]
#   (optional) The endpoint's internal url. (Defaults to 'http://127.0.0.1:8774/v2/%(tenant_id)s')
#   This url should *not* contain any version or trailing '/'.
#
# [*admin_url*]
#   (optional) The endpoint's admin url. (Defaults to 'http://127.0.0.1:8774/v2/%(tenant_id)s')
#   This url should *not* contain any version or trailing '/'.
#
# [*public_url_v3*]
#   (optional) The v3 endpoint's public url. (Defaults to 'http://127.0.0.1:8774/v3')
#   This url should *not* contain any version or trailing '/'.
#
# [*internal_url_v3*]
#   (optional) The v3 endpoint's internal url. (Defaults to 'http://127.0.0.1:8774/v3')
#   This url should *not* contain any version or trailing '/'.
#
# [*admin_url_v3*]
#   (optional) The v3 endpoint's admin url. (Defaults to 'http://127.0.0.1:8774/v3')
#   This url should *not* contain any version or trailing '/'.
#
# [*ec2_public_url*]
#   (optional) DEPRECATED. The endpoint's public url for EC2.
#   Defaults to undef
#
# [*ec2_internal_url*]
#   (optional) DEPRECATED. The endpoint's internal url for EC2.
#   Defaults to undef
#
# [*ec2_admin_url*]
#   (optional) DEPRECATED. The endpoint's admin url for EC2.
#   Defaults to undef
#
# [*region*]
#   (optional) The region in which to place the endpoints
#   Defaults to 'RegionOne'
#
# [*tenant*]
#   (optional) The tenant to use for the nova service user
#   Defaults to 'services'
#
# [*email*]
#   (optional) The email address for the nova service user
#   Defaults to 'nova@localhost'
#
# [*configure_ec2_endpoint*]
#   (optional) DEPRECATED. Whether to create an ec2 endpoint
#   Defaults to undef
#
# [*configure_endpoint*]
#   (optional) Whether to create the endpoint.
#   Defaults to true
#
# [*configure_endpoint_v3*]
#   (optional) Whether to create the v3 endpoint.
#   Defaults to true
#
# [*configure_user*]
#   (optional) Whether to create the service user.
#   Defaults to true
#
# [*configure_user_role*]
#   (optional) Whether to configure the admin role for the service user.
#   Defaults to true
#
# [*compute_version*]
#   (optional) DEPRECATED: Use public_url, internal_url and admin_url OR
#   public_url_v3, internal_url_v3 and admin_url_v3 instead.
#   The version of the compute api to put in the endpoint. (Defaults to v2)
#   Setting this parameter overrides public_url, internal_url and admin_url parameters.
#
# [*compute_port*]
#   (optional) DEPRECATED: Use public_url, internal_url and admin_url instead.
#   Port for endpoint. (Defaults to 9696)
#   Setting this parameter overrides public_url, internal_url and admin_url parameters.
#
# [*ec2_port*]
#   (optional) DEPRECATED. The port to use for the ec2 endpoint.
#   Defaults to undef
#
# [*public_protocol*]
#   (optional) DEPRECATED: Use public_url instead.
#   Protocol for public endpoint. (Defaults to 'http')
#   Setting this parameter overrides public_url parameter.
#
# [*public_address*]
#   (optional) DEPRECATED: Use public_url instead.
#   Public address for endpoint. (Defaults to '127.0.0.1')
#   Setting this parameter overrides public_url parameter.
#
# [*internal_protocol*]
#   (optional) DEPRECATED: Use internal_url instead.
#   Protocol for internal endpoint. (Defaults to 'http')
#   Setting this parameter overrides internal_url parameter.
#
# [*internal_address*]
#   (optional) DEPRECATED: Use internal_url instead.
#   Internal address for endpoint. (Defaults to '127.0.0.1')
#   Setting this parameter overrides internal_url parameter.
#
# [*admin_protocol*]
#   (optional) DEPRECATED: Use admin_url instead.
#   Protocol for admin endpoint. (Defaults to 'http')
#   Setting this parameter overrides admin_url parameter.
#
# [*admin_address*]
#   (optional) DEPRECATED: Use admin_url and ec2_admin_url instead.
#   Admin address for endpoint. (Defaults to '127.0.0.1')
#   Setting this parameter overrides admin_url parameter.
#
class nova::keystone::auth(
  $password,
  $auth_name               = 'nova',
  $auth_name_v3            = 'novav3',
  $service_name            = undef,
  $service_name_v3         = undef,
  $service_description     = 'Openstack Compute Service',
  $service_description_v3  = 'Openstack Compute Service v3',
  $region                  = 'RegionOne',
  $tenant                  = 'services',
  $email                   = 'nova@localhost',
  $public_url              = 'http://127.0.0.1:8774/v2/%(tenant_id)s',
  $internal_url            = 'http://127.0.0.1:8774/v2/%(tenant_id)s',
  $admin_url               = 'http://127.0.0.1:8774/v2/%(tenant_id)s',
  $public_url_v3           = 'http://127.0.0.1:8774/v3',
  $internal_url_v3         = 'http://127.0.0.1:8774/v3',
  $admin_url_v3            = 'http://127.0.0.1:8774/v3',
  $configure_endpoint      = true,
  $configure_endpoint_v3   = true,
  $configure_user          = true,
  $configure_user_role     = true,
  # DEPRECATED PARAMETERS
  $compute_version         = undef,
  $compute_port            = undef,
  $ec2_port                = undef,
  $public_protocol         = undef,
  $public_address          = undef,
  $admin_protocol          = undef,
  $admin_address           = undef,
  $internal_protocol       = undef,
  $internal_address        = undef,
  $service_description_ec2 = undef,
  $ec2_public_url          = undef,
  $ec2_internal_url        = undef,
  $ec2_admin_url           = undef,
  $configure_ec2_endpoint  = undef,
) {

  include ::nova::deps

  if $compute_version {
    warning('The compute_version parameter is deprecated, use public_url, internal_url and admin_url instead.')
  }

  if $compute_port {
    warning('The compute_port parameter is deprecated, use public_url, internal_url and admin_url instead.')
  }

  if $ec2_port or $service_description_ec2 or $ec2_public_url or $ec2_internal_url or $ec2_admin_url or $configure_ec2_endpoint {
    warning('ec2_port, service_description_ec2, ec2_public_url, ec2_internal_url, ec2_admin_url and configure_ec2_endpoint are deprecated and have no effect..')
  }

  if $public_protocol {
    warning('The public_protocol parameter is deprecated, use public_url instead.')
  }

  if $internal_protocol {
    warning('The internal_protocol parameter is deprecated, use internal_url instead.')
  }

  if $admin_protocol {
    warning('The admin_protocol parameter is deprecated, use admin_url instead.')
  }

  if $public_address {
    warning('The public_address parameter is deprecated, use public_url instead.')
  }

  if $internal_address {
    warning('The internal_address parameter is deprecated, use internal_url instead.')
  }

  if $admin_address {
    warning('The admin_address parameter is deprecated, use admin_url instead.')
  }


  # TODO(mmagr): change default service names according to default_catalog in next (M) cycle
  if $service_name == undef {
    $real_service_name = $auth_name
    warning('Note that service_name parameter default value will be changed to "Compute Service" (according to Keystone default catalog) in a future release. In case you use different value, please update your manifests accordingly.')
  } else {
    $real_service_name = $service_name
  }

  if $service_name_v3 == undef {
    $real_service_name_v3 = $auth_name_v3
    warning('Note that service_name_v3 parameter default value will be changed to "Compute Service v3" (according to Keystone default catalog) in a future release. In case you use different value, please update your manifests accordingly.')
  } else {
    $real_service_name_v3 = $service_name_v3
  }

  if $real_service_name == $real_service_name_v3 {
    fail('nova::keystone::auth parameters service_name and service_name_v3 must be different.')
  }

  if ($public_protocol or $public_address or $compute_port) {
    $public_url_real = sprintf('%s://%s:%s/%s/%%(tenant_id)s',
      pick($public_protocol, 'http'),
      pick($public_address, '127.0.0.1'),
      pick($compute_port, '8774'),
      pick($compute_version, 'v2'))
  } else {
    $public_url_real = $public_url
  }

  if ($internal_protocol or $internal_address or $compute_port) {
    $internal_url_real = sprintf('%s://%s:%s/%s/%%(tenant_id)s',
      pick($internal_protocol, 'http'),
      pick($internal_address, '127.0.0.1'),
      pick($compute_port, '8774'),
      pick($compute_version, 'v2'))
  } else {
    $internal_url_real = $internal_url
  }

  if ($admin_protocol or $admin_address or $compute_port) {
    $admin_url_real = sprintf('%s://%s:%s/%s/%%(tenant_id)s',
      pick($admin_protocol, 'http'),
      pick($admin_address, '127.0.0.1'),
      pick($compute_port, '8774'),
      pick($compute_version, 'v2'))
  } else {
    $admin_url_real = $admin_url
  }

  if $configure_endpoint {
    Keystone_endpoint["${region}/${real_service_name}::compute"] ~> Service <| name == 'nova-api' |>
  }

  keystone::resource::service_identity { "nova service, user ${auth_name}":
    configure_user      => $configure_user,
    configure_user_role => $configure_user_role,
    configure_endpoint  => $configure_endpoint,
    service_type        => 'compute',
    service_description => $service_description,
    service_name        => $real_service_name,
    region              => $region,
    auth_name           => $auth_name,
    password            => $password,
    email               => $email,
    tenant              => $tenant,
    public_url          => $public_url_real,
    admin_url           => $admin_url_real,
    internal_url        => $internal_url_real,
  }

  keystone::resource::service_identity { "nova v3 service, user ${auth_name_v3}":
    configure_user      => false,
    configure_user_role => false,
    configure_endpoint  => $configure_endpoint_v3,
    configure_service   => $configure_endpoint_v3,
    service_type        => 'computev3',
    service_description => $service_description_v3,
    service_name        => $real_service_name_v3,
    region              => $region,
    auth_name           => $auth_name_v3,
    public_url          => $public_url_v3,
    admin_url           => $admin_url_v3,
    internal_url        => $internal_url_v3,
  }
}
