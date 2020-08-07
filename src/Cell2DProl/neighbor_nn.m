%for Notch cell
%every neighbor(notch/cancer)are counted
function r=neighbor_nn(A)
ind=find(A<0);
target=(A<0);
sz=size(A);
r=zeros(sz);
for i=1:length(ind)
    r(ind(i))=target(ind(i)+sz(1))+target(ind(i)-sz(1))+target(ind(i)+1)+target(ind(i)-1);
end
end