<%@page language="java" import="java.sql.*" %>
<%
    //cria as variaveis para armazenar as informações 
    //digitadas pelo usuário

    String vnome = request.getParameter("txtNome");
    String vendereco= request.getParameter("txtEndereco");
    String vemail= request.getParameter("txtEmail");
    String vtelefone= request.getParameter("txtTelefone");
    Float vdoacao= Float.parseFloat(request.getParameter("txtValorD"));
    String vmensagem= request.getParameter("txtMensagem");
    String vtipo= request.getParameter("tipo-pagamento");


    //variaveis para o banco de dados
    String banco    = "Repaz" ;
    String endereco = "jdbc:mysql://localhost:3306/"+banco;
    String usuario  = "root";
    String senha    = "" ;

    //Variavel para o Driver
    String driver = "com.mysql.jdbc.Driver" ;

    //Carregar o driver na memória
    Class.forName( driver ) ;

    //Cria a variavel para conectar com o banco de dados
    Connection conexao ;

    //Abrir a conexao com o banco de dados
    conexao = DriverManager.getConnection(endereco, usuario, senha) ;

    //Cria a variavel sql como o comando INSERT
    String sql = "INSERT INTO doacoes (nome,endereco, email, telefone, doacao, tipo_de_pag, mensagem) values (?,?,?,?,?,?,?)" ;

    PreparedStatement stm = conexao.prepareStatement(sql) ;
    stm.setString( 1 , vnome) ;
    stm.setString( 2 , vendereco) ;
    stm.setString( 3 , vemail) ;
    stm.setString( 4 , vtelefone ) ;
    stm.setFloat( 5 , vdoacao ) ;
    stm.setString( 6 , vtipo ) ;
    stm.setString( 7 , vmensagem ) ;

    stm.execute() ;
    stm.close() ;

    out.print("Dados gravados com sucesso!!!");
    out.print("<br><br>") ;
    out.print("<a href='doacoes.html'>Voltar</a>") ;
%>
