CASE
    Case 1: PascalCase
        Ex: Produtos, ClasseTeste, CadastroAluno
        Uso: Declaração de Casses

    Case 2: camelCase
        Ex: actionLogin, finalValue, navegarPara
        Uso: Métodos, Variáveis, Objetos

    Case 3: snake_case
        Ex: /login_screen, shared_component.dart, main.dart
        Uso: Criação de Diretórios, Nomes de Arquivos

Palavras Reservadas

    var = Depois de declarado so pode ser atribuído valores do mesmo tipo
    Ex: var teste = 123;

    dynamic = Pode receber qualquer tipo de valor depois da declaração
    Ex: dynamic teste = "Teste";

    -- Null Safety
        late = Pode receber valor depois da instanciação da classe 'posso declarar uma variável/objeto sem definir um valor'
        Ex: late int valor;

        ? = Operador permite que uma variável/objeto possa ser nula
        Ex: int? valor;
        Ex: int? valor = 10;

        ! = Afirmar que a variável/objeto com o operador ? possui valor atribuído
        Ex: if(valor! == 10) {}


SÍMBOLOS

    _ = Tornar variável ou método privado
    Ex: var _nome = "Pessoa";
    Ex: String _getNome() {}
    Ex: class _Teste {}

FUNÇÕES

    () {} = Função anonima 'nao precisa de declaração prévia'
    () => = Função anonima com return

    Função implícita:
        getName() {
            return = this.name;
        }

        ==

        dynamic getName() {
            return = this.name;
        }
    
    Função explicita:
        String getName() {
            return = this.name;
        }

ASSÍNCRONA

    Future<> = Objeto que fica esperando um retorno
    async = Definir que uma função utiliza retorno futuro
    await = Aguardar o retorno

    Func Ex:
        Exp// Future<String> getName() async {
            Response response = await get();
            return response.body;
        }

        Imp// getName() async {
            Response response = await get();
            return response.body;
        }







interface
calcPercentLocale
calcPercentState
calcPercentCountry
calcPercentPerson
calcPercentCpf
calcPercentCnpj


implements