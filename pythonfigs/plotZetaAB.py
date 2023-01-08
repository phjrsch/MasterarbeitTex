import numpy as np
import matplotlib.pyplot as plt
plt.rcParams.update({
    "text.usetex": True,
    "font.family": "Helvetica"
})

theta = np.arange(355,325,-.1)
Mf = 140
Ms = 340
dtheta = -1
tanH = [0.2, 0.5, 1, 2, 5]

plt.figure(figsize=[4,2])

for i in range(len(tanH)):
    tanHPara = tanH[i]
    ZetaAM = np.heaviside(-dtheta,1)*np.heaviside(theta-Mf,1)*(np.tanh(tanHPara*(Ms-theta))/2+1/2)
    plt.plot(theta,ZetaAM,label=tanHPara)

plt.xlabel('$T[°C]$')
plt.ylabel('$\\zeta_{A \\rightarrow M}$')
plt.legend(title='Parameter $A$')

plt.savefig('..\\figs\\tanHPara.eps',bbox_inches="tight")

plt.show()
