# Desafio Elo7

Nesse projeto temos a página inicial de [carreiras](http://carreira.elo7.com.br) da Elo7 feita nativa em iOS.

Todo o conteúdo da página é carregado via uma json. Eu o salvei online no site http://myjson.com. No projeto também é possível visualizar dentro da pasta Utils um modelo desse json.
A arquitetura do projeto está em MVC com uma camada simples de Serviços para o fetch do json de carreiras. 
Na estrutura do App temos uma Table View e cada celula representa uma seção da página de carreiras da Elo7. As celulas de cultura e areas têm collections views para carregar os itens da API sendo o tamanho das table view cells mudados dinamicamente.
As imagens estão dentro do projeto mesmo, mas seria possível também mantê-las como link no json e usar como por exemplo o KingFisher para o cache.


## Executando o App 📱

Para executar é muito simples, basta executar no Xcode com um simulador ou até mesmo um iPhone caso tenham por perto.

## Algumas observações

Acredito que para essa página talvez fizesse mais sentido ser implementando uma mescla de parte em WebView e nativo. Eu pensei, por exemplo, em deixar a celula do meio da seção cultura com uma WebView e o restante nativo. para que fosse mais dinâmico o app, podendo acrescentar em HTML mais informações, como as que estão hoje na página de carreira de vocês. Mas acabei implementando na estrutura de collections views.

Bom, com certeza tem pontos a serem melhorados mas espero que gostem 😃

Caso tenham qualquer dúvida ou observações estou a disposição.
