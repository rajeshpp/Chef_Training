control "RHEL-RLS-1" do
  impact 1.0
  title "1.2.1 Verify RHEL GPG Key is Installed (Scored)"
  desc "RHEL cryptographically signs updates with a GPG key to verify that they are valid."
  describe command('rpm -q --queryformat "%{SUMMARY}\n" gpg-pubkey') do
   its('stdout') { should match /release key 2/}
  end
end

