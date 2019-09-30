
function Ycon = myconv(Y,filter)

dim = size(filter,1); % should be square matrix

Ycon = zeros(size(Y,1)-dim,size(Y,2)-dim);

for i=1:size(Y,2)-dim-1
    for j=1:size(Y,1)-dim-1
        tmp = Y(j:j+dim-1,i:i+dim-1) .* filter;
        Ycon(j,i) = sum(tmp(:))/sum(filter(filter == 1));
    end
end

end

