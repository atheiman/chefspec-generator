directory '/etc/test-config' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

file '/etc/test-config/config.json' do
  content '{ "a": { "b": "c" } }'
  mode '0755'
  owner 'root'
  group 'root'
end
