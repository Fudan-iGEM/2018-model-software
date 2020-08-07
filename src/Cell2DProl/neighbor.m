%for neighbor

function r=neighbor(A,c,n)
ind=find(A==c);
target=(A==n);
sz=size(A);
r=zeros(sz);
for i=1:length(ind)
    r(ind(i))=target(ind(i)+sz(1))+target(ind(i)-sz(1))+target(ind(i)+1)+target(ind(i)-1);
end
end