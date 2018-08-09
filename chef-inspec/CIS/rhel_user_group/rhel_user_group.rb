control "CIS 1-5-1" do
  impact 1.0
  title "1.5.1 Set User/Group Owner on /etc/grub.conf (Scored)"
  desc "Set the owner and group of /etc/grub.conf to the root user."
  describe command('stat -L -c "%u %g" /etc/grub.conf') do
    its('stdout') { should match '0 0' }
  end
  describe file('/etc/grub.conf') do
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
  end
end
