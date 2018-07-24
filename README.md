# Chef_Training
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
5. Refer node-creation.md file

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
7. Link node and apache
    PS D:\Rajesh_Ruby\Chef_Training\chef-repo\cookbooks> knife node run_list add node1-unbuntu "recipe[apache]"
    node1-unbuntu:
      run_list: recipe[apache]
8. On node run below command to pull the changes manually:
    root@ip-172-31-1-105:~# chef-client


Day 3 - 07/25/2018
=======================
Morning Session:
====================
Afternoon Session:
====================


Day 4 - 07/26/2018
=======================
Morning Session:
====================
Afternoon Session:
====================
