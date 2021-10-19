using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace API.Models
{
  public class GestorTipoMovimientos
  {
    string conection = ConfigurationManager.ConnectionStrings["PilWalletEntities"].ToString();

    public List<Tipo_Movimientos> ObtenerTipoMovimientos()
    {
      List<Tipo_Movimientos> listaTipoMovimientos = new List<Tipo_Movimientos>();

      SqlConnection cx = new SqlConnection(conection);
      cx.Open();

      SqlCommand cm = cx.CreateCommand();
      cm.CommandText = "SELECT * FROM Tipo_Movimientos";

      SqlDataReader dr = cm.ExecuteReader();

      while (dr.Read())
      {
        int ID_tipo_Movimiento = dr.GetInt32(0);
        string Tipo_Movimiento = dr.GetString(1).Trim();
        

        Tipo_Movimientos TMov = new Tipo_Movimientos(ID_tipo_Movimiento, Tipo_Movimiento);
        listaTipoMovimientos.Add(TMov);
      }

      dr.Close();
      cx.Close();

      return listaTipoMovimientos;
    }
  }
}
