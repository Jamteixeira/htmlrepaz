<%@page language="java" import="java.sql.*" %>
<%
    //cria as variaveis para armazenar as informações 
    //digitadas pelo usuário

    String vnome=  request.getParameter("nome");
    String vemail= request.getParameter("email");
    String vcurso= request.getParameter("curso");

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
    conexao = DriverManager.getConnection(endereco,usuario,senha);

    //Cria a variavel sql como o comando INSERT
    String sql = "INSERT INTO cursos (nome,email,curso) values (?,?,?)" ;

    PreparedStatement stm = conexao.prepareStatement(sql) ;
    stm.setString( 1 , vnome) ;
    stm.setString( 2 , vemail ) ;
    stm.setString( 3 , vcurso ) ;

    stm.execute() ;
    stm.close() ;

    out.print("Cadastro feito com sucesso!!!");
    out.print("<br><br>") ;
    out.print("<a href='cursos.html'>Voltar</a>") ;
%>
