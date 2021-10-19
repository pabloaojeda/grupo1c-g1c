namespace API.Models
{
    using System;
    using System.Collections.Generic;
    
    public class Cliente
    {
        public Cliente()
        {            
        }

        public Cliente (Int64 cuit_Cuil)
        {
          this.Cuit_Cuil = cuit_Cuil;
        }

        public Cliente(int iD_Cliente)
        {
          this.ID_Cliente = iD_Cliente;
        }

        public Cliente(Int64 cuit_Cuil, string nombre, string apellido, string password, string mail, int iD_Localidad, string foto_Frontal, string dNI_delante, string dNI_detras, string domicilio)
        {
          this.Cuit_Cuil = cuit_Cuil;
          this.Nombre = nombre;
          this.Apellido = apellido;
          this.Password = password;
          this.Mail = mail;
          this.ID_Localidad = iD_Localidad;
          this.Foto_Frontal = foto_Frontal;
          this.DNI_delante = dNI_delante;
          this.DNI_detras = dNI_detras;
          this.Domicilio = domicilio;
        }

        public Int64 Cuit_Cuil { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Password { get; set; }
        public string Mail { get; set; }
        public int ID_Localidad { get; set; }
        public string Foto_Frontal { get; set; }
        public string DNI_delante { get; set; }
        public string DNI_detras { get; set; }
        public string Domicilio { get; set; }
        public int ID_Cliente { get; }
    
        //public virtual Localidad Localidad { get; }
        
        //public virtual ICollection<Cuenta> Cuentas { get; set; }
    }
}
