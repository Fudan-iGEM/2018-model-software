function [ cell,rtype,ind1,ind2 ] = ind2ind( indf,type )
%IND2IND a trick for H_Notch_Ligand
%   rtype 6
%   2*n(N L)+n^2*2(NL,NLS)+1(S)+n(icd)
t1=type;
t2=type^2;
num_rea=2*t1+5*t2+1+t1;
cell=ceil(indf/num_rea);
indf=mod(indf-1,num_rea)+1;
%disp(indf);
if indf>num_rea-t1
    rtype=6;
    ind1=indf-(num_rea-t1);
    ind2=ind1;
elseif indf<=2*t1 || indf==num_rea-t1
    rtype=0;
    if indf<=2*t1
    ind1=mod(indf-1,type)+1;
    ind2=ind1;
    else
        ind1=mod(num_rea-t1-1,type)+1;
        ind2=ind1;
    end
else
    %disp('call');
    rtype=ceil((indf-2*t1)/t2);
    indf=mod(indf-1,t2)+1;
    ind1=ceil(indf/type);
    ind2=mod(indf-1,type)+1;
end
end

