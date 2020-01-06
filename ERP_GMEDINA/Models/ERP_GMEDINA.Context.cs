﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class ERP_GMEDINAEntities : DbContext
    {
        public ERP_GMEDINAEntities()
            : base("name=ERP_GMEDINAEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<tbUsuario> tbUsuario { get; set; }
        public virtual DbSet<tbFasesReclutamiento> tbFasesReclutamiento { get; set; }
        public virtual DbSet<tbRequisiciones> tbRequisiciones { get; set; }
        public virtual DbSet<tbPersonas> tbPersonas { get; set; }
        public virtual DbSet<tbHistorialAmonestaciones> tbHistorialAmonestaciones { get; set; }
        public virtual DbSet<tbSueldos> tbSueldos { get; set; }
        public virtual DbSet<tbAreas> tbAreas { get; set; }
        public virtual DbSet<tbCargos> tbCargos { get; set; }
        public virtual DbSet<tbCompetencias> tbCompetencias { get; set; }
        public virtual DbSet<tbCompetenciasPersona> tbCompetenciasPersona { get; set; }
        public virtual DbSet<tbCompetenciasRequisicion> tbCompetenciasRequisicion { get; set; }
        public virtual DbSet<tbDepartamentos> tbDepartamentos { get; set; }
        public virtual DbSet<tbEmpleados> tbEmpleados { get; set; }
        public virtual DbSet<tbEmpresas> tbEmpresas { get; set; }
        public virtual DbSet<tbEquipoEmpleados> tbEquipoEmpleados { get; set; }
        public virtual DbSet<tbEquipoTrabajo> tbEquipoTrabajo { get; set; }
        public virtual DbSet<tbHabilidades> tbHabilidades { get; set; }
        public virtual DbSet<tbHabilidadesPersona> tbHabilidadesPersona { get; set; }
        public virtual DbSet<tbHabilidadesRequisicion> tbHabilidadesRequisicion { get; set; }
        public virtual DbSet<tbHistorialAudienciaDescargo> tbHistorialAudienciaDescargo { get; set; }
        public virtual DbSet<tbHistorialCargos> tbHistorialCargos { get; set; }
        public virtual DbSet<tbHistorialContrataciones> tbHistorialContrataciones { get; set; }
        public virtual DbSet<tbHistorialHorasTrabajadas> tbHistorialHorasTrabajadas { get; set; }
        public virtual DbSet<tbHistorialIncapacidades> tbHistorialIncapacidades { get; set; }
        public virtual DbSet<tbHistorialPermisos> tbHistorialPermisos { get; set; }
        public virtual DbSet<tbHistorialRefrendamientos> tbHistorialRefrendamientos { get; set; }
        public virtual DbSet<tbHistorialSalidas> tbHistorialSalidas { get; set; }
        public virtual DbSet<tbHistorialVacaciones> tbHistorialVacaciones { get; set; }
        public virtual DbSet<tbHorarios> tbHorarios { get; set; }
        public virtual DbSet<tbIdiomaPersona> tbIdiomaPersona { get; set; }
        public virtual DbSet<tbIdiomas> tbIdiomas { get; set; }
        public virtual DbSet<tbIdiomasRequisicion> tbIdiomasRequisicion { get; set; }
        public virtual DbSet<tbJornadas> tbJornadas { get; set; }
        public virtual DbSet<tbNacionalidades> tbNacionalidades { get; set; }
        public virtual DbSet<tbPrestaciones> tbPrestaciones { get; set; }
        public virtual DbSet<tbRazonSalidas> tbRazonSalidas { get; set; }
        public virtual DbSet<tbRequerimientosEspeciales> tbRequerimientosEspeciales { get; set; }
        public virtual DbSet<tbRequerimientosEspecialesPersona> tbRequerimientosEspecialesPersona { get; set; }
        public virtual DbSet<tbRequerimientosEspecialesRequisicion> tbRequerimientosEspecialesRequisicion { get; set; }
        public virtual DbSet<tbSucursales> tbSucursales { get; set; }
        public virtual DbSet<tbTipoAmonestaciones> tbTipoAmonestaciones { get; set; }
        public virtual DbSet<tbTipoHoras> tbTipoHoras { get; set; }
        public virtual DbSet<tbTipoIncapacidades> tbTipoIncapacidades { get; set; }
        public virtual DbSet<tbTipoMonedas> tbTipoMonedas { get; set; }
        public virtual DbSet<tbTipoPermisos> tbTipoPermisos { get; set; }
        public virtual DbSet<tbTipoSalidas> tbTipoSalidas { get; set; }
        public virtual DbSet<tbTitulos> tbTitulos { get; set; }
        public virtual DbSet<tbTitulosPersona> tbTitulosPersona { get; set; }
        public virtual DbSet<tbTitulosRequisicion> tbTitulosRequisicion { get; set; }
        public virtual DbSet<tbSeleccionCandidatos> tbSeleccionCandidatos { get; set; }
        public virtual DbSet<tbFaseSeleccion> tbFaseSeleccion { get; set; }
        public virtual DbSet<V_SeleccionCandidatos> V_SeleccionCandidatos { get; set; }
        public virtual DbSet<tbCatalogoDePlanillas> tbCatalogoDePlanillas { get; set; }
        public virtual DbSet<tbFormaPago> tbFormaPago { get; set; }
    
        public virtual ObjectResult<UDP_RRHH_tbSeleccionCandidatos_Delete_Result> UDP_RRHH_tbSeleccionCandidatos_Delete(Nullable<int> scan_Id, string scan_RazonInactivo, Nullable<int> scan_UsuarioModifica, Nullable<System.DateTime> scan_FechaModifica)
        {
            var scan_IdParameter = scan_Id.HasValue ?
                new ObjectParameter("scan_Id", scan_Id) :
                new ObjectParameter("scan_Id", typeof(int));
    
            var scan_RazonInactivoParameter = scan_RazonInactivo != null ?
                new ObjectParameter("scan_RazonInactivo", scan_RazonInactivo) :
                new ObjectParameter("scan_RazonInactivo", typeof(string));
    
            var scan_UsuarioModificaParameter = scan_UsuarioModifica.HasValue ?
                new ObjectParameter("scan_UsuarioModifica", scan_UsuarioModifica) :
                new ObjectParameter("scan_UsuarioModifica", typeof(int));
    
            var scan_FechaModificaParameter = scan_FechaModifica.HasValue ?
                new ObjectParameter("scan_FechaModifica", scan_FechaModifica) :
                new ObjectParameter("scan_FechaModifica", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<UDP_RRHH_tbSeleccionCandidatos_Delete_Result>("UDP_RRHH_tbSeleccionCandidatos_Delete", scan_IdParameter, scan_RazonInactivoParameter, scan_UsuarioModificaParameter, scan_FechaModificaParameter);
        }
    
        public virtual ObjectResult<UDP_RRHH_tbSeleccionCandidatos_Insert_Result> UDP_RRHH_tbSeleccionCandidatos_Insert(Nullable<int> per_Id, Nullable<int> fare_Id, Nullable<System.DateTime> scan_Fecha, Nullable<int> req_Id, Nullable<int> scan_UsuarioCrea, Nullable<System.DateTime> scan_FechaCrea)
        {
            var per_IdParameter = per_Id.HasValue ?
                new ObjectParameter("per_Id", per_Id) :
                new ObjectParameter("per_Id", typeof(int));
    
            var fare_IdParameter = fare_Id.HasValue ?
                new ObjectParameter("fare_Id", fare_Id) :
                new ObjectParameter("fare_Id", typeof(int));
    
            var scan_FechaParameter = scan_Fecha.HasValue ?
                new ObjectParameter("scan_Fecha", scan_Fecha) :
                new ObjectParameter("scan_Fecha", typeof(System.DateTime));
    
            var req_IdParameter = req_Id.HasValue ?
                new ObjectParameter("req_Id", req_Id) :
                new ObjectParameter("req_Id", typeof(int));
    
            var scan_UsuarioCreaParameter = scan_UsuarioCrea.HasValue ?
                new ObjectParameter("scan_UsuarioCrea", scan_UsuarioCrea) :
                new ObjectParameter("scan_UsuarioCrea", typeof(int));
    
            var scan_FechaCreaParameter = scan_FechaCrea.HasValue ?
                new ObjectParameter("scan_FechaCrea", scan_FechaCrea) :
                new ObjectParameter("scan_FechaCrea", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<UDP_RRHH_tbSeleccionCandidatos_Insert_Result>("UDP_RRHH_tbSeleccionCandidatos_Insert", per_IdParameter, fare_IdParameter, scan_FechaParameter, req_IdParameter, scan_UsuarioCreaParameter, scan_FechaCreaParameter);
        }
    
        public virtual ObjectResult<UDP_RRHH_tbSeleccionCandidatos_Update_Result> UDP_RRHH_tbSeleccionCandidatos_Update(Nullable<int> scan_Id, Nullable<int> fare_Id, Nullable<System.DateTime> scan_Fecha, Nullable<int> req_Id, Nullable<int> scan_UsuarioModifica, Nullable<System.DateTime> scan_FechaModifica)
        {
            var scan_IdParameter = scan_Id.HasValue ?
                new ObjectParameter("scan_Id", scan_Id) :
                new ObjectParameter("scan_Id", typeof(int));
    
            var fare_IdParameter = fare_Id.HasValue ?
                new ObjectParameter("fare_Id", fare_Id) :
                new ObjectParameter("fare_Id", typeof(int));
    
            var scan_FechaParameter = scan_Fecha.HasValue ?
                new ObjectParameter("scan_Fecha", scan_Fecha) :
                new ObjectParameter("scan_Fecha", typeof(System.DateTime));
    
            var req_IdParameter = req_Id.HasValue ?
                new ObjectParameter("req_Id", req_Id) :
                new ObjectParameter("req_Id", typeof(int));
    
            var scan_UsuarioModificaParameter = scan_UsuarioModifica.HasValue ?
                new ObjectParameter("scan_UsuarioModifica", scan_UsuarioModifica) :
                new ObjectParameter("scan_UsuarioModifica", typeof(int));
    
            var scan_FechaModificaParameter = scan_FechaModifica.HasValue ?
                new ObjectParameter("scan_FechaModifica", scan_FechaModifica) :
                new ObjectParameter("scan_FechaModifica", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<UDP_RRHH_tbSeleccionCandidatos_Update_Result>("UDP_RRHH_tbSeleccionCandidatos_Update", scan_IdParameter, fare_IdParameter, scan_FechaParameter, req_IdParameter, scan_UsuarioModificaParameter, scan_FechaModificaParameter);
        }
    
        public virtual ObjectResult<UDP_RRHH_tbEmpleados_Insert_Result> UDP_RRHH_tbEmpleados_Insert(Nullable<int> scan_Id, Nullable<int> per_Id, Nullable<int> car_Id, Nullable<int> area_Id, Nullable<int> depto_Id, Nullable<int> jor_Id, Nullable<int> cpla_IdPlanilla, Nullable<int> fpa_IdFormaPago, string emp_CuentaBancaria, Nullable<bool> emp_Reingreso, Nullable<System.DateTime> emp_Fechaingreso, Nullable<int> emp_UsuarioCrea, Nullable<System.DateTime> emp_FechaCrea)
        {
            var scan_IdParameter = scan_Id.HasValue ?
                new ObjectParameter("scan_Id", scan_Id) :
                new ObjectParameter("scan_Id", typeof(int));
    
            var per_IdParameter = per_Id.HasValue ?
                new ObjectParameter("per_Id", per_Id) :
                new ObjectParameter("per_Id", typeof(int));
    
            var car_IdParameter = car_Id.HasValue ?
                new ObjectParameter("car_Id", car_Id) :
                new ObjectParameter("car_Id", typeof(int));
    
            var area_IdParameter = area_Id.HasValue ?
                new ObjectParameter("area_Id", area_Id) :
                new ObjectParameter("area_Id", typeof(int));
    
            var depto_IdParameter = depto_Id.HasValue ?
                new ObjectParameter("depto_Id", depto_Id) :
                new ObjectParameter("depto_Id", typeof(int));
    
            var jor_IdParameter = jor_Id.HasValue ?
                new ObjectParameter("jor_Id", jor_Id) :
                new ObjectParameter("jor_Id", typeof(int));
    
            var cpla_IdPlanillaParameter = cpla_IdPlanilla.HasValue ?
                new ObjectParameter("cpla_IdPlanilla", cpla_IdPlanilla) :
                new ObjectParameter("cpla_IdPlanilla", typeof(int));
    
            var fpa_IdFormaPagoParameter = fpa_IdFormaPago.HasValue ?
                new ObjectParameter("fpa_IdFormaPago", fpa_IdFormaPago) :
                new ObjectParameter("fpa_IdFormaPago", typeof(int));
    
            var emp_CuentaBancariaParameter = emp_CuentaBancaria != null ?
                new ObjectParameter("emp_CuentaBancaria", emp_CuentaBancaria) :
                new ObjectParameter("emp_CuentaBancaria", typeof(string));
    
            var emp_ReingresoParameter = emp_Reingreso.HasValue ?
                new ObjectParameter("emp_Reingreso", emp_Reingreso) :
                new ObjectParameter("emp_Reingreso", typeof(bool));
    
            var emp_FechaingresoParameter = emp_Fechaingreso.HasValue ?
                new ObjectParameter("emp_Fechaingreso", emp_Fechaingreso) :
                new ObjectParameter("emp_Fechaingreso", typeof(System.DateTime));
    
            var emp_UsuarioCreaParameter = emp_UsuarioCrea.HasValue ?
                new ObjectParameter("emp_UsuarioCrea", emp_UsuarioCrea) :
                new ObjectParameter("emp_UsuarioCrea", typeof(int));
    
            var emp_FechaCreaParameter = emp_FechaCrea.HasValue ?
                new ObjectParameter("emp_FechaCrea", emp_FechaCrea) :
                new ObjectParameter("emp_FechaCrea", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<UDP_RRHH_tbEmpleados_Insert_Result>("UDP_RRHH_tbEmpleados_Insert", scan_IdParameter, per_IdParameter, car_IdParameter, area_IdParameter, depto_IdParameter, jor_IdParameter, cpla_IdPlanillaParameter, fpa_IdFormaPagoParameter, emp_CuentaBancariaParameter, emp_ReingresoParameter, emp_FechaingresoParameter, emp_UsuarioCreaParameter, emp_FechaCreaParameter);
        }
    
        public virtual ObjectResult<UDP_RRHH_tbEmpleados_Recontratacion_Result> UDP_RRHH_tbEmpleados_Recontratacion(Nullable<int> scan_Id, Nullable<int> per_Id, Nullable<int> car_Id, Nullable<int> area_Id, Nullable<int> depto_Id, Nullable<int> jor_Id, Nullable<int> cpla_IdPlanilla, Nullable<int> fpa_IdFormaPago, string emp_CuentaBancaria, Nullable<bool> emp_Reingreso, Nullable<System.DateTime> emp_Fechareingreso, Nullable<int> emp_UsuarioCrea, Nullable<System.DateTime> emp_FechaCrea)
        {
            var scan_IdParameter = scan_Id.HasValue ?
                new ObjectParameter("scan_Id", scan_Id) :
                new ObjectParameter("scan_Id", typeof(int));
    
            var per_IdParameter = per_Id.HasValue ?
                new ObjectParameter("per_Id", per_Id) :
                new ObjectParameter("per_Id", typeof(int));
    
            var car_IdParameter = car_Id.HasValue ?
                new ObjectParameter("car_Id", car_Id) :
                new ObjectParameter("car_Id", typeof(int));
    
            var area_IdParameter = area_Id.HasValue ?
                new ObjectParameter("area_Id", area_Id) :
                new ObjectParameter("area_Id", typeof(int));
    
            var depto_IdParameter = depto_Id.HasValue ?
                new ObjectParameter("depto_Id", depto_Id) :
                new ObjectParameter("depto_Id", typeof(int));
    
            var jor_IdParameter = jor_Id.HasValue ?
                new ObjectParameter("jor_Id", jor_Id) :
                new ObjectParameter("jor_Id", typeof(int));
    
            var cpla_IdPlanillaParameter = cpla_IdPlanilla.HasValue ?
                new ObjectParameter("cpla_IdPlanilla", cpla_IdPlanilla) :
                new ObjectParameter("cpla_IdPlanilla", typeof(int));
    
            var fpa_IdFormaPagoParameter = fpa_IdFormaPago.HasValue ?
                new ObjectParameter("fpa_IdFormaPago", fpa_IdFormaPago) :
                new ObjectParameter("fpa_IdFormaPago", typeof(int));
    
            var emp_CuentaBancariaParameter = emp_CuentaBancaria != null ?
                new ObjectParameter("emp_CuentaBancaria", emp_CuentaBancaria) :
                new ObjectParameter("emp_CuentaBancaria", typeof(string));
    
            var emp_ReingresoParameter = emp_Reingreso.HasValue ?
                new ObjectParameter("emp_Reingreso", emp_Reingreso) :
                new ObjectParameter("emp_Reingreso", typeof(bool));
    
            var emp_FechareingresoParameter = emp_Fechareingreso.HasValue ?
                new ObjectParameter("emp_Fechareingreso", emp_Fechareingreso) :
                new ObjectParameter("emp_Fechareingreso", typeof(System.DateTime));
    
            var emp_UsuarioCreaParameter = emp_UsuarioCrea.HasValue ?
                new ObjectParameter("emp_UsuarioCrea", emp_UsuarioCrea) :
                new ObjectParameter("emp_UsuarioCrea", typeof(int));
    
            var emp_FechaCreaParameter = emp_FechaCrea.HasValue ?
                new ObjectParameter("emp_FechaCrea", emp_FechaCrea) :
                new ObjectParameter("emp_FechaCrea", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<UDP_RRHH_tbEmpleados_Recontratacion_Result>("UDP_RRHH_tbEmpleados_Recontratacion", scan_IdParameter, per_IdParameter, car_IdParameter, area_IdParameter, depto_IdParameter, jor_IdParameter, cpla_IdPlanillaParameter, fpa_IdFormaPagoParameter, emp_CuentaBancariaParameter, emp_ReingresoParameter, emp_FechareingresoParameter, emp_UsuarioCreaParameter, emp_FechaCreaParameter);
        }
    }
}
