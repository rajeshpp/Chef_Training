#
# Profile:: kubernetes_ha_profile
# File:: minions.rb
#
# Version 1: Rajesh Paleru - Aug-2018.

#######################################################
### Files Details
#######################################################

kube_join_file='/etc/k8s_secrets/kubejoin.sh'
kubelet_bootstrap_file='/etc/kubernetes/bootstrap-kubelet.conf'

#Check scp yaml
control 'Copy kubejoin.sh to /etc/k8s_secrets from Master node, if it was not there already' do
    describe file kube_join_file do
        it { should exist }
        its('owner') { should eq 'root' }
        its('group') { should eq 'root' }
        its('type') { should eq :file }
    end
end

#Some PART PENDING
#kubeadm join (s5)
if file(kubelet_bootstrap_file).exist?
    control 'bootstrap-kubelet.conf already exist' do
        desc 'bootstrap-kubelet.conf already exist. So, no action will be taken.'
        describe file kubelet_bootstrap_file do
            it { should exist }
        end
    end
else
    control 'bootstrap-kubelet.conf NOT exist' do
        desc 'bootstrap-kubelet.conf NOT exist. So, action will be taken.'
        describe file kubelet_bootstrap_file do
            it { should_not exist }
        end
    end
end

