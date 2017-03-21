describe 'unifi::install' do
  let (:facts) do
    {
      :operatingsystem => 'Debian',
      :lsbdistid       => 'Debian',
      :osfamily        => 'Debian',
    }
  end

  describe 'with default parameters' do
    let (:pre_condition) { 'include ::unifi' }

    it { should compile.with_all_deps }
    it { should create_class('unifi::install') }
    it { should contain_apt__key('unifi') }
    it { should contain_apt__pin('unifi').that_requires('Apt::Key[unifi]') }
    it { should contain_apt__source('unifi').that_requires('Apt::Key[unifi]').that_comes_before('Package[unifi]') }
    it { should contain_package('unifi') }
  end
end
