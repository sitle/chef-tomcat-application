#
# Cookbook Name:: chef-tomcat-appli
# Attributes:: chef-tomcat-appli
#
default['chef-tomcat-appli']['tomcat_version'] = 'tomcat7'
default['chef-tomcat-appli']['root'] = '/opt'
default['chef-tomcat-appli']['list'] = [
  {
    'name' => 'cas',
    'url' => 'http://.../cas/ROOT.war'
  },
  {
    'name' => 'cerbere',
    'url' => 'http://.../cerbere/ROOT.war'
  },
  {
    'name' => 'erp',
    'url' => 'http://.../erp/ROOT.war'
  },
  {
    'name' => 'jasperserver',
    'url' => 'http://.../jasperserver/ROOT.war'
  },
  {
    'name' => 'permis-am',
    'url' => 'http://.../permis-am/ROOT.war'
  },
  {
    'name' => 'message-si',
    'url' => 'http://.../message-si/ROOT.war'
  },
  {
    'name' => 'broker-si',
    'url' => 'http://.../broker-si/ROOT.war'
  },
  {
    'name' => 'subcom-ddc',
    'url' => 'http://.../subcom-ddc/ROOT.war'
  }
]
