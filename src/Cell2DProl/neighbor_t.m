%for cancer cell
%the army energy is counted(the result may be negative)
function r=neighbor_t(A,k)
ind=find(A>0);
sz=size(A);
r=zeros(sz);
for i=1:length(ind)
    r(ind(i))=-((A(ind(i)+sz(1))+k-1)*((A(ind(i)+sz(1))<(-k+1)).*(A(ind(i)+sz(1))>-k))+(A(ind(i)-sz(1))+k-1)*((A(ind(i)-sz(1))<(-k+1)).*(A(ind(i)-sz(1))>(-k)))+(A(ind(i)+1)+k-1)*((A(ind(i)+1)<(-k+1)).*(A(ind(i)+1)>-k))+(A(ind(i)-1)+k-1)*((A(ind(i)-1)<(-k+1)).*(A(ind(i)-1)>-k)));
end
end