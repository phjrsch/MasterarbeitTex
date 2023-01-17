import numpy as np
import matplotlib.pyplot as plt
plt.rcParams.update({
    "text.usetex": True,
    "font.family": "Helvetica"
})

time = -np.arange(-0.4,1.8,.25)

plt.figure(figsize=[3,3])

theta = -np.tanh(1*time)/2+1/2

plt.plot(time,theta,label='A')
plt.step(time,theta,where='post')
plt.xticks([])
plt.yticks([])
plt.xlabel('$t$')
plt.ylabel('$T$')
#plt.legend(title='Parameter $A$')

# plt.savefig('..\\figs\\discretizedCoolingCurve.eps',bbox_inches="tight")

plt.show()
