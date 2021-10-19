using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace API.Models
{
  public class GestorBalance
  {
    string conection = ConfigurationManager.ConnectionStrings["PilWalletEntities"].ToString();

    public void CrearBalance(Balance nuevoBalance)
    {
      SqlConnection cx = new SqlConnection(conection);
      cx.Open();

      SqlCommand cm = cx.CreateCommand();
      cm.CommandText = "INSERT INTO Balance (iD_Cuenta, iD_Tipo_Cuenta, balance1) VALUES (@ID_Cuenta, @ID_Tipo_Cuenta, @Balance1)";
      cm.Parameters.Add(new SqlParameter("@ID_Cuenta", nuevoBalance.ID_Cuenta));
      cm.Parameters.Add(new SqlParameter("@ID_Tipo_Cuenta", nuevoBalance.ID_Tipo_Cuenta));
      cm.Parameters.Add(new SqlParameter("@Balance1", nuevoBalance.Balance1));
      

      cm.ExecuteNonQuery();

      cx.Close();
    }

    public decimal obtenerBalancePorID(int iD_Cuenta)
    {
      decimal balanceBuscado = 0;
      SqlConnection cx = new SqlConnection(conection);
      cx.Open();

      SqlCommand cm = cx.CreateCommand();
      cm.CommandText = "SELECT Balance1 FROM Balance WHERE ID_Cuenta = @iD_Cuenta";
      cm.Parameters.Add(new SqlParameter("@iD_Cuenta", iD_Cuenta));
      

      SqlDataReader dr = cm.ExecuteReader();
      if (dr.Read())
      {
        decimal balance = dr.GetDecimal(0);

        balanceBuscado = balance;
      }
      dr.Close();
      cx.Close();

      return balanceBuscado;
    }


    public List<Balance> ObtenerBalancesPorId(int iD_Cuenta)
    {
      List<Balance> listaBalancesPorCuenta = new List<Balance>();

      SqlConnection cx = new SqlConnection(conection);
      cx.Open();

      SqlCommand cm = cx.CreateCommand();
      cm.CommandText = "SELECT * FROM Balance WHERE iD_Cuenta = @ID_Cuenta";
      cm.Parameters.Add(new SqlParameter("@ID_Cuenta", iD_Cuenta));

      SqlDataReader dr = cm.ExecuteReader();

      while (dr.Read())
      {
        int ID_Tipo_Cuenta = dr.GetInt32(1);
        decimal Balance = dr.GetDecimal(2);
        int ID_Cuenta = iD_Cuenta;

        Balance cBalance = new Balance(ID_Cuenta, ID_Tipo_Cuenta, Balance);
        listaBalancesPorCuenta.Add(cBalance);
      }

      dr.Close();
      cx.Close();

      return listaBalancesPorCuenta;
    }
    public void ModificarBalance(int iD_Cuenta, decimal balance)
    {
      SqlConnection cx = new SqlConnection(conection);
      cx.Open();
      SqlCommand cm = cx.CreateCommand();
      cm.CommandText = "UPDATE Balance SET balance1=@Balance1 WHERE iD_Cuenta = @ID_Cuenta";
      cm.Parameters.Add(new SqlParameter("@ID_Cuenta", iD_Cuenta));
      cm.Parameters.Add(new SqlParameter("@Balance1", balance));
      cm.ExecuteNonQuery();

      cx.Close();
    }

  }
}
