import matplotlib.pyplot as plt
import numpy as np
a,b,c,d = np.loadtxt("rmsd.xvg", comments="#", unpack=True)
plt.plot(a,b, color='black', label='Backbone')
plt.plot(a,c, color='blue', label='Protein')
plt.plot(a,d, color='red', label='Ligand')
plt.xlabel('Time(ns)')
plt.ylabel('RMSD')
plt.legend(loc="upper right")
plt.savefig("rmsd.png", dpi=1000)


import matplotlib.pyplot as plt
import numpy as np
x,y = np.loadtxt("rmsf.xvg", comments=['@','#'], unpack=True)
plt.plot(x,y, color='Black', label='RMSF')
plt.xlabel('Residue')
plt.ylabel('RMSF (nm)')
plt.savefig('rmsf.png', dpi=1000)

import matplotlib.pyplot as plt
import numpy

t,data,x,y,z = np.loadtxt("gyrate.xvg", comments=['@','#'], unpack=True)

fig = plt.figure(figsize=(5,2.5))
ax = fig.add_subplot(111)
fig.subplots_adjust(bottom=0.2)

#ax.fill_between(t,data, color="magenta", linestyle="-", alpha=0.1)
ax.plot(t,data, color="magenta", linestyle="-")

ax.set_xlabel("Time (ps)")
ax.set_ylabel(r"Radius of gyration $R_\mathrm{gyr}$ (nm)")

fig.savefig("radiusofgyration.png", dpi=1000)


