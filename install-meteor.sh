# check your environment
echo $(test -d /etc/pki/tls/certs)$?
#If the result is "1" than that is missing on your system. Try to solve:

# create missing directory
sudo mkdir -p /etc/pki/tls/certs

# link ca-certificates 
sudo ln -s /etc/ssl/certs/ca-certificates.crt /etc/pki/tls/certs/ca-bundle.crt

#After that just try to install meteor as documented
curl https://install.meteor.com/ | sh

