clc
clear all

number = 1000;
clusters = 5;
mu = [1, 5, 7, 9, 15];
data = zeros(number*length(mu),1);

for k = 1:length(mu)
    data(1000*(k-1)+1:1000*k,1) = normrnd(mu(k),1,[number,1]);
end

%%% initialization
m = min(data) + (max(data) - min(data)) .* rand([1,clusters]);
s = rand(1,clusters);
phi = rand([number*length(mu),clusters]);
phi = phi ./ sum(phi,2);
sigma = 1;
elbo_old = 0;
elbo = get_elbo(data,m,s,phi,sigma);
t = 1;

while  abs(elbo - elbo_old) > 1e-4 || t < 100
    [m,s,phi] = update_elbo(data,m,s,sigma);
    elbo_list(t) = elbo;
    elbo_old = elbo;
    elbo = get_elbo(data,m,s,phi,sigma);
    t = t + 1;
end

