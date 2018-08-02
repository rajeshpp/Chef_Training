# Chef_Training

Docs shared by trainer: https://github.com/manikabedi/chef


Day 1- 07/23/2018
====================
morning Session:
====================
1. Ruby programming language introduction
2. Sample Ruby programs learned.

Afternoon Session:
====================
Continued on Ruby programming code examples

Day 2 - 07/24/2018
=======================
Morning Session:
====================
1. Introduction to Chef
    ==>Define the following:
        ===>Node, Resource, Recipe, Cookbook, RunList, Roles, Search, Chef Server, Chef development kit, knife, Solo, Zero
2. Oraganizations, Environments, Roles, Nodes
3. Configuration drift, OHAI, RUN List
4. CHEF setup 
    a. https://downloads.chef.io/chef-dk/
    b. https://www.chef.io/
    
 PS C:\Users\admin> knife --version
  Chef: 14.2.0
5. Refer """node-creation.md""" file

Afternoon Session:
====================
1. Chef and its dependencies are installed via an OS system specific package (omnibus installer)
2. Installation includes:
   a. The ruby language - used by chef
   b. knife - command line tool for admins
   c. Chef-client - Client app
   d. ohai - System profiler
3. root@ip-172-31-1-105:~# cat /etc/chef/client.rb
    log_level   :info
    chef_server_url  "https://api.chef.io/organizations/raj-org1"
    validation_client_name "chef-validator"
    log_location   STDOUT
    node_name "node1-unbuntu"
4. Created few chef recipes under chef-repo/cookbooks/my_recipes
5. Worked on cookbooks:
   
   -------------------------------------------
   PS D:\Rajesh_Ruby\Chef_Training\chef-repo\cookbooks\my_cookbooks> chef generate cookbook apache
    
    Generating cookbook apache
    - Ensuring correct cookbook file content
    - Ensuring delivery configuration
    - Ensuring correct delivery build cookbook content
    Your cookbook is ready. Type `cd apache` to enter it.

    There are several commands you can run to get started locally developing and testing your cookbook.
    Type `delivery local --help` to see a full list.

    Why not start by writing a test? Tests for the default recipe are stored at:

    test/integration/default/default_test.rb

    If you'd prefer to dive right in, the default recipe can be found at:

    recipes/default.rb
  -------------------------------------------
6. Upload created/modified cookbook to the Chef Server
    PS D:\Rajesh_Ruby\Chef_Training\chef-repo\cookbooks> knife cookbook upload apache
      Uploading apache       [0.1.0]
      Uploaded 1 cookbook.
7. Create run list
    PS D:\Rajesh_Ruby\Chef_Training\chef-repo\cookbooks> knife node run_list add node1-unbuntu "recipe[apache]"
    node1-unbuntu:
      run_list: recipe[apache]
8. On node run below command to pull the changes manually:
    root@ip-172-31-1-105:~# chef-client
9. Refer cookbooks folder for more cookbooks examples

Day 3 - 07/25/2018
=======================
Morning Session:
=======================
1. Started day with another cookbook for motd by using templates
2. pci compliance related cookbook added and added motd to depend on this.
3. apache cookbook enhanced for few new things.

Afternoon Session:
====================
1. Fixing of issues task given on apache2
2. Data Bags, Search, User data

    Users:
    PS D:\Rajesh_Ruby\Chef_Training\chef-repo> knife data_bag create users
    Created data_bag[users]
    PS D:\Rajesh_Ruby\Chef_Training\chef-repo> knife data_bag from file users bobo.json
        Updated data_bag_item[users::bobo]
    PS D:\Rajesh_Ruby\Chef_Training\chef-repo> knife data_bag from file users frank.json
        Updated data_bag_item[users::frank]
    
    Groups:
    PS D:\Rajesh_Ruby\Chef_Training\chef-repo> knife data_bag create groups
    Created data_bag[groups]
    PS D:\Rajesh_Ruby\Chef_Training\chef-repo> knife data_bag from file groups clowns.json
    Updated data_bag_item[groups::clowns]

    PS D:\Rajesh_Ruby\Chef_Training\chef-repo\cookbooks> chef generate cookbook users
    Generating cookbook users

    Upload role to the server:
    PS D:\Rajesh_Ruby\Chef_Training\chef-repo\roles> knife role from file .\webserver.rb
    Updated Role webserver


Day 4 - 07/26/2018
=======================
Morning Session:
====================
Best Practices:
1. Have 'base' roles
2. Chef super market

Afternoon Session:
====================
1. Preparing full cookbook
2. Installed awscli with the help of cookbook. Here is what done for that:


