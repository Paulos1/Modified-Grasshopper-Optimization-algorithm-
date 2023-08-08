function offspring = mutuation(offspring,Pm,etam,ub,lb)
[Np,D] = size(offspring);
for i = 1:Np
    r = rand;
    if r<Pm
        for j = 1:D
            r=rand;
            if r<0.5
                delta = (2*r)^(1/(etam+1))-1;
            else
                delta = (1-2*(1-r))^(1/(etam+1))-1;
            end
            offspring(i,j) = offspring(i,j)+(ub(j)-lb(j)*delta);
        end
        offspring(i,:) = max(offspring(i,:),lb');
        offspring(i,:) = min(offspring(i,:),ub');
    end
end