using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace API.Models
{
  public class GestorLogin
  {
    string conection = ConfigurationManager.ConnectionStrings["PilWalletEntities"].ToString();
    
 

    public bool ValidarLogin(LoginRequest cLoginRequest)
    {
      bool result = false;
      using (SqlConnection cx = new SqlConnection(conection))
      {
        cx.Open();

        SqlCommand cm = cx.CreateCommand();
        cm.CommandText = "SELECT Mail,Password FROM Cliente WHERE mail = @Mail AND password=@Password";
        cm.Parameters.Add(new SqlParameter("@Mail", cLoginRequest.Mail));
        cm.Parameters.Add(new SqlParameter("@Password", cLoginRequest.Password));

        SqlDataReader reader = cm.ExecuteReader();

        if (reader.HasRows)
        {
          result = true;
        }
        else
        {
          result = false;
        }

      }
      return result;
    }

    internal bool ValidarLogin(object loguin)
    {
      throw new NotImplementedException();
    }
  }
}
