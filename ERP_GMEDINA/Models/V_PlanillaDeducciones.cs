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
    
    public partial class V_PlanillaDeducciones
    {
        public int cpla_IdPlanilla { get; set; }
        public string cpla_DescripcionPlanilla { get; set; }
        public int cpla_FrecuenciaEnDias { get; set; }
        public int tpdd_IdPlanillaDetDeduccion { get; set; }
        public int cde_IdDeducciones { get; set; }
        public string cde_DescripcionDeduccion { get; set; }
        public int tde_IdTipoDedu { get; set; }
        public string tde_Descripcion { get; set; }
        public decimal cde_PorcentajeColaborador { get; set; }
        public decimal cde_PorcentajeEmpresa { get; set; }
    }
}
