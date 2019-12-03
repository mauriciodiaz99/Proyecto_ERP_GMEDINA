//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ERP_GMEDINA.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class tbLiquidacione
    {
        public int liqu_IdLiquidacion { get; set; }
        public int emp_Id { get; set; }
        public int prea_IdPreaviso { get; set; }
        public int pvac_IdPagoVacaciones { get; set; }
        public int aces_IdAuxilioCesantia { get; set; }
        public int mliq_IdMotivoLiquidacion { get; set; }
        public int liqu_UsuarioCrea { get; set; }
        public System.DateTime liqu_FechaCrea { get; set; }
        public Nullable<int> liqu_UsuarioModifica { get; set; }
        public Nullable<System.DateTime> liqu_FechaModifica { get; set; }
        public bool liqu_Activo { get; set; }
    
        public virtual tbUsuario tbUsuario { get; set; }
        public virtual tbUsuario tbUsuario1 { get; set; }
        public virtual tbAuxilioDeCesantia tbAuxilioDeCesantia { get; set; }
        public virtual tbLiquidacionVacacione tbLiquidacionVacacione { get; set; }
        public virtual tbMotivoLiquidacione tbMotivoLiquidacione { get; set; }
        public virtual tbPreaviso tbPreaviso { get; set; }
        public virtual tbEmpleado tbEmpleado { get; set; }
    }
}
