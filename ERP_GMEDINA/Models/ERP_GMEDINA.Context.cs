﻿//------------------------------------------------------------------------------
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
        public virtual DbSet<tbHabilidades> tbHabilidades { get; set; }
        public virtual DbSet<tbTipoSalidas> tbTipoSalidas { get; set; }
        public virtual DbSet<tbAreas> tbAreas { get; set; }
        public virtual DbSet<tbCargos> tbCargos { get; set; }
        public virtual DbSet<tbDepartamentos> tbDepartamentos { get; set; }
        public virtual DbSet<V_Departamentos> V_Departamentos { get; set; }
        public virtual DbSet<tbSucursales> tbSucursales { get; set; }
        public virtual DbSet<tbEmpleados> tbEmpleados { get; set; }
        public virtual DbSet<tbPersonas> tbPersonas { get; set; }
    
        public virtual ObjectResult<UDP_RRHH_tbHabilidades_Delete_Result> UDP_RRHH_tbHabilidades_Delete(Nullable<int> habi_id, string habi_razon_Inactivo, Nullable<int> habi_UsuarioModifica, Nullable<System.DateTime> habi_FechaModifica)
        {
            var habi_idParameter = habi_id.HasValue ?
                new ObjectParameter("habi_id", habi_id) :
                new ObjectParameter("habi_id", typeof(int));
    
            var habi_razon_InactivoParameter = habi_razon_Inactivo != null ?
                new ObjectParameter("habi_razon_Inactivo", habi_razon_Inactivo) :
                new ObjectParameter("habi_razon_Inactivo", typeof(string));
    
            var habi_UsuarioModificaParameter = habi_UsuarioModifica.HasValue ?
                new ObjectParameter("habi_UsuarioModifica", habi_UsuarioModifica) :
                new ObjectParameter("habi_UsuarioModifica", typeof(int));
    
            var habi_FechaModificaParameter = habi_FechaModifica.HasValue ?
                new ObjectParameter("habi_FechaModifica", habi_FechaModifica) :
                new ObjectParameter("habi_FechaModifica", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<UDP_RRHH_tbHabilidades_Delete_Result>("UDP_RRHH_tbHabilidades_Delete", habi_idParameter, habi_razon_InactivoParameter, habi_UsuarioModificaParameter, habi_FechaModificaParameter);
        }
    
        public virtual ObjectResult<UDP_RRHH_tbHabilidades_Insert_Result> UDP_RRHH_tbHabilidades_Insert(string habi_Descripcion, Nullable<int> habi_UsuarioCrea, Nullable<System.DateTime> habi_FechaCrea)
        {
            var habi_DescripcionParameter = habi_Descripcion != null ?
                new ObjectParameter("habi_Descripcion", habi_Descripcion) :
                new ObjectParameter("habi_Descripcion", typeof(string));
    
            var habi_UsuarioCreaParameter = habi_UsuarioCrea.HasValue ?
                new ObjectParameter("habi_UsuarioCrea", habi_UsuarioCrea) :
                new ObjectParameter("habi_UsuarioCrea", typeof(int));
    
            var habi_FechaCreaParameter = habi_FechaCrea.HasValue ?
                new ObjectParameter("habi_FechaCrea", habi_FechaCrea) :
                new ObjectParameter("habi_FechaCrea", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<UDP_RRHH_tbHabilidades_Insert_Result>("UDP_RRHH_tbHabilidades_Insert", habi_DescripcionParameter, habi_UsuarioCreaParameter, habi_FechaCreaParameter);
        }
    
        public virtual ObjectResult<UDP_RRHH_tbHabilidades_Update_Result> UDP_RRHH_tbHabilidades_Update(Nullable<int> habi_Id, string habi_Descripcion, Nullable<int> habi_UsuarioModifica, Nullable<System.DateTime> habi_FechaModifica)
        {
            var habi_IdParameter = habi_Id.HasValue ?
                new ObjectParameter("habi_Id", habi_Id) :
                new ObjectParameter("habi_Id", typeof(int));
    
            var habi_DescripcionParameter = habi_Descripcion != null ?
                new ObjectParameter("habi_Descripcion", habi_Descripcion) :
                new ObjectParameter("habi_Descripcion", typeof(string));
    
            var habi_UsuarioModificaParameter = habi_UsuarioModifica.HasValue ?
                new ObjectParameter("habi_UsuarioModifica", habi_UsuarioModifica) :
                new ObjectParameter("habi_UsuarioModifica", typeof(int));
    
            var habi_FechaModificaParameter = habi_FechaModifica.HasValue ?
                new ObjectParameter("habi_FechaModifica", habi_FechaModifica) :
                new ObjectParameter("habi_FechaModifica", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<UDP_RRHH_tbHabilidades_Update_Result>("UDP_RRHH_tbHabilidades_Update", habi_IdParameter, habi_DescripcionParameter, habi_UsuarioModificaParameter, habi_FechaModificaParameter);
        }
    
        public virtual ObjectResult<UDP_RRHH_tbTipoSalidas_Delete_Result> UDP_RRHH_tbTipoSalidas_Delete(Nullable<int> tsal_id, string tsal_razon_Inactivo, Nullable<int> tsal_UsuarioModifica, Nullable<System.DateTime> tsal_FechaModifica)
        {
            var tsal_idParameter = tsal_id.HasValue ?
                new ObjectParameter("tsal_id", tsal_id) :
                new ObjectParameter("tsal_id", typeof(int));
    
            var tsal_razon_InactivoParameter = tsal_razon_Inactivo != null ?
                new ObjectParameter("tsal_razon_Inactivo", tsal_razon_Inactivo) :
                new ObjectParameter("tsal_razon_Inactivo", typeof(string));
    
            var tsal_UsuarioModificaParameter = tsal_UsuarioModifica.HasValue ?
                new ObjectParameter("tsal_UsuarioModifica", tsal_UsuarioModifica) :
                new ObjectParameter("tsal_UsuarioModifica", typeof(int));
    
            var tsal_FechaModificaParameter = tsal_FechaModifica.HasValue ?
                new ObjectParameter("tsal_FechaModifica", tsal_FechaModifica) :
                new ObjectParameter("tsal_FechaModifica", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<UDP_RRHH_tbTipoSalidas_Delete_Result>("UDP_RRHH_tbTipoSalidas_Delete", tsal_idParameter, tsal_razon_InactivoParameter, tsal_UsuarioModificaParameter, tsal_FechaModificaParameter);
        }
    
        public virtual ObjectResult<UDP_RRHH_tbTipoSalidas_Insert_Result> UDP_RRHH_tbTipoSalidas_Insert(string tsal_Descripcion, Nullable<int> tsal_UsuarioCrea, Nullable<System.DateTime> tsal_FechaCrea)
        {
            var tsal_DescripcionParameter = tsal_Descripcion != null ?
                new ObjectParameter("tsal_Descripcion", tsal_Descripcion) :
                new ObjectParameter("tsal_Descripcion", typeof(string));
    
            var tsal_UsuarioCreaParameter = tsal_UsuarioCrea.HasValue ?
                new ObjectParameter("tsal_UsuarioCrea", tsal_UsuarioCrea) :
                new ObjectParameter("tsal_UsuarioCrea", typeof(int));
    
            var tsal_FechaCreaParameter = tsal_FechaCrea.HasValue ?
                new ObjectParameter("tsal_FechaCrea", tsal_FechaCrea) :
                new ObjectParameter("tsal_FechaCrea", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<UDP_RRHH_tbTipoSalidas_Insert_Result>("UDP_RRHH_tbTipoSalidas_Insert", tsal_DescripcionParameter, tsal_UsuarioCreaParameter, tsal_FechaCreaParameter);
        }
    
        public virtual ObjectResult<UDP_RRHH_tbTipoSalidas_Update_Result> UDP_RRHH_tbTipoSalidas_Update(Nullable<int> tsal_Id, string tsal_Descripcion, Nullable<int> tsal_UsuarioModifica, Nullable<System.DateTime> tsal_FechaModifica)
        {
            var tsal_IdParameter = tsal_Id.HasValue ?
                new ObjectParameter("tsal_Id", tsal_Id) :
                new ObjectParameter("tsal_Id", typeof(int));
    
            var tsal_DescripcionParameter = tsal_Descripcion != null ?
                new ObjectParameter("tsal_Descripcion", tsal_Descripcion) :
                new ObjectParameter("tsal_Descripcion", typeof(string));
    
            var tsal_UsuarioModificaParameter = tsal_UsuarioModifica.HasValue ?
                new ObjectParameter("tsal_UsuarioModifica", tsal_UsuarioModifica) :
                new ObjectParameter("tsal_UsuarioModifica", typeof(int));
    
            var tsal_FechaModificaParameter = tsal_FechaModifica.HasValue ?
                new ObjectParameter("tsal_FechaModifica", tsal_FechaModifica) :
                new ObjectParameter("tsal_FechaModifica", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<UDP_RRHH_tbTipoSalidas_Update_Result>("UDP_RRHH_tbTipoSalidas_Update", tsal_IdParameter, tsal_DescripcionParameter, tsal_UsuarioModificaParameter, tsal_FechaModificaParameter);
        }
    
        public virtual ObjectResult<UDP_RRHH_tbCargos_Delete_Result> UDP_RRHH_tbCargos_Delete(Nullable<int> car_Id, string car_razon_Inactivo, Nullable<int> car_UsuarioModifica, Nullable<System.DateTime> car_FechaModifica)
        {
            var car_IdParameter = car_Id.HasValue ?
                new ObjectParameter("car_Id", car_Id) :
                new ObjectParameter("car_Id", typeof(int));
    
            var car_razon_InactivoParameter = car_razon_Inactivo != null ?
                new ObjectParameter("car_razon_Inactivo", car_razon_Inactivo) :
                new ObjectParameter("car_razon_Inactivo", typeof(string));
    
            var car_UsuarioModificaParameter = car_UsuarioModifica.HasValue ?
                new ObjectParameter("car_UsuarioModifica", car_UsuarioModifica) :
                new ObjectParameter("car_UsuarioModifica", typeof(int));
    
            var car_FechaModificaParameter = car_FechaModifica.HasValue ?
                new ObjectParameter("car_FechaModifica", car_FechaModifica) :
                new ObjectParameter("car_FechaModifica", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<UDP_RRHH_tbCargos_Delete_Result>("UDP_RRHH_tbCargos_Delete", car_IdParameter, car_razon_InactivoParameter, car_UsuarioModificaParameter, car_FechaModificaParameter);
        }
    
        public virtual ObjectResult<UDP_RRHH_tbCargos_Insert_Result> UDP_RRHH_tbCargos_Insert(string car_Descripcion, Nullable<int> car_UsuarioCrea, Nullable<System.DateTime> car_FechaCrea)
        {
            var car_DescripcionParameter = car_Descripcion != null ?
                new ObjectParameter("car_Descripcion", car_Descripcion) :
                new ObjectParameter("car_Descripcion", typeof(string));
    
            var car_UsuarioCreaParameter = car_UsuarioCrea.HasValue ?
                new ObjectParameter("car_UsuarioCrea", car_UsuarioCrea) :
                new ObjectParameter("car_UsuarioCrea", typeof(int));
    
            var car_FechaCreaParameter = car_FechaCrea.HasValue ?
                new ObjectParameter("car_FechaCrea", car_FechaCrea) :
                new ObjectParameter("car_FechaCrea", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<UDP_RRHH_tbCargos_Insert_Result>("UDP_RRHH_tbCargos_Insert", car_DescripcionParameter, car_UsuarioCreaParameter, car_FechaCreaParameter);
        }
    
        public virtual ObjectResult<UDP_RRHH_tbCargos_Restore_Result> UDP_RRHH_tbCargos_Restore(Nullable<int> car_Id, Nullable<int> car_UsuarioModifica, Nullable<System.DateTime> car_FechaModifica)
        {
            var car_IdParameter = car_Id.HasValue ?
                new ObjectParameter("car_Id", car_Id) :
                new ObjectParameter("car_Id", typeof(int));
    
            var car_UsuarioModificaParameter = car_UsuarioModifica.HasValue ?
                new ObjectParameter("car_UsuarioModifica", car_UsuarioModifica) :
                new ObjectParameter("car_UsuarioModifica", typeof(int));
    
            var car_FechaModificaParameter = car_FechaModifica.HasValue ?
                new ObjectParameter("car_FechaModifica", car_FechaModifica) :
                new ObjectParameter("car_FechaModifica", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<UDP_RRHH_tbCargos_Restore_Result>("UDP_RRHH_tbCargos_Restore", car_IdParameter, car_UsuarioModificaParameter, car_FechaModificaParameter);
        }
    
        public virtual ObjectResult<UDP_RRHH_tbCargos_Update_Result> UDP_RRHH_tbCargos_Update(Nullable<int> car_Id, string car_Descripcion, Nullable<int> car_UsuarioModifica, Nullable<System.DateTime> car_FechaModifica)
        {
            var car_IdParameter = car_Id.HasValue ?
                new ObjectParameter("car_Id", car_Id) :
                new ObjectParameter("car_Id", typeof(int));
    
            var car_DescripcionParameter = car_Descripcion != null ?
                new ObjectParameter("car_Descripcion", car_Descripcion) :
                new ObjectParameter("car_Descripcion", typeof(string));
    
            var car_UsuarioModificaParameter = car_UsuarioModifica.HasValue ?
                new ObjectParameter("car_UsuarioModifica", car_UsuarioModifica) :
                new ObjectParameter("car_UsuarioModifica", typeof(int));
    
            var car_FechaModificaParameter = car_FechaModifica.HasValue ?
                new ObjectParameter("car_FechaModifica", car_FechaModifica) :
                new ObjectParameter("car_FechaModifica", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<UDP_RRHH_tbCargos_Update_Result>("UDP_RRHH_tbCargos_Update", car_IdParameter, car_DescripcionParameter, car_UsuarioModificaParameter, car_FechaModificaParameter);
        }
    
        public virtual ObjectResult<UDP_RRHH_tbDepartamentos_Restore_Result> UDP_RRHH_tbDepartamentos_Restore(Nullable<int> depto_Id, Nullable<int> depto_Usuariomodifica, Nullable<System.DateTime> depto_Fechamodifica)
        {
            var depto_IdParameter = depto_Id.HasValue ?
                new ObjectParameter("depto_Id", depto_Id) :
                new ObjectParameter("depto_Id", typeof(int));
    
            var depto_UsuariomodificaParameter = depto_Usuariomodifica.HasValue ?
                new ObjectParameter("depto_Usuariomodifica", depto_Usuariomodifica) :
                new ObjectParameter("depto_Usuariomodifica", typeof(int));
    
            var depto_FechamodificaParameter = depto_Fechamodifica.HasValue ?
                new ObjectParameter("depto_Fechamodifica", depto_Fechamodifica) :
                new ObjectParameter("depto_Fechamodifica", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<UDP_RRHH_tbDepartamentos_Restore_Result>("UDP_RRHH_tbDepartamentos_Restore", depto_IdParameter, depto_UsuariomodificaParameter, depto_FechamodificaParameter);
        }
    
        public virtual ObjectResult<UDP_RRHH_tbDepartamentos_Update_Result> UDP_RRHH_tbDepartamentos_Update(Nullable<int> depto_Id, Nullable<int> area_Id, Nullable<int> car_Id, string depto_Descripcion, Nullable<int> depto_UsuarioModifica, Nullable<System.DateTime> depto_FechaModifica)
        {
            var depto_IdParameter = depto_Id.HasValue ?
                new ObjectParameter("depto_Id", depto_Id) :
                new ObjectParameter("depto_Id", typeof(int));
    
            var area_IdParameter = area_Id.HasValue ?
                new ObjectParameter("area_Id", area_Id) :
                new ObjectParameter("area_Id", typeof(int));
    
            var car_IdParameter = car_Id.HasValue ?
                new ObjectParameter("car_Id", car_Id) :
                new ObjectParameter("car_Id", typeof(int));
    
            var depto_DescripcionParameter = depto_Descripcion != null ?
                new ObjectParameter("depto_Descripcion", depto_Descripcion) :
                new ObjectParameter("depto_Descripcion", typeof(string));
    
            var depto_UsuarioModificaParameter = depto_UsuarioModifica.HasValue ?
                new ObjectParameter("depto_UsuarioModifica", depto_UsuarioModifica) :
                new ObjectParameter("depto_UsuarioModifica", typeof(int));
    
            var depto_FechaModificaParameter = depto_FechaModifica.HasValue ?
                new ObjectParameter("depto_FechaModifica", depto_FechaModifica) :
                new ObjectParameter("depto_FechaModifica", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<UDP_RRHH_tbDepartamentos_Update_Result>("UDP_RRHH_tbDepartamentos_Update", depto_IdParameter, area_IdParameter, car_IdParameter, depto_DescripcionParameter, depto_UsuarioModificaParameter, depto_FechaModificaParameter);
        }
    
        public virtual ObjectResult<UDP_RRHH_tbAreas_Delete_Result> UDP_RRHH_tbAreas_Delete(Nullable<int> area_Id, string area_Razoninactivo, Nullable<int> area_Usuariomodifica, Nullable<System.DateTime> area_Fechamodifica)
        {
            var area_IdParameter = area_Id.HasValue ?
                new ObjectParameter("area_Id", area_Id) :
                new ObjectParameter("area_Id", typeof(int));
    
            var area_RazoninactivoParameter = area_Razoninactivo != null ?
                new ObjectParameter("area_Razoninactivo", area_Razoninactivo) :
                new ObjectParameter("area_Razoninactivo", typeof(string));
    
            var area_UsuariomodificaParameter = area_Usuariomodifica.HasValue ?
                new ObjectParameter("area_Usuariomodifica", area_Usuariomodifica) :
                new ObjectParameter("area_Usuariomodifica", typeof(int));
    
            var area_FechamodificaParameter = area_Fechamodifica.HasValue ?
                new ObjectParameter("area_Fechamodifica", area_Fechamodifica) :
                new ObjectParameter("area_Fechamodifica", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<UDP_RRHH_tbAreas_Delete_Result>("UDP_RRHH_tbAreas_Delete", area_IdParameter, area_RazoninactivoParameter, area_UsuariomodificaParameter, area_FechamodificaParameter);
        }
    
        public virtual ObjectResult<UDP_RRHH_tbAreas_Insert_Result> UDP_RRHH_tbAreas_Insert(Nullable<int> suc_Id, string car_descripcion, string area_Descripcion, Nullable<int> area_Usuariocrea, Nullable<System.DateTime> area_Fechacrea)
        {
            var suc_IdParameter = suc_Id.HasValue ?
                new ObjectParameter("suc_Id", suc_Id) :
                new ObjectParameter("suc_Id", typeof(int));
    
            var car_descripcionParameter = car_descripcion != null ?
                new ObjectParameter("car_descripcion", car_descripcion) :
                new ObjectParameter("car_descripcion", typeof(string));
    
            var area_DescripcionParameter = area_Descripcion != null ?
                new ObjectParameter("area_Descripcion", area_Descripcion) :
                new ObjectParameter("area_Descripcion", typeof(string));
    
            var area_UsuariocreaParameter = area_Usuariocrea.HasValue ?
                new ObjectParameter("area_Usuariocrea", area_Usuariocrea) :
                new ObjectParameter("area_Usuariocrea", typeof(int));
    
            var area_FechacreaParameter = area_Fechacrea.HasValue ?
                new ObjectParameter("area_Fechacrea", area_Fechacrea) :
                new ObjectParameter("area_Fechacrea", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<UDP_RRHH_tbAreas_Insert_Result>("UDP_RRHH_tbAreas_Insert", suc_IdParameter, car_descripcionParameter, area_DescripcionParameter, area_UsuariocreaParameter, area_FechacreaParameter);
        }
    
        public virtual ObjectResult<UDP_RRHH_tbAreas_Update_Result> UDP_RRHH_tbAreas_Update(Nullable<int> area_Id, Nullable<int> car_Id, Nullable<int> suc_Id, string area_Descripcion, Nullable<int> area_Usuariomodifica, Nullable<System.DateTime> area_Fechamodifica)
        {
            var area_IdParameter = area_Id.HasValue ?
                new ObjectParameter("area_Id", area_Id) :
                new ObjectParameter("area_Id", typeof(int));
    
            var car_IdParameter = car_Id.HasValue ?
                new ObjectParameter("car_Id", car_Id) :
                new ObjectParameter("car_Id", typeof(int));
    
            var suc_IdParameter = suc_Id.HasValue ?
                new ObjectParameter("suc_Id", suc_Id) :
                new ObjectParameter("suc_Id", typeof(int));
    
            var area_DescripcionParameter = area_Descripcion != null ?
                new ObjectParameter("area_Descripcion", area_Descripcion) :
                new ObjectParameter("area_Descripcion", typeof(string));
    
            var area_UsuariomodificaParameter = area_Usuariomodifica.HasValue ?
                new ObjectParameter("area_Usuariomodifica", area_Usuariomodifica) :
                new ObjectParameter("area_Usuariomodifica", typeof(int));
    
            var area_FechamodificaParameter = area_Fechamodifica.HasValue ?
                new ObjectParameter("area_Fechamodifica", area_Fechamodifica) :
                new ObjectParameter("area_Fechamodifica", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<UDP_RRHH_tbAreas_Update_Result>("UDP_RRHH_tbAreas_Update", area_IdParameter, car_IdParameter, suc_IdParameter, area_DescripcionParameter, area_UsuariomodificaParameter, area_FechamodificaParameter);
        }
    
        public virtual ObjectResult<UDP_RRHH_tbDepartamentos_Delete_Result> UDP_RRHH_tbDepartamentos_Delete(Nullable<int> depto_Id, string depto_razon_Inactivo, Nullable<int> depto_UsuarioModifica, Nullable<System.DateTime> depto_FechaModifica)
        {
            var depto_IdParameter = depto_Id.HasValue ?
                new ObjectParameter("depto_Id", depto_Id) :
                new ObjectParameter("depto_Id", typeof(int));
    
            var depto_razon_InactivoParameter = depto_razon_Inactivo != null ?
                new ObjectParameter("depto_razon_Inactivo", depto_razon_Inactivo) :
                new ObjectParameter("depto_razon_Inactivo", typeof(string));
    
            var depto_UsuarioModificaParameter = depto_UsuarioModifica.HasValue ?
                new ObjectParameter("depto_UsuarioModifica", depto_UsuarioModifica) :
                new ObjectParameter("depto_UsuarioModifica", typeof(int));
    
            var depto_FechaModificaParameter = depto_FechaModifica.HasValue ?
                new ObjectParameter("depto_FechaModifica", depto_FechaModifica) :
                new ObjectParameter("depto_FechaModifica", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<UDP_RRHH_tbDepartamentos_Delete_Result>("UDP_RRHH_tbDepartamentos_Delete", depto_IdParameter, depto_razon_InactivoParameter, depto_UsuarioModificaParameter, depto_FechaModificaParameter);
        }
    
        public virtual ObjectResult<UDP_RRHH_tbDepartamentos_Insert_Result> UDP_RRHH_tbDepartamentos_Insert(Nullable<int> area_Id, string car_descripcion, string depto_Descripcion, Nullable<int> depto_Usuariocrea, Nullable<System.DateTime> depto_FechaCrea)
        {
            var area_IdParameter = area_Id.HasValue ?
                new ObjectParameter("area_Id", area_Id) :
                new ObjectParameter("area_Id", typeof(int));
    
            var car_descripcionParameter = car_descripcion != null ?
                new ObjectParameter("car_descripcion", car_descripcion) :
                new ObjectParameter("car_descripcion", typeof(string));
    
            var depto_DescripcionParameter = depto_Descripcion != null ?
                new ObjectParameter("depto_Descripcion", depto_Descripcion) :
                new ObjectParameter("depto_Descripcion", typeof(string));
    
            var depto_UsuariocreaParameter = depto_Usuariocrea.HasValue ?
                new ObjectParameter("depto_Usuariocrea", depto_Usuariocrea) :
                new ObjectParameter("depto_Usuariocrea", typeof(int));
    
            var depto_FechaCreaParameter = depto_FechaCrea.HasValue ?
                new ObjectParameter("depto_FechaCrea", depto_FechaCrea) :
                new ObjectParameter("depto_FechaCrea", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<UDP_RRHH_tbDepartamentos_Insert_Result>("UDP_RRHH_tbDepartamentos_Insert", area_IdParameter, car_descripcionParameter, depto_DescripcionParameter, depto_UsuariocreaParameter, depto_FechaCreaParameter);
        }
    }
}
