function h = H_Notch_Ligand(M,type,k)
%H_NOTCH_LIGAND 
%A function for Notch-Ligand kinetics
%the order of M (a column vector of lenght 2 type) is Notch-A Ligand-a Aa AaSC icd-iA Notch-B
%Ligand-B icd-B Secretase Ligand 
%Complex
%2*type+type^2*2
%N S NS NSC C icd
%2*n(N L)+n^2*2(NL,NLS)+1(S)+n(icd)

h=zeros((5*type^2+2*type+1+type)*2,1);
c=ones((5*type^2+2*type+1+type)*2,1);
for i = 1:type
c((5*type^2+2*type+1+i))=0;
c((5*type^2+2*type+1+type)+(5*type^2+2*type+1+i))=0;
for j =1:type
    if i~=j
    c((0*type^2+2*type+(i-1)*type+j))=k;
    c((5*type^2+2*type+1+type)+(0*type^2+2*type+(i-1)*type+j))=k;
    end
end
end
c(3)=0;
%disp(c);
%disp(c);
for i =1:length(h)
    [ celli,rtype,ind1,ind2 ] = ind2ind( i,type );
    switch rtype
        case 0
            h(i)=c(i);
        case 1
            h(i)=c(i)*M((2*type+type^2*2+1+type)*(celli-1)+ind1)*M((2*type+type^2*2+1+type)*(3-celli-1)+type+ind2);
        case 2
            h(i)=c(i)*M((2*type+type^2*2+1+type)*(celli-1)+2*type+type*(ind1-1)+ind2);
        case 3
            h(i)=c(i)*M((2*type+type^2*2+1+type)*(celli-1)+(2*type+type*(ind1-1)+ind2))*M((2*type+type^2*2+1+type)*(celli-1)+2*type+type^2*2+1);
        case 4
            h(i)=c(i)*M((2*type+type^2*2+1+type)*(celli-1)+(2*type+type^2+type*(ind1-1)+ind2));
        case 5
            h(i)=c(i)*c(i)*M((2*type+type^2*2+1+type)*(celli-1)+(2*type+type^2+type*(ind1-1)+ind2));
        case 6
            h(i)=c(i)*M((2*type+type^2*2+1+type)*(celli-1)+2*type+type^2*2+1+ind1);
    end
end
end

