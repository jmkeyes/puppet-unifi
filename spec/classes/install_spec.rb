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
    it { should contain_apt__pin('unifi') }
    it { should contain_apt__source('unifi') }
    it { should contain_package('unifi') }
  end
end
