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
    
    public partial class tbTitulosPersona
    {
        public int tipe_Id { get; set; }
        public int per_Id { get; set; }
        public int titu_Id { get; set; }
        public bool tipe_Estado { get; set; }
        public string tipe_RazonInactivo { get; set; }
        public int tipe_UsuarioCrea { get; set; }
        public Nullable<System.DateTime> tipe_FechaCrea { get; set; }
        public Nullable<int> tipe_UsuarioModifica { get; set; }
        public Nullable<System.DateTime> tipe_FechaModifica { get; set; }
    
        public virtual tbUsuario tbUsuario { get; set; }
        public virtual tbUsuario tbUsuario1 { get; set; }
        public virtual tbPersona tbPersona { get; set; }
        public virtual tbTitulo tbTitulo { get; set; }
    }
}
