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
  $master_match = $profiles.match('Master')
  $datbase_match = $profiles.match('Database')
  if  $master_match[0] != undef {
#  notify {"i have the master profile":}
    include influxdb::profile::toml
  } elsif $datbase_match[0]  != undef {
 # notify {"i have the database profile":}
   include puppet_operational_dashboards::profile::postgres_access
  }
}
