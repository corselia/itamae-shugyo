execute 'Initial yum' do
  command 'yum update -y'
end

%w(wget curl zip unzip git vim expect).each do |pkg|
  package pkg do
    action :install
  end
end

# Preparation for building Ruby
%w(gcc bzip2 openssl-devel libyaml-devel libffi-devel readline-devel zlib-devel gdbm-devel ncurses-devel).each do |pkg|
  package pkg do
    action :install
  end
end

# Preparation for building Python
%w(gcc zlib-devel bzip2 bzip2-devel readline readline-devel sqlite sqlite-devel openssl openssl-devel git).each do |pkg|
  package pkg do
    action :install
  end
end

execute 'Install Epel for tig and etc.' do
  command 'sudo yum install -y epel-release.noarch'
end

execute 'Change Timezone to Asia/Tokyo' do
  command 'timedatectl set-timezone Asia/Tokyo'
end

execute 'Clean package manager' do
  command 'yum autoremove && yum clean all'
end