===================================

Before installing:
root@ip-172-31-11-17:/etc/selinux/default# aws s3 ls
The program 'aws' is currently not installed. You can install it by typing:
apt install awscli


cookbook downloaded:
cloudcli:
    Dependencies: poise-python ~> 1.6
        Dependencies: poise-languages ~> 2.0 & poise ~> 2.7
            Dependencies: poise-archive ~> 1.0 & poise ~> 2.5

    Then Upload=>add to run list==>chef-client

After Installing:
root@ip-172-31-11-17:/etc/selinux/default# aws s3 ls
Unable to locate credentials. You can configure credentials by running "aws configure".





MY Learning:
===========================================================

Step 1: Install Chef DK in workstation
Step 2: Get chef-repo into workstation by using the command: chef generate repo practice
Step 3: Create a sample recipe {Better put it in cookbooks/my_recipes folder for clear understanding}
Step 4: Run the sample recipe in local mode by using the command: chef-client --local-mode webserver.rb
Step 5: Now, its time to start with cookbooks:

    From cookbooks folder, run the command: chef generate cookbook learn_chef_httpd


    [root@ip-172-31-95-250 cookbooks]# pwd
    /root/chef/practice/Chef_Training/chef-repo/cookbooks


    [root@ip-172-31-95-250 cookbooks]# chef generate cookbook learn_chef_httpd
    Generating cookbook learn_chef_httpd
    - Ensuring correct cookbook file content
    - Ensuring delivery configuration
    - Ensuring correct delivery build cookbook content

    Your cookbook is ready. Type `cd learn_chef_httpd` to enter it.

    There are several commands you can run to get started locally developing and testing your cookbook.
    Type `delivery local --help` to see a full list.

    Why not start by writing a test? Tests for the default recipe are stored at:

    test/integration/default/default_test.rb

    If you'd prefer to dive right in, the default recipe can be found at:

    recipes/default.rb  


    [root@ip-172-31-95-250 cookbooks]# tree learn_chef_httpd
            learn_chef_httpd
            ├── Berksfile
            ├── CHANGELOG.md
            ├── chefignore
            ├── LICENSE
            ├── metadata.rb
            ├── README.md
            ├── recipes
            │   └── default.rb
            ├── spec
            │   ├── spec_helper.rb
            │   └── unit
            │       └── recipes
            │           └── default_spec.rb
            └── test
                └── integration
                    └── default
                        └── default_test.rb

            7 directories, 10 files


        Create a template:

        [root@ip-172-31-95-250 cookbooks]# pwd
            /root/chef/practice/Chef_Training/chef-repo/cookbooks
            [root@ip-172-31-95-250 cookbooks]# chef generate template learn_chef_httpd index.html
            Recipe: code_generator::template
            * directory[./learn_chef_httpd/templates] action create
                - create new directory ./learn_chef_httpd/templates
                - restore selinux security context
            * template[./learn_chef_httpd/templates/index.html.erb] action create
                - create new file ./learn_chef_httpd/templates/index.html.erb
                - update content in file ./learn_chef_httpd/templates/index.html.erb from none to e3b0c4
                (diff output suppressed by config)
                - restore selinux security context
            [root@ip-172-31-95-250 cookbooks]# tree learn_chef_httpd/
            learn_chef_httpd/
            ├── Berksfile
            ├── CHANGELOG.md
            ├── chefignore
            ├── LICENSE
            ├── metadata.rb
            ├── README.md
            ├── recipes
            │   └── default.rb
            ├── spec
            │   ├── spec_helper.rb
            │   └── unit
            │       └── recipes
            │           └── default_spec.rb
            ├── templates
            │   └── index.html.erb
            └── test
                └── integration
                    └── default
                        └── default_test.rb

            8 directories, 11 files


    ==>copy the contents of the HTML file from your recipe to the new HTML file, index.html.erb.

    ==>Updaterecipes/default.rb with below content:

        package 'httpd'

        service 'httpd' do
        action [:enable, :start]
        end

        template '/var/www/html/index.html' do
        source 'index.html.erb'
        end


    ==>Run the cookbook

    [root@ip-172-31-95-250 cookbooks]# pwd
        /root/chef/practice/Chef_Training/chef-repo/cookbooks
        [root@ip-172-31-95-250 cookbooks]# chef-client --local-mode --runlist 'recipe[learn_chef_httpd]'
        [2018-08-02T12:27:36+00:00] INFO: Started chef-zero at chefzero://localhost:1 with repository at /root/chef/practice/Chef_Training/chef-repo
        One version per cookbook


