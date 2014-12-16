# == Class: nfs::client::service
#
# This Function exists to
#  1. manage the needed services for nfs clients
#
# === Parameters
#
# TODO: has to be filled
#
# === Examples
#
# TODO: has to be filled
#
#
# === Links
#
# * {Puppet Docs: Using Parameterized Classes}[http://j.mp/nVpyWY]
#
#
# === Authors
#
# * Daniel Klockenkämper <mailto:dk@marketing-factory.de>
#

class nfs::client::service {

  if $::nfs::nfs_v4 == true {
    nfs::functions::ensure_service { $::nfs::client_nfsv4_services:
      ensure     => $::nfs::client_service_ensure,
      enable     => $::nfs::client_service_enable,
      hasrestart => $::nfs::client_service_hasrestart,
      hasstatus  => $::nfs::client_service_hasstatus,
      subscribe  => [ Concat[$::nfs::exports_file], Augeas[$::nfs::idmapd_file] ]
      }
  } else {
    nfs::functions::ensure_service { $::nfs::client_services:
      ensure     => $::nfs::client_service_ensure,
      enable     => $::nfs::client_service_enable,
      hasrestart => $::nfs::client_services_hasrestart,
      hasstatus  => $::nfs::client_services_hasrestart,
      subscribe  => [ Concat[$::nfs::exports_file] ]
    }
  }
}
