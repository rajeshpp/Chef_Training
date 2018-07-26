name "base"
description "Base server Role"
run_list "recipe[ntp]","recipe[motd]","recipe[users]"
