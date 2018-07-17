function [pol v w] = modelagem (n)

	x = [11.9 9.52 7.14 4.76 2.38];
	y = [24.164 23.88 23.67 23.25 16.13];
    plot (x,y,'r');
    hold on;
    
	[pol b] = polyfit (x,y,n);

    pontos = 1:0.1:12;
    
    for i=1:111
        w(i,1) = val(pontos(1,i),pol,n);
        v (i,1) = pontos(1,i);
        
    end
    w
    v
    plot (v,w)
    
       
end

function t = val (w,pol,n)
    t=0;
    for i=1:n
    	t = t + (pol(1,i)*(w^(n-i+1)));
    end
end
