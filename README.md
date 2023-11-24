# Contador de Tempo de Reação

Projeto final da disciplina de circuitos digitais utilizando a linguagem verilog e a placa fpga. O projeto consiste em um contador de tempo de reação com algumas restrições e utilizando máquinas de estado.

## Pré-requisitos
Necessário a utilização do software Quartus Prime II e a placa nvidia fpga.

## Como usar
Para utilizar o programa com as especificações descritas, siga os passos abaixo:

- Switch 9 - Função "Clear"
Quando ativado (posição ON), o Switch 9 terá a função de "clear". Após ativado, será exibida a mensagem "HI" no display.

- Switch 0 - Start
Antes de iniciar a contagem, verifique se o Switch 0 está ativado (posição ON). Esse switch é responsável por iniciar a contagem.

- Button 1 - Stop e Tempo de Reação
Durante a contagem de 5 segundos, aguarde até que ela termine. Após os 5 segundos, pressione o Button 1 o mais rápido possível. Se o Button 1 for pressionado antes dos 5 segundos terminarem, a mensagem "9.999" será exibida no display. Se demorar mais de um segundo para pressionar o Button 1, o resultado será considerado inválido.

- Display -
O display mostrará o tempo demorado para reagir ao sinal em milissegundos. O resultado será exibido após a pressão do Button 1 e indicará o tempo que você levou para responder ao sinal.
