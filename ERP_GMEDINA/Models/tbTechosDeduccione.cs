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
    
    public partial class tbTechosDeduccione
    {
        public int tddu_IdTechosDeducciones { get; set; }
        public Nullable<decimal> tddu_PorcentajeColaboradores { get; set; }
        public Nullable<decimal> tddu_PorcentajeEmpresa { get; set; }
        public Nullable<decimal> tddu_Techo { get; set; }
        public Nullable<int> cde_IdDeducciones { get; set; }
        public Nullable<bool> tddu_Activo { get; set; }
        public Nullable<int> tddu_UsuarioCrea { get; set; }
        public Nullable<System.DateTime> tddu_FechaCrea { get; set; }
        public Nullable<int> tddu_UsuarioModifica { get; set; }
        public Nullable<System.DateTime> tddu_FechaModifica { get; set; }
    
        public virtual tbUsuario tbUsuario { get; set; }
        public virtual tbUsuario tbUsuario1 { get; set; }
        public virtual tbCatalogoDeDeduccione tbCatalogoDeDeduccione { get; set; }
    }
}