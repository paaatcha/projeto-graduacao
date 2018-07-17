function fismat = changeFis (pos)
	fismat = readfis('FuzzyOtim2.fis');	
    for i=1:12
       fismat.output(1,1).mf(1,i).params = pos (i);
    end
end %function
