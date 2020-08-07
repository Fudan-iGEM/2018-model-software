%for expression
function r=l_exp(x,y)
k_dg=1;
k_bd=1;
tao=0.1;
r=((1-y)*(x+1/9)*k_bd-y*k_dg)*tao+y;
end