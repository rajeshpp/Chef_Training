PS D:\Rajesh_Ruby\Chef_Training\chef-repo> knife bootstrap 52.66.64.55 --ssh-user ubuntu --sudo --i
dentity-file .\chef.pem --node-name node1-unbuntu
Creating new client for node1-unbuntu
Creating new node for node1-unbuntu
Connecting to 52.66.64.55
52.66.64.55 -----> Installing Chef Omnibus (-v 14)
52.66.64.55 downloading https://omnitruck-direct.chef.io/chef/install.sh
52.66.64.55   to file /tmp/install.sh.2457/install.sh
52.66.64.55 trying wget...
52.66.64.55 ubuntu 16.04 x86_64
52.66.64.55 Getting information for chef stable 14 for ubuntu...
52.66.64.55 downloading https://omnitruck-direct.chef.io/stable/chef/metadata?v=14&p=ubuntu&pv=16.04&m=x86_64
52.66.64.55   to file /tmp/install.sh.2461/metadata.txt
52.66.64.55 trying wget...
52.66.64.55 sha1        845b83d65443c62b11911fc83a70d6cac282f7cd
52.66.64.55 sha256      f2578ed674189d4c303e5fece3faeb4c4a0117f5d29e5e050982a38fbaaad0e5
52.66.64.55 url https://packages.chef.io/files/stable/chef/14.3.37/ubuntu/16.04/chef_14.3.37-1_amd64.deb
52.66.64.55 version     14.3.37
52.66.64.55 downloaded metadata file looks valid...
52.66.64.55 downloading https://packages.chef.io/files/stable/chef/14.3.37/ubuntu/16.04/chef_14.3.37-1_amd64.deb
52.66.64.55   to file /tmp/install.sh.2461/chef_14.3.37-1_amd64.deb
52.66.64.55 trying wget...
52.66.64.55 Comparing checksum with sha256sum...
52.66.64.55 Installing chef 14
52.66.64.55 installing with dpkg...
52.66.64.55 Selecting previously unselected package chef.
(Reading database ... 51263 files and directories currently installed.)
52.66.64.55 Preparing to unpack .../chef_14.3.37-1_amd64.deb ...
52.66.64.55 Unpacking chef (14.3.37-1) ...
52.66.64.55 Setting up chef (14.3.37-1) ...
52.66.64.55 Thank you for installing Chef!
52.66.64.55 Starting the first Chef Client run...
52.66.64.55 Starting Chef Client, version 14.3.37
52.66.64.55 resolving cookbooks for run list: []
52.66.64.55 Synchronizing Cookbooks:
52.66.64.55 Installing Cookbook Gems:
52.66.64.55 Compiling Cookbooks...
52.66.64.55 [2018-07-24T06:56:41+00:00] WARN: Node node1-unbuntu has an empty run list.
52.66.64.55 Converging 0 resources
52.66.64.55
52.66.64.55 Running handlers:
52.66.64.55 Running handlers complete
52.66.64.55 Chef Client finished, 0/0 resources updated in 06 seconds