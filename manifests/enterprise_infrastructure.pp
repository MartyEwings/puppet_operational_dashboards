# @summary Installs dependancies for Operational dashboards on PE infrastructure components
#
# When applied to an appropriate node group this class applies the toml gem and database access
# On appropriate infrastructure nodes in PE
#
# @example
#   include puppet_operational_dashboards::enterprise_infrastructure
# @param profiles
#   Array of PE profiles on the node with this class applied. 
class puppet_operational_dashboards::enterprise_infrastructure (
  Array[String] $profiles = puppet_operational_dashboards::pe_profiles_on_host(),
) {
    notify {"$profiles":}
  if   ('Puppet_enterprise::Profile::Master' in $profiles) {
  notify {"i have the master profile":}
    include influxdb::profile::toml
  } elsif  ('Puppet_enterprise::Profile::Database' in $profiles]) {
  notify {"i have the database profile":}
   include puppet_operational_dashboards::profile::postgres_access
  }
}
