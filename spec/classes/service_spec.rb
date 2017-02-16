describe 'unifi::service' do
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
    it { should create_class('unifi::service') }
    it { should contain_service('unifi') }
  end
end
