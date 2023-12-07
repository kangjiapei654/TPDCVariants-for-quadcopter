# TPDCVariants-for-quadcopter
Tensor Product Mode Transforamtion based parralleled distribute controller
# TPDCVariants-for-quadcopter
# Author: Guoliang Zhao Feichang Jiapei Kang
# Time: 2023-11-30
# Inner Mongolia University, School of Electronic and Information Engineering
# TPDC and it's variants with FAC: 
For the under-actuated system, 
the Tensor Product Mode Transformation (TPDC) has been successfuly used in this under-actuated system. 
And the quadcopter has divided into two sub-systems: position sub-system and altitude sub-system. 
These two sub-systems are highly coupled. 
As we all know, 
to further solve the problem of high coupling problem of the quadrotor system, 
the double closed-loop control scheme may be the right way to the control strategy of the quadrotors, 
since the varying rate of the two sub-systems of the quadrotor are different. To step further on the time constant linear systems, 
TP model transformation based design methods could generate a set of time constant nonlinear system, 
which is formed from convex matrices.
Thus, 
fully actuated control design method could be easily merged into the framework of the TP model transformation based design. 
To the quadrotor, 
the position subsystem of the quadrotor control system is defined as the outer loop, 
and the attitude subsystem is defined as the inner loop. 
The work of above-mentioned TP model transformation mainly focuses on convex hull manipulation and LMIs based optimal controller design. 
However, 
appropriate non-uniform step sampling method is very important to the precise construction of the original analytical nonlinear model. 
There is little work on the TP model transformation’s quasi linear parameter varying (qLPV) system’s discrete tensor sampling step, 
the qLPV system’s discrete tensor sampling step needs the nonuniform sampling method rather than the fix step sampling method. 
In the current research work, 
besides the traditional tensor sampling method, non-uniform step sampling method is preferred to construct a more precise nonlinear model. 
![image](https://github.com/kangjiapei654/TPDCVariants-for-quadcopter/assets/72081060/e341b598-e2b9-4551-b3be-fd7494061109)


# Bibliography:
[1] P. Baranyi, "TP model transformation as a way to LMI-based controller design," in IEEE Transactions on Industrial Electronics, vol. 51, no. 2, pp. 387-400, April 2004, doi: 10.1109/TIE.2003.822037.

[2] Duan G. High-order fully actuated system approaches: Part I. Models and basic procedure[J]. International Journal of Systems Science, 2021, 52(2): 422-435.

[3] Duan G. High-order fully actuated system approaches: Part II. Generalized strict-feedback systems[J]. International Journal of Systems Science, 2021, 52(3): 437-454.

[4] Duan G. High-order fully actuated system approaches: Part III. Robust control and high-order backstepping[J]. International Journal of Systems Science, 2021, 52(5): 952-971.

[5] Duan G. High-order fully actuated system approaches: Part IV. Adaptive control and high-order backstepping[J]. International Journal of Systems Science, 2021, 52(5): 972-989.

[6] Duan G. High-order fully actuated system approaches: Part V. Robust adaptive control[J]. International Journal of Systems Science, 2021, 52(10): 2129-2143.

[7] Duan G. High-order fully actuated system approaches: part VII. Controllability, stabilisability and parametric designs[J]. International Journal of Systems Science, 2021, 52(14): 3091-3114.

[8] Duan G. High-order fully actuated system approaches: Part VIII. Optimal control with application in spacecraft attitude stabilisation[J]. International Journal of Systems Science, 2022, 53(1): 54-73.

