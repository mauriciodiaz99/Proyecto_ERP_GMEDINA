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
    
    public partial class tbCatalogoDeDeducciones
    {
        public int cde_IdDeducciones { get; set; }
        public string cde_DescripcionDeduccion { get; set; }
        public int tde_IdTipoDedu { get; set; }
        public decimal cde_PorcentajeColaborador { get; set; }
        public decimal cde_PorcentajeEmpresa { get; set; }
        public int cde_UsuarioCrea { get; set; }
        public System.DateTime cde_FechaCrea { get; set; }
        public Nullable<int> cde_UsuarioModifica { get; set; }
        public Nullable<System.DateTime> cde_FechaModifica { get; set; }
        public bool cde_Activo { get; set; }
    
        public virtual tbUsuario tbUsuario { get; set; }
        public virtual tbUsuario tbUsuario1 { get; set; }
        public virtual tbTipoDeduccion tbTipoDeduccion { get; set; }
    }
}
