<%@page language="java" import="java.sql.*" %>
<%
    //cria as variaveis para armazenar as informações 
    //digitadas pelo usuário

    String vcritica= request.getParameter("txtMen");
    String vavaliacao = request.getParameter("avaliacao");

   

    //variaveis para o banco de dados
    String banco    = "repaz" ;
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
    conexao = DriverManager.getConnection(endereco,usuario,senha) ;

    //Cria a variavel sql como o comando INSERT
    String sql = "INSERT INTO criticas (critica,avaliacao) values (?,?)" ;
     
    PreparedStatement stm = conexao.prepareStatement(sql);
    stm.setString(1, vcritica);
    stm.setString(2, vavaliacao);

    stm.execute() ;
    stm.close() ;

    out.print("Dados gravados com sucesso!!!");
    out.print("<br><br>") ;
    out.print("<a href='criticasesugestoes.html'>Voltar</a>") ;
%>
