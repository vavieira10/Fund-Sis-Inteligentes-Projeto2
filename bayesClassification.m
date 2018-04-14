function respostasObtidas = bayesClassification(valRGB, rotulos, listaImagens)
% Funcao que vai implementar toda a logica para o treinamento e teste do
% modelo Bayes

%% Criando e treinando o modelo com as regioes extraida das imagem 6
modeloBayes = fitcnb(valRGB, rotulos);
nImagens = length(listaImagens);

%% Lendo uma imagem por vez e fazendo as predicoes
rgb = zeros(1, 3);
% Criar um vetor de structs com as respostas obtidas e a posicao da imagem
% (x, y) que foi obtida a resposta
respostasObtidas = struct('Imagem', {}, 'PosLinha', {},'PosColuna', {}, 'Resposta', {});
for n = 1:nImagens
    imagem = imread(listaImagens{n});
    linhas = size(imagem, 1);
    cols = size(imagem, 2);
    for i = 1:linhas
       for j = 1:cols
           rgb = [imagem(i, j, 1) imagem(i, j, 2) imagem(i, j, 3)];
           resp = predict(modeloBayes, double(rgb));
           % struct temporaria para armazenar os valores obtidos
           tempStruct.Imagem = n;
           tempStruct.PosLinha = i;
           tempStruct.PosColuna = j;
           tempStruct.Resposta = resp{1};
           % armazenando na struct a resposta
           respostasObtidas(end + 1) = tempStruct;
       end
    end
    
end

end

