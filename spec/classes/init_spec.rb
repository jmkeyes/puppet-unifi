describe 'unifi' do
  context 'with Puppet <= 3.7.0' do
    let (:facts) do
      {
        :puppetversion => '3.6.0'
      }
    end

    it { should raise_error(Puppet::Error, /This module requires the use of Puppet v3.7.0 or newer./) }
  end

  context 'with default parameters' do
    let (:facts) do
      {
        :operatingsystem => 'Debian',
        :lsbdistid       => 'Debian',
        :osfamily        => 'Debian',
      }
    end

    it { should compile.with_all_deps }
    it { should create_class('unifi') }
    it { should contain_class('unifi::install').that_comes_before('Class[unifi::config]') }
    it { should contain_class('unifi::config').that_requires('Class[unifi::install]') }
    it { should contain_class('unifi::config').that_notifies('Class[unifi::service]') }
    it { should contain_class('unifi::service').that_subscribes_to('Class[unifi::config]') }
  end
end
