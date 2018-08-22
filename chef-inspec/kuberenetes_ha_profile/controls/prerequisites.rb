#
# Profile:: kubernetes_ha_profile
# File:: prerequisites.rb
#
# Version 1: Rajesh Paleru - Aug-2018.

#######################################################
### OS configuration
#######################################################

# SELinux
control 'SELnux should be disabled' do
    impact 1.0
    #title 'so ensure SELinux is not working.'
    #desc 'It should make sure SELinux mode is "Disabled".'
    only_if { os.redhat? }
    describe command 'getenforce' do
      it { should exist }
      its('stdout') { should match /Disabled/ }
    end

    describe command('selinuxenabled') do
        its('exist?') { should be true }
        its('exit_status') { should_not eq 0 }
    end
end


# Stop & disable firewalld
control 'firewalld should be stoped & disabled' do
    impact 1.0
    describe firewalld do
        it { should_not be_running }
    end
end

# Swap off : Need some inputs here.
control 'File "/etc/fstab" should not contain any "uncommented" lines with the string "swap"' do
    describe bash('cat /etc/fstab|grep swap|grep -v ^#|wc -l') do
        its('stdout.strip.to_i') { should cmp 0 }
    end
end

#######################################################
### Kubernetes requirement
#######################################################

control 'Details of the file "/etc/sysctl.d/k8s.conf"' do
    describe file('/etc/sysctl.d/k8s.conf') do
        its('owner') { should eq 'root' }
        its('group') { should eq 'root' }
        its('mode') { should cmp '0644' }
    end
end

# Check if, kubernetes repo created
control 'Checking if, enabled, gpgcheck, repo_gpgcheck values are true for kubernetes repo' do
    describe command('cat /etc/yum.repos.d/kubernetes.repo|egrep "^enabled|^gpgcheck|^repo_gpgcheck"') do
        its('stdout') { should match 'enabled=1' }
        its('stdout') { should match 'gpgcheck=1' }
        its('stdout') { should match 'repo_gpgcheck=1' }
    end
    describe yum.repo("kubernetes") do
        it { should exist }
        it { should be_enabled }
    end
end


# check if kubectl installed
control 'Check if kubectl installed' do    
    describe command('kubectl version') do
        its('stdout') { should match 'Client Version:' }   
    end
end

# check if kubelet installed
control 'Check if kubelet installed' do    
    describe command('kubelet --version') do
        its('stdout') { should match 'Kubernetes v' }   
    end
end

# check if kubeadm installed
control 'Check if kubeadm installed' do    
    describe command('kubeadm version') do
        its('stdout') { should match 'kubeadm version:' }   
    end
end

control 'Details of the file "/etc/systemd/system/kubelet.service.d/10-kubeadm.conf"' do
    describe file('/etc/systemd/system/kubelet.service.d/10-kubeadm.conf') do
        its('owner') { should eq 'root' }
        its('group') { should eq 'root' }
        its('mode') { should cmp '0744' }
    end
end

#Check kubelet status : Need some inputs here.
control 'Check if kubelet service is running' do
    describe service 'kubelet' do
        it { should be_enabled }
    end
end

control 'Details of the directory "/etc/k8s_secrets"' do
    describe directory('/etc/k8s_secrets') do
        its('owner') { should eq 'root' }
        its('group') { should eq 'root' }
        its('mode') { should cmp '0700' }
    end
end