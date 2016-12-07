# Proper module documentation
# goes here
class rootsecret::apply {

  $myhieralookup = "rootpw::${::hostname}"

  $secret = hiera($myhieralookup, DEFAULTHASHGOESHERE)
#  $secret = hiera('rootpw::rootca', CertificateHieraLookupFailed)
#  $secret = hiera('rootpw::systems-webdev', DEFAULTHASHGOESHERE)


#  uncomment for testing
#  notify { "${myhieralookup} <-- hostname": }
#  notify { "${secret} <--- secret pulled from hiera eyaml based on hostname": }

# fail2ban blocked me on test host because I was doing wonky stuff with ssh
#service { 'fail2ban':
#    ensure => 'stopped',
#  }


#change user to desired user who's password to manage
  user { 'johnsnow':
    ensure     => 'present',
    password   => $secret,
    managehome => true,
  }
  }
