function [yout] = teste ()

    iter = 1000;
    u = 1;
    j=1;

    for t=1:0.1:10
        yout(j) = 5*(6.39*(0.112663 - (0.112663*exp(-8.876*t))))*u;
        j = j + 1;
    end


end