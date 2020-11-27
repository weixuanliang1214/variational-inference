function [m,s,phi] = update_elbo(data,m,s,sigma)
n = size(data,1);

mu_2 = repmat(m.^2 + s, n, 1);

pre_phi = exp(data * m - mu_2 / 2);

phi = pre_phi ./ sum(pre_phi,2);

m = sum(data.*phi,1) ./ (sigma^(-2) + sum(phi,1));

s = 1 ./ (sigma^(-2) + sum(phi,1));


end