#!/bin/bash
python3 - "${@}" <<'PY'
import sys
if len(sys.argv)!=4:
    sys.exit(1)
try:
    d=float(sys.argv[1])
    m=float(sys.argv[2])
    r=float(sys.argv[3])
except ValueError:
    sys.exit(1)
coeff=[-165.13884826523372,88.17230215631525,0.4069550111070743,1.2116765573935222,-2.5902746074706986,3.526925506669356e-05,-0.0002785201970856102,0.01451018774824324,-0.008909396689364302,-0.00011392118366372606]
features=[1,d,m,r,d*d,m*m,r*r,d*m,d*r,m*r]
result=sum(c*f for c,f in zip(coeff,features))
print(f"{result:.2f}")
PY
