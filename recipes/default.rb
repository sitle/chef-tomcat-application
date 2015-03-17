#
# Cookbook Name:: chef-tomcat-appli
# Recipe:: default
#
# Copyright (C) 2015 PE, pf.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

package node['chef-tomcat-appli']['tomcat_version'] do
 action :install
end

i = 20
node['chef-tomcat-appli']['list'].each do |appli|
  bash 'wget' do
    user 'root'
    cwd node['chef-tomcat-appli']['root']
    code "mkdir -p \"#{appli['name']}/webapps\"; cd \"#{appli['name']}/webapps\" && wget #{appli['url']}"
  end

  # bash 'rc.local' do
  #  user 'root'
  #  code << -EOH
  #   grep -w appli['name'] /etc/rc.local || ed /etc/rc.local <<EOF
  # /exit
  # i
  # invoke-rc.d tomcat start appli['name']
  # wq
  # EOF
  #  EOH
  # end

  service appli['name'] do
    supports status: true, restart: false, reload: false
    priority 2 => [:start, i], 0 => [:stop, 20], 1 => [:stop, 20], 6 => [:stop, 20]
  end

  template "/etc/init.d/#{appli['name']}" do
    source 'service.erb'
    mode '0755'
    owner 'root'
    group 'root'
    variables(
      date: Time.now,
      name: "#{node['chef-tomcat-appli']['tomcat_version']} $* #{appli['name']}"
    )
    action appli['disabled'] ? :delete : :create
    notifies :enable, "service[#{appli['name']}]", :immediately
    notifies :start,  "service[#{appli['name']}]", :immediately
  end
  i += 1
end
