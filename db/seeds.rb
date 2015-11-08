bs1 = Device.create(serial: 'BS000001', capability: 'station')
bs2 = Device.create(serial: 'BS000002', capability: 'station')
en1 = Device.create(serial: 'EN000001', capability: 'node')
en2 = Device.create(serial: 'EN000002', capability: 'node')
en3 = Device.create(serial: 'EN000003', capability: 'node')
en4 = Device.create(serial: 'EN000004', capability: 'node')

g1 = Group.create(name: 'Europe Trip 2016', description: 'Travel through France, Germany, and Italy.')
g1.devices << bs1
g1.devices << en1
g1.devices << en2
g1.devices << en3

g2 = Group.create(name: 'Japan Trip 2015', description: 'Five days of nice food and spa in Japan')
g2.devices << bs2
g2.devices << en2
g2.devices << en3
g2.devices << en4

en2.paths.create()
en3.paths.create()
en4.paths.create()