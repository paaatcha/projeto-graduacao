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
%   com nome FuncaoObjetivo_2.m

function [melhor pos todos_melhores] = DE (input,iter,dim,nPop,nInt,CR,F)
	%CR = 0.85;
	%F = 0.25;

	populacao = randi([0 20],nPop,dim);
	todos_melhores = zeros(nInt,1);		
	%pos = randi([-200 200],1,dim); % gera de forma aleatória para preencher o .fis
	%pos = (initializer(:,1) + (initializer(:,2) - initializer(:,1)).*(rand(1,dim))')'; %incialização controlada para evitar mal formações
	%fis = changeFis (pos); % talvez nem precise, ve isso aqui
		
	for i=1:nInt	
		populacao_m = mutacao (populacao,dim,nPop,F,initializer);
		populacao_r = recombinacao (populacao,populacao_m,nPop,dim,CR);
		populacao = selecao (populacao,populacao_r,nPop,dim,input,iter);
		[melhor pos] = melhores (populacao,nPop,input,iter);
		todos_melhores (i) = melhor;
	end %for
	%plot(todos_melhores);
end %function

function [melhor pos] = melhores (populacao,nPop,input,iter)
	melhor = 99999; %inicializacao
	pos = 0;
	
	for i=1:nPop
		fis = changeFis (populacao(i,:));
		[m h] = eval_system (input,iter,fis);
		if (m<melhor)
			melhor = m;
			pos = populacao(i,:);
		end%if				
	end %for
end %melhores

function populacao_g = selecao (populacao,populacao_r,nPop,dim,input,iter)
	pen = 1;
	populacaog = zeros (nPop,dim);
	for i=1:nPop
		fis = changeFis (populacao(i,:));
		[m h] = eval_system (input,iter,fis);
		fis = changeFis (populacao_r(i,:));
		[mr h] = eval_system (input,iter,fis);

		if (m <= mr)
			populacao_g(i,:) = populacao(i,:);
		else
			populacao_g(i,:) = populacao_r(i,:);
		end%if
	end %for	
end %selecao

function populacao2 = recombinacao (populacao,populacao_m,nPop,dim,CR)
	populacao2 = zeros (nPop,dim);
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

function populacao2 = mutacao (populacao,dim,nPop,F,initializer)
	populacao2 = zeros (nPop,dim);
	for i=1:nPop	
		nAlet1 = randi([1 nPop]);
		nAlet2 = randi([1 nPop]);	
		for j=1:dim
			populacao2(i,j) = (populacao(i,j) + F*(populacao(nAlet1,j) - populacao(nAlet2,j)));
			% rever isso aqui
			%if (populacao2(i,j) > 200 | populacao2(i,j) < -200)
				%populacao2(i,j) = (initializer(:,1) + (initializer(:,2) - initializer(:,1)).*(rand(1,dim))')';
			%end%if		
		end %for
	end %end i
end %mutacao




