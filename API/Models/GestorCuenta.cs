using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace API.Models
{
  public class GestorCuenta
  {
    string conection = ConfigurationManager.ConnectionStrings["PilWalletEntities"].ToString();

    public void CrearCuenta(Cuenta nueva)
    {
      SqlConnection cx = new SqlConnection(conection);
      cx.Open();

      SqlCommand cm = cx.CreateCommand();
      cm.CommandText = "INSERT INTO Cuenta(cBU, iD_Cliente, iD_Tipo_Cuenta ) VALUES (@CBU, @ID_Cliente, @ID_Tipo_Cuenta)";
      cm.Parameters.Add(new SqlParameter("@CBU", nueva.CBU));
      cm.Parameters.Add(new SqlParameter("@ID_Cliente", nueva.ID_Cliente));
      cm.Parameters.Add(new SqlParameter("@ID_Tipo_Cuenta", nueva.ID_Tipo_Cuenta));
      
      cm.ExecuteNonQuery();

      cx.Close();
    }

    public void ModificarIDBalanceYCBU(int iD_Cuenta, string cBU)
    {

      SqlConnection cx = new SqlConnection(conection);

      cx.Open();

      SqlCommand cm = cx.CreateCommand();
      cm.CommandText = "UPDATE Cuenta SET cBU=@CBU WHERE iD_Cuenta = @ID_Cuenta";
      cm.Parameters.Add(new SqlParameter("@ID_Cuenta", iD_Cuenta));
     
      cm.Parameters.Add(new SqlParameter("@CBU", cBU));
      
      cm.ExecuteNonQuery();

      cx.Close();

    }


    public int obtenerCuentaID(int iD_Cliente, int iD_Tipo_Cuenta)
    {
      int iDBuscado = 0;
      SqlConnection cx = new SqlConnection(conection);
      cx.Open();

      SqlCommand cm = cx.CreateCommand();
      cm.CommandText = "SELECT ID_Cuenta FROM Cuenta WHERE ID_Cliente = @iD_Cliente AND ID_Tipo_Cuenta = @iD_Tipo_Cuenta";
      cm.Parameters.Add(new SqlParameter("@iD_Cliente", iD_Cliente));
      cm.Parameters.Add(new SqlParameter("@iD_Tipo_Cuenta", iD_Tipo_Cuenta));

      SqlDataReader dr = cm.ExecuteReader();
      if (dr.Read())
      {
        int iD_Cuenta = dr.GetInt32(0);

        iDBuscado = iD_Cuenta;
      }
      dr.Close();
      cx.Close();


      return iDBuscado;
    }

    public int obtenerIDporCBU(string cBU)
    {
      int iDBuscado = 0;
      SqlConnection cx = new SqlConnection(conection);
      cx.Open();

      SqlCommand cm = cx.CreateCommand();
      cm.CommandText = "SELECT ID_Cuenta FROM Cuenta WHERE cBU = @CBU";
      cm.Parameters.Add(new SqlParameter("@CBU", cBU));
     

      SqlDataReader dr = cm.ExecuteReader();
      if (dr.Read())
      {
        int iD_Cuenta = dr.GetInt32(0);

        iDBuscado = iD_Cuenta;
      }
      dr.Close();
      cx.Close();


      return iDBuscado;
    }

    public List<Cuenta> ListarCuenta(int iD_Cliente)
    {
      var listaCuenta = new List<Cuenta>();

      SqlConnection cx = new SqlConnection(conection);
      cx.Open();

      SqlCommand cm = cx.CreateCommand();
      cm.CommandText = "SELECT * FROM Cuenta WHERE ID_Cliente = @iD_Cliente";
      cm.Parameters.Add(new SqlParameter("@iD_Cliente", iD_Cliente));

      SqlDataReader dr = cm.ExecuteReader();
      while (dr.Read())
      {
        int iD_Cuenta = dr.GetInt32(0);
        string cBU = dr.GetString(1).Trim();        
        int iD_Tipo_Cuenta = dr.GetInt32(3);

        Cuenta c = new Cuenta(iD_Cuenta, cBU, iD_Cliente, iD_Tipo_Cuenta);
        listaCuenta.Add(c);
      }

      dr.Close();
      cx.Close();

      return listaCuenta;
    }
  }
}
