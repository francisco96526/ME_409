# -*- coding: utf-8 -*-
"""
Created on Tue Nov  8 11:17:24 2022

@author: Jonas
"""

import numpy as np
import matplotlib.pyplot as plt




GWP_f_Topt = np.array([11103.72833,
14433.30667,
17762.885,
21092.46333,
24422.04167
])

TOTEX_f_Topt = np.array([
    13476.37,
11725.1,
11429.08,
11313.5,
11288.01
])

GWP_f_Gopt = np.array([10637.87,
9410.62,
8428.91,
7888.41,
7793.25
])

TOTEX_f_Gopt = np.array([
14361.135,
17437.39,
20513.645,
23589.9,
26666.155
])

GWP_f_end = np.array([7774.15,
27751.62
])

TOTEX_f_end = np.array([29742.41,
11284.88
])

plt.figure(dpi=400)
#plt.grid()
plt.scatter(GWP_f_Topt,TOTEX_f_Topt,label="TOTEX opt",marker="x")
plt.scatter(GWP_f_Gopt,TOTEX_f_Gopt,label="GWP opt",marker="D")
plt.scatter(GWP_f_end,TOTEX_f_end,color="black",label="Pareto bound")
plt.scatter([31744],[14073],label="Swiss TOTEX")
plt.scatter([27970],[17691],label="Swiss GWP")
plt.title("Pareto curve of TOTEX and GWP")
plt.ylabel("TOTEX [MCHF/y]")
plt.xlabel("GWP [ktCO2eq/y]")
plt.legend()
plt.savefig("M1.4_pareto_full_swiss.png")


####################

GWP_z_Topt = np.array([9478.49225,
10983.0598,
12487.62735,
13992.1949,
15496.76245
])

TOTEX_z_Topt = np.array([17247.11,
13701.71,
12271.94,
11816.83,
11567.14
])

GWP_z_Gopt = np.array([11165.57,
10207.52,
9515.35,
8866.87,
8332.09
])

TOTEX_z_Gopt = np.array([13360.88942,
15252.32353,
17143.75765,
19035.19177,
20926.62588
])

GWP_z_end = np.array([7973.9247,
17001.33
])

TOTEX_z_end = np.array([22818.06,
11469.4553
])


plt.figure(dpi=400)
#plt.grid()
plt.scatter(GWP_z_Topt,TOTEX_z_Topt,label="TOTEX opt",marker="x")
plt.scatter(GWP_z_Gopt,TOTEX_z_Gopt,label="GWP opt",marker="D",)
plt.scatter(GWP_z_end,TOTEX_z_end,color="black",label="Pareto bound")
plt.title("Zoomed in pareto curve of TOTEX and GWP")
plt.ylabel("TOTEX [MCHF/y]")
plt.xlabel("GWP [ktCO2eq/y]")
plt.legend()
plt.savefig("M1.4_pareto_zoom.png")




