from pyovpn.lic import uprop2
old_figure = None
 
def new_figure(self, licdict):
      ret = old_figure(self, licdict)
      ret['concurrent_connections'] = 2048
      return ret
 
for x in dir(uprop2):
      if x[:2] == '__':
         continue
      if x == 'UsageProperties':
         exec('old_figure = uprop2.UsageProperties.figure')
         exec('uprop2.UsageProperties.figure = new_figure')
      exec('%s = uprop2.%s' % (x, x))
