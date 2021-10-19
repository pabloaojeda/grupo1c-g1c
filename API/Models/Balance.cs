namespace API.Models
{
  using System;
  using System.Collections.Generic;

  public class Balance
  {
    public Balance()
    {
    }

    public Balance(int iD_Balance)
    {
      this.ID_Balance = iD_Balance;
    }

    public Balance(int iD_Cuenta, int iD_Tipo_Cuenta, decimal balance)
    {
      this.ID_Cuenta = iD_Cuenta;
      this.ID_Tipo_Cuenta = iD_Tipo_Cuenta;
      this.Balance1 = balance;

    }

    public int ID_Balance { get; }
    public int ID_Tipo_Cuenta { get; set; }
    public decimal Balance1 { get; set; }
    public int ID_Cuenta { get; set; }
  }
}
