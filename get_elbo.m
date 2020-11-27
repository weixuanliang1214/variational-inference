function elbo = get_elbo(data,m,s,phi,sigma)

p1 = phi .* (-0.5 * (data.^2 + (m.^2 + s)) + data * m);

p2 = -sum(m.^2 + s) / (2*sigma^2);

p3 = - sum(log(phi));

p4 = 0.5 * sum(log(s)); 

elbo = sum(sum(p1)) + p2 + sum(p3) + p4;

end