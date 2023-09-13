import sys
sys.path.append('utils')
import fileio as io
import numpy as np
import matplotlib.pyplot as plt
from plotsUtil import *

fileAJ = 'PPreaction_AJ.txt'
fileDD = 'PPreaction_DD.txt'
res_aj = io.readMultiColFile(fileAJ)
res_dd = io.readMultiColFile(fileDD)

fig=plt.figure()
plt.plot(res_aj[:,0],res_aj[:,1],linewidth=3,color='k',label='Analytical Jac.')
plt.plot(res_dd[:,0],res_dd[:,1],'--',linewidth=3,color='r',label='Numerical Jac.')
prettyLabels('time[s]','T[K]',14)
plotLegend()

plt.show()
