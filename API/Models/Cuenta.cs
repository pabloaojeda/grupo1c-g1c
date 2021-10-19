namespace API.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Cuenta
    {
        public Cuenta()
        {
        }

        public Cuenta(int iD_Cuenta)
        {
          this.ID_Cuenta = iD_Cuenta;
        }

        public Cuenta(string cBU, int iD_Cliente, int iD_Tipo_Cuenta )
        {          
          this.CBU = cBU;
          this.ID_Cliente = iD_Cliente;
          this.ID_Tipo_Cuenta = iD_Tipo_Cuenta;
        }

        public Cuenta(int iD_Cuenta,string cBU, int iD_Cliente, int iD_Tipo_Cuenta)
        {
          this.ID_Cuenta = iD_Cuenta;
          this.CBU = cBU;
          this.ID_Cliente = iD_Cliente;
          this.ID_Tipo_Cuenta = iD_Tipo_Cuenta;
        }


        public int ID_Cuenta { get; }
        public string CBU { get; set; }
        public int ID_Cliente { get; set; }
        public int ID_Tipo_Cuenta { get; set; }
        
        
    
        //public virtual Cliente Cliente { get; }
        //public virtual Tipo_Cuenta Tipo_Cuenta { get; }
        //public virtual Movimiento Movimiento { get; set; }
    }
}
