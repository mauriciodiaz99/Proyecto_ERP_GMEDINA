//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ERP_GMEDINA.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class V_ReporteInstitucionesFinancieras_RPT
    {
        public int deif_IdDeduccionInstFinanciera { get; set; }
        public int emp_Id { get; set; }
        public int per_Id { get; set; }
        public string per_Nombres { get; set; }
        public int insf_IdInstitucionFinanciera { get; set; }
        public string insf_DescInstitucionFinanc { get; set; }
        public Nullable<decimal> deif_Monto { get; set; }
        public string deif_Comentarios { get; set; }
        public Nullable<System.DateTime> deif_FechaCrea { get; set; }
        public string deif_Pagado { get; set; }
        public string per_Apellidos { get; set; }
        public int cpla_IdPlanilla { get; set; }
        public string cpla_DescripcionPlanilla { get; set; }
    }
}