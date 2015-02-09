#
# Cookbook Name:: chef-tomcat-appli
# Attributes:: chef-tomcat-appli
#
default['java']['install_flavor'] = 'openjdk'
default['java']['jdk_version'] = '7'
default['java']['oracle']['accept_oracle_download_terms'] = true

default['tomcat']['base_version'] = '7'
default['tomcat']['user'] = 'tomcat7'
default['tomcat']['group'] = 'tomcat7'
default['tomcat']['home'] = '/usr/share/tomcat7'
default['tomcat']['config_dir'] = '/etc/tomcat7'
default['tomcat']['base'] = '/var/lib/tomcat7'
default['tomcat']['config_dir'] = '/etc/tomcat7'
default['tomcat']['log_dir'] = '/var/log/tomcat7'
default['tomcat']['tmp_dir'] = '/tmp/tomcat7-tmp'
default['tomcat']['work_dir'] = '/var/cache/tomcat7'
default['tomcat']['webapp_dir'] = '/var/lib/tomcat7/webapps'
default['tomcat']['keytool'] = '/usr/bin/keytool'
default['tomcat']['java_options'] = '--Djava.awt.headless=true -Xmx128m -XX:+UseConcMarkSweepGC'

default['chef-tomcat-appli']['root'] = '/opt'
default['chef-tomcat-appli']['list'] = [
 {
   "name": "cas",
   "url": "http://.../cas/ROOT.war"
 },
 {
   "name": "cerbere",
   "url": "http://.../cerbere/ROOT.war"
 },
 {
   "name": "erp",
   "url": "http://.../erp/ROOT.war"
 },
 {
   "name": "jasperserver",
   "url": "http://.../jasperserver/ROOT.war"
 },
 {
   "name": "permis-am",
   "url": "http://.../permis-am/ROOT.war"
 },
 {
   "name": "message-si",
   "url": "http://.../message-si/ROOT.war"
 },
 {
   "name": "broker-si",
   "url": "http://.../broker-si/ROOT.war"
 },
 {
   "name": "subcom-ddc",
   "url": "http://.../subcom-ddc/ROOT.war"
 }
]

