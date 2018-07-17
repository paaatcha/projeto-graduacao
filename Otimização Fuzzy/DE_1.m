% Utilização: Entrada
%	dim = dimensão do problema
% 	nPop = tamanho da população
% 	nIter = numero de iterações
%
%	Saída:
%   melhor = o melhor resultado da minimização
%	pos_ = vetor n dimensional com as posições para o melhor resultado
%	todos_melhores = histórico com o melhor de todas as iterações
%
%	A função objetivo deve ser editada no outro arquivo que está nesta mesma pasta
%   com nome FuncaoObjetivo_1.m


function [melhor pos todos_melhores] = DE_1 (dim,nPop,nInt,q)
	CR = 0.85;
	F = 0.5;
    %0.5+0.3*randn()

	%populacao = randi([0 10],nPop,dim);
    populacao = initPop (nPop,dim+1);%5*rand(nPop,dim+1);
	todos_melhores = zeros(nInt,1);		
		
	for i=1:nInt	
		iteracao = [q , i]
        populacao_m = mutacao (populacao,dim,nPop,F);		
		populacao_r = recombinacao (populacao,populacao_m,nPop,dim,CR);
		populacao = selecao (populacao,populacao_r,nPop,dim);
		[melhor pos] = melhores (populacao,nPop);
		todos_melhores (i) = melhor;        
	end %for
    
	%plot(todos_melhores);
end %function

function populacao = initPop (nPop,dim,tip)
    populacao = zeros (nPop,dim);    
    for i=1:nPop
       for j=1:dim
          if j<=6
             populacao(i,j)= -7*rand();
          else
             populacao(i,j)= 7*rand(); 
          end
       end       
    end
end

function [melhor pos] = melhores (populacao,nPop)
	melhor = 99999; %inicializacao
	pos = 0;
	
	for i=1:nPop
		%m = simula (populacao(i,:));		
        %populacao(i,4) = fun��o de fitness pra economizar
		
		if (populacao(i,4)<melhor)
			melhor = populacao(i,4);
			pos = populacao(i,:);
		end%if		
	end %for
end %melhores

function pop = arredonda (popul)
    [a b] = size (popul);
    pop = zeros(a,b);
    for i=1:a
        for j=1:b
            pop(i,j) = roundn(popul(i,j),-2);
        end
    end
end

function populacao_g = selecao (populacao,populacao_r,nPop,dim)
	pen = 1;
	populacao_g = zeros (nPop,dim+1);
	for i=1:nPop
        %populacao = arredonda (populacao);
        fis1 = changeFis(populacao(i,:));
		errom = simula (fis1);		
        
        %populacao_r = arredonda (populacao_r);
        fis2 = changeFis(populacao_r(i,:));
		erromr = simula (fis2);
		
		if (errom <= erromr)
			populacao_g(i,:) = populacao(i,:);
            populacao_g(i,4) = errom;
		else
			populacao_g(i,:) = populacao_r(i,:);
            populacao_g(i,4) = erromr;
		end%if
	end %for	
end %selecao



function populacao2 = recombinacao (populacao,populacao_m,nPop,dim,CR)
	populacao2 = zeros (nPop,dim+1);
	for i=1:nPop
		prob = rand();
		Irand = randi([1 dim]);
		if (prob <= CR | i == Irand)
			populacao2(i,:) = populacao_m(i,:);
		elseif (prob > CR & i ~= Irand) 		
			populacao2(i,:) = populacao(i,:);
		end%if
	end %for i	
end %recombinacao

function populacao2 = mutacao (populacao,dim,nPop,F)
	populacao2 = zeros (nPop,dim+1);
	for i=1:nPop	
		nAlet1 = randi([1 nPop]);
		nAlet2 = randi([1 nPop]);	
		for j=1:dim
			populacao2(i,j) = (populacao(i,j) + F*(populacao(nAlet1,j) - populacao(nAlet2,j)));
			% rever isso aqui            
            if j<=6
                if (populacao2(i,j) > 0 || populacao2(i,j) < -7)
                    populacao2(i,j) = -7*rand();                    
                end
            else
                if (populacao2(i,j) < 0 || populacao2(i,j) > 7)
                    populacao2(i,j) = 7*rand();
                end                
            end
		end %for
	end %end i
end %mutacao




