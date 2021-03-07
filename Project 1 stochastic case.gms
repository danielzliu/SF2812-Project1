
Set s /240,250,260,270,280,290,300,310,320,330,340,350,360/;

Positive Variable w1, w2, w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y15,y16;
Free Variable z;

*wch is the amount of cheap oil bought in week 1.
*wexp is the amount of expensive oil bought in week 1.
*s is the stochastic outcome of the supply
Variable wch(s), 
wex(s),
xch(s),
xex(s),
ych(s),
yex(s);

Positive Variables wch,
wex,
xch,
xex,
ych,
yex;


Parameter p(s)
/240 0.0026
250 0.0049
260 0.0165
270 0.0441
280 0.0918
290 0.1499
300 0.1915
310 0.1915
320 0.1499
330 0.0918
340 0.0441
350 0.0165
360 0.0049/;

Parameter supply(s)
/240 240
250 250
260 260
270 270
280 280
290 290
300 300
310 310
320 320
330 330
340 340
350 350
360 360/;

Equations
wio1,wio2,wio3,wio4,wio5,wio6,wio7,
wcc1,wcc2,wcc3,wcc4,wcc5,
wcr2,wcr3,wcr4,wcr5,wcr6,
xio1,xio2,xio3,xio4,xio5,xio6,xio7,
xcc1,xcc2,xcc3,xcc4,xcc5,
xcr2,xcr3,xcr4,xcr5,xcr6,
yio1,yio2,yio3,yio4,yio5,yio6,yio7,
ycc1,ycc2,ycc3,ycc4,ycc5,
ycr2,ycr3,ycr4,ycr5,ycr6,
w1eq,x1eq,y1eq,
wchlim, xchlim, ychlim,
obj;

wio1.. w1+w2 =E= w3;
wio2.. w3 =E= w4+w5+w8;
wio3.. w4+w10 =E= w12+w15;
wio4.. w5 =E= w6+w7;
wio5.. w7+w8 =E= w9;
wio6.. w9 =E= w10+w11;
wio7.. w6+w11 =E= w13+w14+w16;
wcc1.. 0.5*w1+0.7*w2 =E= w4;
wcc2.. 0.3*w1+0.2*w2 =E= w5;
wcc3.. 0.2*w1+0.1*w2 =E= w8;
wcc4.. 0.9*w7+0.4*w8 =E= w10;
wcc5.. 0.1*w7+0.6*w8 =E= w11;
wcr2.. w2 =L= 300;
wcr3.. w3 =L= 500;
wcr4.. w9 =L= 300;
wcr5.. w12 =L= 250;
wcr6.. w13 =L= 30;
xio1.. x1+x2 =E= x3;
xio2.. x3 =E= x4+x5+x8;
xio3.. x4+x10 =E= x12+x15;
xio4.. x5+w14 =E= x6+x7;
xio5.. x7+x8 =E= x9;
xio6.. x9 =E= x10+x11;
xio7.. x6+x11 =E= x13+x14+x16;
xcc1.. 0.5*x1+0.7*x2 =E= x4;
xcc2.. 0.3*x1+0.2*x2 =E= x5;
xcc3.. 0.2*x1+0.1*x2 =E= x8;
xcc4.. 0.9*x7+0.4*x8 =E= x10;
xcc5.. 0.1*x7+0.6*x8 =E= x11;
xcr2.. x2 =L= 300;
xcr3.. x3 =L= 500;
xcr4.. x9 =L= 300;
xcr5.. x12 =L= 250;
xcr6.. x13 =L= 130;
yio1.. y1+y2 =E= y3;
yio2.. y3 =E= y4+y5+y8;
yio3.. y4+y10 =E= y12+y15;
yio4.. y5+x14 =E= y6+y7;
yio5.. y7+y8 =E= y9;
yio6.. y9 =E= y10+y11;
yio7.. y6+y11 =E= y13+y16;
ycc1.. 0.5*y1+0.7*y2 =E= y4;
ycc2.. 0.3*y1+0.2*y2 =E= y5;
ycc3.. 0.2*y1+0.1*y2 =E= y8;
ycc4.. 0.9*y7+0.4*y8 =E= y10;
ycc5.. 0.1*y7+0.6*y8 =E= y11;
ycr2.. y2 =L= 300;
ycr3.. y3 =L= 500;
ycr4.. y9 =L= 300;
ycr5.. y12 =L= 250;
ycr6.. y13 =L= 130;
w1eq(s).. wch(s) + wex(s) =E= w1;
x1eq(s).. xch(s) + xex(s) =E= x1;
y1eq(s).. ych(s) + yex(s) =E= y1;
wchlim(s).. wch(s) =L= supply(s);
xchlim(s).. xch(s) =L= supply(s);
ychlim(s).. ych(s) =L= supply(s);
obj.. z =E= -600*w2-100*w3-80*w9+1000*w12+740*w13-20*w14-600*x2-100*x3-80*x9+1000*x12+740*x13-20*x14-600*y2-100*y3-80*y9+1000*y12+740*y13- 10*sum(s,p(s)*(500*wch(s)+700*wex(s)+500*xch(s)+700*xex(s)+500*ych(s)+700*yex(s)));



Model optimal_revenue /

wio1,wio2,wio3,wio4,wio5,wio6,wio7,
wcc1,wcc2,wcc3,wcc4,wcc5,
wcr2,wcr3,wcr4,wcr5,wcr6,
xio1,xio2,xio3,xio4,xio5,xio6,xio7,
xcc1,xcc2,xcc3,xcc4,xcc5,
xcr2,xcr3,xcr4,xcr5,xcr6,
yio1,yio2,yio3,yio4,yio5,yio6,yio7,
ycc1,ycc2,ycc3,ycc4,ycc5,
ycr2,ycr3,ycr4,ycr5,ycr6,
w1eq,x1eq,y1eq,
wchlim, xchlim, ychlim,
obj/;


Options LP = Cplex;


Solve optimal_revenue using LP maximizing z;

Display w1.L, w2.L, w3.L,w4.L,w5.L,w6.L,w7.L,w8.L,w9.L,w10.L,w11.L,w12.L,w13.L,w14.L,w15.L,w16.L,x1.L,x2.L,x3.L,x4.L,x5.L,x6.L,x7.L,x8.L,x9.L,x10.L,x11.L,x12.L,x13.L,x14.L,x15.L,x16.L,y1.L,y2.L,y3.L,y4.L,y5.L,y6.L,y7.L,y8.L,y9.L,y10.L,y11.L,y12.L,y13.L,y15.L,y16.L,z.L;

