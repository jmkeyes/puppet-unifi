describe 'unifi::setting' do
  describe 'with default parameters'  do
    let (:pre_condition) { 'include ::unifi' }

    let (:facts) do
      {
        :operatingsystem => 'Debian',
        :lsbdistid       => 'Debian',
        :osfamily        => 'Debian',
      }
    end
  end
end
