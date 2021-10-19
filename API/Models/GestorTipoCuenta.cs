using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace API.Models
{
  public class GestorTipoCuenta
  {
    string conection = ConfigurationManager.ConnectionStrings["PilWalletEntities"].ToString();

    public List<Tipo_Cuenta> ObtenerTipoCuenta()
    {
      List<Tipo_Cuenta> listaTipoCuenta = new List<Tipo_Cuenta>();

      SqlConnection cx = new SqlConnection(conection);
      cx.Open();

      SqlCommand cm = cx.CreateCommand();
      cm.CommandText = "SELECT * FROM Tipo_Cuenta";

      SqlDataReader dr = cm.ExecuteReader();

      while (dr.Read())
      {
        int ID_Tipo_Cuenta = dr.GetInt32(0);
        string Tipo_Cuenta1 = dr.GetString(1).Trim();


        Tipo_Cuenta TCue = new Tipo_Cuenta(ID_Tipo_Cuenta, Tipo_Cuenta1);
        listaTipoCuenta.Add(TCue);
      }

      dr.Close();
      cx.Close();

      return listaTipoCuenta;
    }


  }
}
