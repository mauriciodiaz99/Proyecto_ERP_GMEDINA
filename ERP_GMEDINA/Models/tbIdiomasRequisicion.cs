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
    
    public partial class tbIdiomasRequisicion
    {
        public int ireq_Id { get; set; }
        public int req_Id { get; set; }
        public int idi_Id { get; set; }
        public bool ireq_Estado { get; set; }
        public string ireq_RazonInactivo { get; set; }
        public int ireq_UsuarioCrea { get; set; }
        public System.DateTime ireq_FechaCrea { get; set; }
        public Nullable<int> ireq_UsuarioModifica { get; set; }
        public Nullable<System.DateTime> ireq_FechaModifica { get; set; }
    
        public virtual tbUsuario tbUsuario { get; set; }
        public virtual tbUsuario tbUsuario1 { get; set; }
        public virtual tbIdioma tbIdioma { get; set; }
        public virtual tbRequisicione tbRequisicione { get; set; }
    }
}
