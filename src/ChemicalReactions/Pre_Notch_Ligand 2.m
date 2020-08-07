function [Pre,Post] = Pre_Notch_Ligand(type)
%H_NOTCH_LIGAND 
%A function for Notch-Ligand kinetics
%the order of M (a column vector of lenght 2 type) is Notch-A Ligand-a Aa AaSC icd-iA Notch-B
%Ligand-B icd-B Secretase Ligand 
%Complex
%2*type+type^2*2+1+type
%N S NS NSC C icd
%2*n(N L)+n^2*2(NL,NLS)+1(S)+n(icd)

Pre=zeros((5*type^2+2*type+1+type)*2,2*(2*type+2*type^2+1+type));
Post=zeros((5*type^2+2*type+1+type)*2,2*(2*type+type^2*2+1+type));
u=(5*type^2+2*type+1+type)*2;
v=2*(2*type+type^2*2+1+type);

for i=1:u
    [ celli,rtype,ind1,ind2 ] = ind2ind( i,type );
    switch rtype
        case 0
            if mod(i,(5*type^2+2*type+1+type))<=2*type
            Post(i,(2*type+type^2*2+1+type)*(celli-1)+mod(i,(5*type^2+2*type+1+type)))=1;
            else
            Post(i,(2*type+type^2*2+1+type)*(celli-1)+2*type+type^2*2+1)=1;
            end
        case 1
            Pre(i,(2*type+type^2*2+1+type)*(celli-1)+ind1)=1;
            Pre(i,(2*type+type^2*2+1+type)*(3-celli-1)+type+ind2)=1;
            Post(i,(2*type+type^2*2+1+type)*(celli-1)+type*2+(ind1-1)*type+ind2)=1;
        case 2
            Pre(i,(2*type+type^2*2+1+type)*(celli-1)+2*type+type*(ind1-1)+ind2)=1;
            Post(i,(2*type+type^2*2+1+type)*(celli-1)+ind1)=1;
            Post(i,(2*type+type^2*2+1+type)*(3-celli-1)+type+ind2)=1;
        case 3
            Pre(i,(2*type+type^2*2+1+type)*(celli-1)+(2*type+type*(ind1-1)+ind2))=1;
            Pre(i,(2*type+type^2*2+1+type)*(celli-1)+2*type+type^2*2+1)=1;
            Post(i,(2*type+type^2*2+1+type)*(celli-1)+(2*type+type^2+type*(ind1-1)+ind2))=1;
        case 4
            Pre(i,(2*type+type^2*2+1+type)*(celli-1)+(2*type+type^2+type*(ind1-1)+ind2))=1;
            Post(i,(2*type+type^2*2+1+type)*(celli-1)+(2*type+type*(ind1-1)+ind2))=1;
            Post(i,(2*type+type^2*2+1+type)*(celli-1)+2*type+type^2*2+1)=1;
        case 5
            Pre(i,(2*type+type^2*2+1+type)*(celli-1)+(2*type+type^2+type*(ind1-1)+ind2))=1;
            Post(i,(2*type+type^2*2+1+type)*(celli-1)+(2*type+2*type^2+1+ind1))=1;
        case 6
            Pre(i,(2*type+type^2*2+1+type)*(celli-1)+(2*type+2*type^2+1+ind1))=1;
    end
end


end

