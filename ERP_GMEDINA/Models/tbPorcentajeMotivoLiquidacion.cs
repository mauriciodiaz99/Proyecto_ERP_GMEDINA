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
    
    public partial class tbPorcentajeMotivoLiquidacion
    {
        public int pml_IdPorcentajeMotivoLiquidacion { get; set; }
        public Nullable<int> moli_IdMotivo { get; set; }
        public Nullable<decimal> pml_Preaviso { get; set; }
        public Nullable<decimal> pml_Cesantia { get; set; }
        public Nullable<decimal> pml_DecimoTercerProp { get; set; }
        public Nullable<decimal> pml_DecimoCuartoProp { get; set; }
        public Nullable<decimal> pml_Vacaciones { get; set; }
        public Nullable<int> pml_UsuarioCrea { get; set; }
        public Nullable<System.DateTime> pml_FechaCrea { get; set; }
        public Nullable<int> pml_UsuarioModifica { get; set; }
        public Nullable<System.DateTime> pml_FechaModifica { get; set; }
        public Nullable<bool> pml_Activo { get; set; }
        public string pml_RazonInactivo { get; set; }
    
        public virtual tbUsuario tbUsuario { get; set; }
        public virtual tbUsuario tbUsuario1 { get; set; }
        public virtual tbMotivoLiquidacion tbMotivoLiquidacion { get; set; }
    }
}