# "libsqlite3-dev" is only Ubuntu/Debian
%w(sqlite3 libsqlite3-dev).each do |pkg|
  package pkg do
    action :install
  end
end
