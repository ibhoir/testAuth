<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.util.Hashtable, javax.naming.Context,  javax.naming.NamingException,javax.naming.ldap.InitialLdapContext,javax.naming.ldap.LdapContext"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
  String ldapUsername = request.getParameter("username");
  String ldapPassword = request.getParameter("password");
  
  String LDAPURL = System.getenv("LDAP_URL");
  
  //out.println("LDAPURL"+ LDAPURL );
  
  try {
			final String ldapAdServer = LDAPURL;
			final String ldapSearchBase = "dc=corp, dc=cox,dc=com";
			
						
			Hashtable<String, Object> env = new Hashtable<String, Object>();
			env.put(Context.SECURITY_AUTHENTICATION, "simple");
			if(ldapUsername != null) {
			    env.put(Context.SECURITY_PRINCIPAL, ldapUsername);
			}
			if(ldapPassword != null) {
			    env.put(Context.SECURITY_CREDENTIALS, ldapPassword);
			}
			env.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
			env.put(Context.PROVIDER_URL, ldapAdServer);

			//ensures that objectSID attribute values
			//will be returned as a byte[] instead of a String
			env.put("java.naming.ldap.attributes.binary", "objectSID");
			
			// the following is helpful in debugging errors
			//env.put("com.sun.jndi.ldap.trace.ber", System.err);
			
			LdapContext ctx = new InitialLdapContext(env, null);
			
			
			out.println("LDAP Connection succesfull  -====");
			//1) lookup the ldap account
	       // SearchResult srLdapUser = ldap.findAccountByAccountName(ctx, ldapSearchBase, ldapAccountToLookup);
	        //System.out.println(srLdapUser);
	     
			if (ctx != null) {
				
				ctx.close();
			}
			
			 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			out.println("LDAP Connection Failed  -====");
			e.printStackTrace();
		}
  
  
%>

</body>
</html>
