ls -ltr
dpkg -s auditd | grep Status
yum install -y auditd
uname -a
apt-get install -y auditd
dpkg -s auditd | grep Status
inspec help
inspec version
inspec detect
cd /root
ls -ltr
git clone https://github.com/learn-chef/auditd.git
ls -ltr
tree auditd/
cat auditd/controls/example.rb 
xat auditd/inspec.yml
cat auditd/inspec.yml
cat auditd/inspec.lock 
ls -ltr
inspec exec auditd/
inspec exec root/auditd/
inspec exec /root/auditd/
inspec exec auditd -t ssh://root:password@target
inspec exec auditd -t ssh://root:password@target --reporter=json | jq .
inspec check auditd
pwd
inspec archive auditd
ls -ltr
inspec archive auditd
inspec exec auditd-0.1.0.tar.gz -t ssh://root:password@target
inspec exec https://github.com/learn-chef/auditd/releases/download/v0.1.0/auditd-0.1.0.tar.gz -t ssh://root:password@target
inspec supermarket profiles
inspec supermarket info dev-sec/linux-baseline
inspec supermarket exec dev-sec/linux-baseline -t ssh://root:password@target
inspec exec https://github.com/dev-sec/linux-baseline -t ssh://root:password@target
inspec exec https://github.com/dev-sec/linux-baseline -t ssh://root:password@target | grep -A 7 package-08
inspec exec https://github.com/dev-sec/linux-baseline -t ssh://root:password@target --controls package-08
ls -tlr
exit
