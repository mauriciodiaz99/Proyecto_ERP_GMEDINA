USE [ERP_GMEDINA]
GO
/****** Object:  User [ahm]    Script Date: 19/11/2019 8:10:57 ******/
CREATE USER [ahm] FOR LOGIN [ahm] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [ahm]
GO
/****** Object:  Schema [Acce]    Script Date: 19/11/2019 8:10:58 ******/
CREATE SCHEMA [Acce]
GO
/****** Object:  Schema [Plani]    Script Date: 19/11/2019 8:10:58 ******/
CREATE SCHEMA [Plani]
GO
/****** Object:  Schema [rrhh]    Script Date: 19/11/2019 8:10:58 ******/
CREATE SCHEMA [rrhh]
GO
/****** Object:  Table [rrhh].[tbEquipoEmpleados]    Script Date: 19/11/2019 8:10:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rrhh].[tbEquipoEmpleados](
	[eqem_Id] [int] NOT NULL,
	[emp_Id] [int] NOT NULL,
	[eqtra_Id] [int] NOT NULL,
	[eqem_Fecha] [datetime] NOT NULL,
	[eqem_Estado] [bit] NOT NULL,
	[eqem_RazonInactivo] [nvarchar](100) NULL,
	[eqem_UsuarioCrea] [int] NOT NULL,
	[eqem_FechaCrea] [datetime] NOT NULL,
	[eqem_UsuarioModifica] [int] NULL,
	[eqem_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_tbEquipoEmpleados_eqem_Id] PRIMARY KEY CLUSTERED 
(
	[eqem_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [rrhh].[tbPersonas]    Script Date: 19/11/2019 8:11:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rrhh].[tbPersonas](
	[per_Id] [int] NOT NULL,
	[per_Identidad] [nvarchar](16) NOT NULL,
	[per_Nombres] [nvarchar](50) NOT NULL,
	[per_Apellidos] [nvarchar](50) NOT NULL,
	[per_FechaNacimiento] [date] NOT NULL,
	[per_Sexo] [char](1) NULL,
	[per_Edad] [int] NULL,
	[nac_Id] [int] NOT NULL,
	[per_Direccion] [nvarchar](50) NULL,
	[per_Telefono] [nvarchar](20) NULL,
	[per_CorreoElectronico] [nvarchar](50) NULL,
	[per_EstadoCivil] [char](1) NULL,
	[per_TipoSangre] [nvarchar](4) NULL,
	[per_Estado] [bit] NOT NULL,
	[per_RazonInactivo] [nvarchar](100) NULL,
	[per_UsuarioCrea] [int] NOT NULL,
	[per_FechaCrea] [datetime] NOT NULL,
	[per_UsuarioModifica] [int] NULL,
	[per_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_tbPersonas_per_Id] PRIMARY KEY CLUSTERED 
(
	[per_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [rrhh].[tbEmpleados]    Script Date: 19/11/2019 8:11:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rrhh].[tbEmpleados](
	[emp_Id] [int] NOT NULL,
	[per_Id] [int] NOT NULL,
	[car_Id] [int] NOT NULL,
	[area_Id] [int] NOT NULL,
	[depto_Id] [int] NOT NULL,
	[jor_Id] [int] NOT NULL,
	[cpla_IdPlanilla] [int] NOT NULL,
	[fpa_IdFormaPago] [int] NOT NULL,
	[emp_CuentaBancaria] [nvarchar](100) NULL,
	[emp_Reingreso] [bit] NOT NULL,
	[emp_Fechaingreso] [datetime] NOT NULL,
	[emp_RazonSalida] [nvarchar](50) NULL,
	[emp_CargoAnterior] [int] NULL,
	[emp_FechaDeSalida] [datetime] NULL,
	[emp_Estado] [bit] NOT NULL,
	[emp_RazonInactivo] [nvarchar](100) NULL,
	[emp_UsuarioCrea] [int] NOT NULL,
	[emp_FechaCrea] [datetime] NOT NULL,
	[emp_UsuarioModifica] [int] NULL,
	[emp_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_tbEmpleados_emp_Id] PRIMARY KEY CLUSTERED 
(
	[emp_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Plani].[V_DeduccionesExtraordinarias_EquipoEmpleado]    Script Date: 19/11/2019 8:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Plani].[V_DeduccionesExtraordinarias_EquipoEmpleado]
AS
SELECT
rhee.eqem_Id,
CONCAT(rhp.per_Nombres, ' ', rhp.per_Apellidos) AS per_Empleado
FROM [rrhh].[tbEquipoEmpleados] AS rhee
INNER JOIN [rrhh].[tbEmpleados] AS rhe ON rhee.eqem_Id = rhe.emp_Id
INNER JOIN [rrhh].[tbPersonas] AS rhp ON rhe.per_Id = rhp.per_Id
GO
/****** Object:  Table [rrhh].[tbSueldos]    Script Date: 19/11/2019 8:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rrhh].[tbSueldos](
	[sue_Id] [int] NOT NULL,
	[emp_Id] [int] NOT NULL,
	[tmon_Id] [int] NOT NULL,
	[sue_Cantidad] [decimal](8, 4) NOT NULL,
	[sue_SueldoAnterior] [int] NULL,
	[sue_Estado] [bit] NOT NULL,
	[sue_RazonInactivo] [nvarchar](100) NULL,
	[sue_UsuarioCrea] [int] NOT NULL,
	[sue_FechaCrea] [datetime] NULL,
	[ue_UsuarioModifica] [int] NULL,
	[sue_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_tbSueldos_hsue_Id] PRIMARY KEY CLUSTERED 
(
	[sue_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Plani].[tbFormaPago]    Script Date: 19/11/2019 8:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Plani].[tbFormaPago](
	[fpa_IdFormaPago] [int] NOT NULL,
	[fpa_Descripcion] [nvarchar](50) NOT NULL,
	[fpa_UsuarioCrea] [int] NOT NULL,
	[fpa_FechaCrea] [datetime] NOT NULL,
	[fpa_UsuarioModifica] [int] NULL,
	[fpa_FechaModifica] [datetime] NULL,
	[fpa_Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Plani_tbFormaPago_fpa_IdFormaPago] PRIMARY KEY CLUSTERED 
(
	[fpa_IdFormaPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Plani].[V_InformacionColaborador]    Script Date: 19/11/2019 8:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Plani].[V_InformacionColaborador] AS
SELECT 
EMP.emp_Id,
PER.per_Id,
PER.per_Nombres,
PER.per_Apellidos,
PER.per_Identidad,
PER.per_Sexo,
PER.per_Edad,
PER.per_Direccion,
PER.per_Telefono,
PER.per_CorreoElectronico,
PER.per_EstadoCivil,
SUE.sue_Cantidad AS SalarioBase,
EMP.cpla_IdPlanilla,
FP.fpa_IdFormaPago,
FP.fpa_Descripcion
FROM [rrhh].[tbEmpleados] EMP
INNER JOIN [rrhh].[tbPersonas] PER ON EMP.per_Id = PER.per_Id
INNER JOIN [rrhh].[tbSueldos] SUE ON EMP.emp_Id = SUE.emp_Id
INNER JOIN Plani.tbFormaPago FP ON EMP.fpa_IdFormaPago = FP.fpa_IdFormaPago
WHERE sue_SueldoAnterior IS NULL
GO
/****** Object:  Table [Plani].[tbCatalogoDeDeducciones]    Script Date: 19/11/2019 8:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Plani].[tbCatalogoDeDeducciones](
	[cde_IdDeducciones] [int] NOT NULL,
	[cde_DescripcionDeduccion] [nvarchar](50) NOT NULL,
	[tde_IdTipoDedu] [int] NOT NULL,
	[cde_PorcentajeColaborador] [decimal](16, 2) NOT NULL,
	[cde_PorcentajeEmpresa] [decimal](16, 2) NOT NULL,
	[cde_UsuarioCrea] [int] NOT NULL,
	[cde_FechaCrea] [datetime] NOT NULL,
	[cde_UsuarioModifica] [int] NULL,
	[cde_FechaModifica] [datetime] NULL,
	[cde_Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Plani_tbCatalogoDeducciones_cde_IdDeducciones] PRIMARY KEY CLUSTERED 
(
	[cde_IdDeducciones] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Plani].[tbCatalogoDePlanillas]    Script Date: 19/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Plani].[tbCatalogoDePlanillas](
	[cpla_IdPlanilla] [int] NOT NULL,
	[cpla_DescripcionPlanilla] [nvarchar](50) NOT NULL,
	[cpla_FrecuenciaEnDias] [int] NOT NULL,
	[cpla_UsuarioCrea] [int] NOT NULL,
	[cpla_FechaCrea] [datetime] NOT NULL,
	[cpla_UsuarioModifica] [int] NULL,
	[cpla_FechaModifica] [datetime] NULL,
	[cpla_Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Plani_tbCatalogoPlanillas_cpla_IdPlanilla	] PRIMARY KEY CLUSTERED 
(
	[cpla_IdPlanilla] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Plani].[tbTipoDeduccion]    Script Date: 19/11/2019 8:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Plani].[tbTipoDeduccion](
	[tde_IdTipoDedu] [int] NOT NULL,
	[tde_Descripcion] [nvarchar](50) NOT NULL,
	[tde_UsuarioCrea] [int] NOT NULL,
	[tde_FechaCrea] [datetime] NOT NULL,
	[tde_UsuarioModifica] [int] NULL,
	[tde_FechaModifica] [datetime] NULL,
	[tde_Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Plani_tbTipoDeducciones_tde_IdTipoDedu] PRIMARY KEY CLUSTERED 
(
	[tde_IdTipoDedu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Plani].[tbTipoPlanillaDetalleDeduccion]    Script Date: 19/11/2019 8:11:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Plani].[tbTipoPlanillaDetalleDeduccion](
	[tpdd_IdPlanillaDetDeduccion] [int] NOT NULL,
	[cpla_IdPlanilla] [int] NOT NULL,
	[cde_IdDeducciones] [int] NOT NULL,
	[tpdd_UsuarioCrea] [int] NOT NULL,
	[tpdd_FechaCrea] [datetime] NOT NULL,
	[tpdd_UsuarioModifica] [int] NULL,
	[tpdd_FechaModifica] [datetime] NULL,
	[tpdd_Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Plani_tbTipoPlanillaDetalleDeduccion_tpdd_IdPlanDetDedu] PRIMARY KEY CLUSTERED 
(
	[tpdd_IdPlanillaDetDeduccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Plani].[V_PlanillaDeducciones]    Script Date: 19/11/2019 8:11:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Plani].[V_PlanillaDeducciones] AS
SELECT 
CPLA.cpla_IdPlanilla,
CPLA.cpla_DescripcionPlanilla,
CPLA.cpla_FrecuenciaEnDias,
PLADE.tpdd_IdPlanillaDetDeduccion,
PLADE.cde_IdDeducciones,
CDE.cde_DescripcionDeduccion,
CDE.tde_IdTipoDedu,
TIPODE.tde_Descripcion,
CDE.cde_PorcentajeColaborador,
CDE.cde_PorcentajeEmpresa
FROM [Plani].[tbCatalogoDePlanillas] CPLA
INNER JOIN [Plani].[tbTipoPlanillaDetalleDeduccion] PLADE ON CPLA.cpla_IdPlanilla = PLADE.cpla_IdPlanilla
INNER JOIN [Plani].[tbCatalogoDeDeducciones] CDE ON PLADE.cde_IdDeducciones = CDE.cde_IdDeducciones
INNER JOIN [Plani].[tbTipoDeduccion] TIPODE ON CDE.tde_IdTipoDedu = TIPODE.tde_IdTipoDedu
-- WHERE CPLA.cpla_IdPlanilla = 2
GO
/****** Object:  Table [Plani].[tbCatalogoDeIngresos]    Script Date: 19/11/2019 8:11:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Plani].[tbCatalogoDeIngresos](
	[cin_IdIngreso] [int] NOT NULL,
	[cin_DescripcionIngreso] [nvarchar](50) NOT NULL,
	[cin_UsuarioCrea] [int] NOT NULL,
	[cin_FechaCrea] [datetime] NOT NULL,
	[cin_UsuarioModifica] [int] NULL,
	[cin_FechaModifica] [datetime] NULL,
	[cin_Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Plani_tbCatalogoIngresos_cin_IdIngreso] PRIMARY KEY CLUSTERED 
(
	[cin_IdIngreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Plani].[tbTipoPlanillaDetalleIngreso]    Script Date: 19/11/2019 8:11:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Plani].[tbTipoPlanillaDetalleIngreso](
	[tpdi_IdDetallePlanillaIngreso] [int] NOT NULL,
	[cin_IdIngreso] [int] NOT NULL,
	[cpla_IdPlanilla] [int] NOT NULL,
	[tpdi_UsuarioCrea] [int] NOT NULL,
	[tpdi_FechaCrea] [datetime] NOT NULL,
	[tpdi_UsuarioModifica] [int] NULL,
	[tpdi_FechaModifica] [datetime] NULL,
	[tpdi_Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Plani_tbTipoPlanillaDetalleIngreso_tpdi_IdPlanDetIng] PRIMARY KEY CLUSTERED 
(
	[tpdi_IdDetallePlanillaIngreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Plani].[V_PlanillaIngresos]    Script Date: 19/11/2019 8:11:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Plani].[V_PlanillaIngresos] AS
SELECT 
CPLA.cpla_IdPlanilla,
CPLA.cpla_DescripcionPlanilla,
cpla_FrecuenciaEnDias,
PLAIN.tpdi_IdDetallePlanillaIngreso,
CIN.cin_IdIngreso,
CIN.cin_DescripcionIngreso
FROM [Plani].[tbCatalogoDePlanillas] CPLA
INNER JOIN [Plani].[tbTipoPlanillaDetalleIngreso] PLAIN ON CPLA.cpla_IdPlanilla = PLAIN.cpla_IdPlanilla
INNER JOIN [Plani].[tbCatalogoDeIngresos] CIN ON PLAIN.cin_IdIngreso = CIN.cin_IdIngreso
--WHERE CPLA.cpla_IdPlanilla = 1
GO
/****** Object:  Table [rrhh].[tbEquipoTrabajo]    Script Date: 19/11/2019 8:11:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rrhh].[tbEquipoTrabajo](
	[eqtra_Id] [int] NOT NULL,
	[eqtra_Codigo] [nvarchar](25) NOT NULL,
	[eqtra_Descripcion] [nvarchar](50) NULL,
	[eqtra_Observacion] [nvarchar](50) NULL,
	[eqtra_Estado] [bit] NOT NULL,
	[eqtra_RazonInactivo] [nvarchar](100) NULL,
	[eqtra_UsuarioCrea] [int] NOT NULL,
	[eqtra_FechaCrea] [datetime] NOT NULL,
	[eqtra_UsuarioModifica] [int] NULL,
	[eqtra_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_tbEquipoTrabajo_eqtra_Id] PRIMARY KEY CLUSTERED 
(
	[eqtra_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Plani].[tbDeduccionesExtraordinarias]    Script Date: 19/11/2019 8:11:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Plani].[tbDeduccionesExtraordinarias](
	[dex_IdDeduccionesExtra] [int] NOT NULL,
	[eqem_Id] [int] NOT NULL,
	[dex_MontoInicial] [decimal](10, 2) NOT NULL,
	[dex_MontoRestante] [decimal](10, 2) NOT NULL,
	[dex_ObservacionesComentarios] [nvarchar](100) NULL,
	[cde_IdDeducciones] [int] NOT NULL,
	[dex_Cuota] [decimal](16, 2) NOT NULL,
	[dex_UsuarioCrea] [int] NOT NULL,
	[dex_FechaCrea] [datetime] NOT NULL,
	[dex_UsuarioModifica] [int] NULL,
	[dex_FechaModifica] [datetime] NULL,
	[dex_Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Plani_tbIDeduccionesExtraordinarias_dex_IdDeduccionesExtra] PRIMARY KEY CLUSTERED 
(
	[dex_IdDeduccionesExtra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Plani].[V_DeduccionesExtrasColaboradores]    Script Date: 19/11/2019 8:11:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Plani].[V_DeduccionesExtrasColaboradores] AS
SELECT 
E.eqtra_Id,
E.eqtra_codigo,
E.eqtra_Descripcion,
E.eqtra_observacion,
EE.emp_Id,
EE.eqem_Fecha,
DEX.dex_MontoInicial,
DEX.dex_MontoRestante,
DEX.dex_ObservacionesComentarios,
DE.cde_IdDeducciones,
DE.cde_DescripcionDeduccion,
DEX.dex_Cuota,
DEX.dex_UsuarioCrea,
DEX.dex_FechaCrea,
DEX.dex_UsuarioModifica,
DEX.dex_FechaModifica,
DEX.dex_Activo
FROM [rrhh].[tbEquipoTrabajo] E
INNER JOIN [rrhh].[tbEquipoEmpleados] EE ON E.eqtra_Id = EE.eqtra_Id
INNER JOIN [Plani].[tbDeduccionesExtraordinarias] DEX ON DEX.eqem_Id = EE.eqem_Id
INNER JOIN Plani.tbCatalogoDeDeducciones DE ON DEX.cde_IdDeducciones = DE.cde_IdDeducciones
GO
/****** Object:  Table [Plani].[tbDeduccionInstitucionFinanciera]    Script Date: 19/11/2019 8:11:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Plani].[tbDeduccionInstitucionFinanciera](
	[deif_IdDeduccionInstFinanciera] [int] NOT NULL,
	[emp_Id] [int] NOT NULL,
	[insf_IdInstitucionFinanciera] [int] NOT NULL,
	[deif_Monto] [decimal](10, 2) NOT NULL,
	[deif_Comentarios] [nvarchar](100) NULL,
	[cde_IdDeducciones] [int] NOT NULL,
	[deif_UsuarioCrea] [int] NOT NULL,
	[deif_FechaCrea] [datetime] NOT NULL,
	[deif_UsuarioModifica] [int] NULL,
	[deif_FechaModifica] [datetime] NULL,
	[deif_Activo] [bit] NOT NULL,
	[deif_Pagado] [bit] NULL,
 CONSTRAINT [PK_Plani_tbDeduInstiFinan_tdif_IdDeduInstitFinan] PRIMARY KEY CLUSTERED 
(
	[deif_IdDeduccionInstFinanciera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Plani].[tbInstitucionesFinancieras]    Script Date: 19/11/2019 8:11:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Plani].[tbInstitucionesFinancieras](
	[insf_IdInstitucionFinanciera] [int] NOT NULL,
	[insf_DescInstitucionFinanc] [nvarchar](50) NOT NULL,
	[insf_Contacto] [nvarchar](50) NOT NULL,
	[insf_Telefono] [nvarchar](50) NOT NULL,
	[insf_Correo] [nvarchar](50) NOT NULL,
	[insf_UsuarioCrea] [int] NOT NULL,
	[insf_FechaCrea] [datetime] NOT NULL,
	[insf_UsuarioModifica] [int] NULL,
	[insf_FechaModifica] [datetime] NULL,
	[insf_Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Plani_tbInstitucionFinanciera_insf_IdInstitucionFinanciera] PRIMARY KEY CLUSTERED 
(
	[insf_IdInstitucionFinanciera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Plani].[V_DeduccionesInstitucionesFinancierasColaboradres]    Script Date: 19/11/2019 8:11:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Plani].[V_DeduccionesInstitucionesFinancierasColaboradres] AS
SELECT 
DIF.deif_IdDeduccionInstFinanciera,
DIF.emp_Id,
DIF.deif_Monto,
DIF.deif_Comentarios,
DIF.deif_UsuarioCrea,
DIF.deif_FechaCrea,
DIF.deif_UsuarioModifica,
DIF.deif_FechaModifica,
DIF.deif_Activo,
INS.insf_IdInstitucionFinanciera,
INS.insf_DescInstitucionFinanc,
DE.cde_DescripcionDeduccion
FROM [Plani].[tbDeduccionInstitucionFinanciera]  DIF
INNER JOIN [Plani].[tbInstitucionesFinancieras] INS ON DIF.insf_IdInstitucionFinanciera = INS.insf_IdInstitucionFinanciera
INNER JOIN Plani.tbCatalogoDeDeducciones DE ON DE.cde_IdDeducciones = DIF.cde_IdDeducciones
--WHERE DIF.emp_Id = 1
GO
/****** Object:  Table [Plani].[tbEmpleadoBonos]    Script Date: 19/11/2019 8:11:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Plani].[tbEmpleadoBonos](
	[cb_Id] [int] NOT NULL,
	[emp_Id] [int] NOT NULL,
	[cin_IdIngreso] [int] NOT NULL,
	[cb_Monto] [decimal](10, 2) NOT NULL,
	[cb_FechaRegistro] [datetime] NOT NULL,
	[cb_Pagado] [bit] NOT NULL,
	[cb_UsuarioCrea] [int] NOT NULL,
	[cb_FechaCrea] [datetime] NOT NULL,
	[cb_UsuarioModifica] [int] NULL,
	[cb_FechaModifica] [datetime] NULL,
	[cb_Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Plani_tbEmpleadoBonos_cb_Id] PRIMARY KEY CLUSTERED 
(
	[cb_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Plani].[V_BonosColaborador]    Script Date: 19/11/2019 8:11:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Plani].[V_BonosColaborador] AS
SELECT 
EB.cb_Id,
EB.emp_Id,
EB.cb_Monto,
EB.cb_FechaRegistro,
EB.cb_Pagado,
EB.cb_UsuarioCrea,
EB.cb_FechaCrea,
EB.cb_UsuarioModifica,
EB.cb_FechaModifica,
EB.cb_Activo,
CPLA.cin_IdIngreso,
CPLA.cin_DescripcionIngreso
FROM [Plani].[tbEmpleadoBonos] EB
INNER JOIN [Plani].[tbCatalogoDeIngresos] CPLA ON EB.cin_IdIngreso = CPLA.cin_IdIngreso
-- WHERE EB.emp_Id = 1 AND EB.cb_Pagado = 0 AND EB.cb_Activo = 1

GO
/****** Object:  Table [Plani].[tbEmpleadoComisiones]    Script Date: 19/11/2019 8:11:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Plani].[tbEmpleadoComisiones](
	[cc_Id] [int] NOT NULL,
	[emp_Id] [int] NOT NULL,
	[cin_IdIngreso] [int] NOT NULL,
	[cc_Monto] [decimal](10, 2) NOT NULL,
	[cc_FechaRegistro] [datetime] NOT NULL,
	[cc_Pagado] [bit] NOT NULL,
	[cc_UsuarioCrea] [int] NOT NULL,
	[cc_FechaCrea] [datetime] NOT NULL,
	[cc_UsuarioModifica] [int] NULL,
	[cc_FechaModifica] [datetime] NULL,
	[cc_Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Plani_tbEmpleadoComisiones_cc_Id] PRIMARY KEY CLUSTERED 
(
	[cc_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Plani].[V_ComisionesColaborador]    Script Date: 19/11/2019 8:11:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Plani].[V_ComisionesColaborador] AS
SELECT 
EC.cc_Id,
EC.emp_Id,
EC.cc_Monto,
EC.cc_FechaRegistro,
EC.cc_Pagado,
EC.cc_UsuarioCrea,
EC.cc_FechaCrea,
EC.cc_UsuarioModifica,
EC.cc_FechaModifica,
EC.cc_Activo,
CPLA.cin_IdIngreso,
CPLA.cin_DescripcionIngreso
FROM [Plani].[tbEmpleadoComisiones] EC
INNER JOIN [Plani].[tbCatalogoDeIngresos] CPLA ON EC.cin_IdIngreso = CPLA.cin_IdIngreso
--WHERE cc_Pagado = 0 AND emp_Id = 1
GO
/****** Object:  Table [rrhh].[tbTipoMonedas]    Script Date: 19/11/2019 8:11:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rrhh].[tbTipoMonedas](
	[tmon_Id] [int] NOT NULL,
	[tmon_Descripcion] [nvarchar](25) NOT NULL,
	[tmon_Estado] [bit] NOT NULL,
	[tmon_RazonInactivo] [nvarchar](100) NULL,
	[tmon_UsuarioCrea] [int] NOT NULL,
	[tmon_FechaCrea] [datetime] NOT NULL,
	[tmon_UsuarioModifica] [int] NULL,
	[tmon_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_tbTipoMonedas_tmon_Id] PRIMARY KEY CLUSTERED 
(
	[tmon_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Plani].[V_PreviewPlanilla]    Script Date: 19/11/2019 8:12:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Plani].[V_PreviewPlanilla] AS
SELECT 
EMP.emp_Id,
(PER.per_Nombres+' '+PER.per_Apellidos) AS Nombres,
PER.per_Identidad,
PER.per_Sexo,
PER.per_Edad,
PER.per_Direccion,
PER.per_Telefono,
PER.per_CorreoElectronico,
PER.per_EstadoCivil,
SUE.sue_Cantidad AS salarioBase,
TMON.tmon_Id,
TMON.tmon_Descripcion,
CPLA.cpla_IdPlanilla,
CPLA.cpla_DescripcionPlanilla
FROM [rrhh].[tbEmpleados] EMP
INNER JOIN [rrhh].[tbPersonas] PER ON EMP.per_Id = PER.per_Id
INNER JOIN [rrhh].[tbSueldos] SUE ON EMP.emp_Id = SUE.emp_Id
INNER JOIN [Plani].[tbCatalogoDePlanillas] CPLA ON EMP.cpla_IdPlanilla = CPLA.cpla_IdPlanilla
INNER JOIN [rrhh].[tbTipoMonedas] TMON ON SUE.tmon_Id = TMON.tmon_Id
WHERE sue_SueldoAnterior IS NULL
GO
/****** Object:  Table [rrhh].[tbCargos]    Script Date: 19/11/2019 8:12:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rrhh].[tbCargos](
	[car_Id] [int] NOT NULL,
	[car_Descripcion] [nvarchar](50) NOT NULL,
	[car_Estado] [bit] NOT NULL,
	[car_RazonInactivo] [nvarchar](100) NULL,
	[car_UsuarioCrea] [int] NOT NULL,
	[car_FechaCrea] [datetime] NOT NULL,
	[car_UsuarioModifica] [int] NULL,
	[car_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_tbCargos_car_Id] PRIMARY KEY CLUSTERED 
(
	[car_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Plani].[V_DeduccionesExtraordinarias]    Script Date: 19/11/2019 8:12:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Plani].[V_DeduccionesExtraordinarias]
AS
SELECT
CONCAT(rhp.per_Nombres, ' ', rhp.per_Apellidos) AS per_DeduccionEmpleado,
rhc.car_Descripcion,
pde.dex_ObservacionesComentarios,
pde.dex_MontoInicial,
pde.dex_MontoRestante,
pde.dex_Cuota,
pcd.cde_DescripcionDeduccion
FROM [Plani].[tbDeduccionesExtraordinarias] AS pde
INNER JOIN [Plani].[tbCatalogoDeDeducciones] AS pcd ON pcd.cde_IdDeducciones = pde.cde_IdDeducciones --Relación de Deducciones Extraordinarias con el Catalogo de Deducciones
INNER JOIN [rrhh].[tbEquipoEmpleados] AS rhee ON rhee.eqem_Id = pde.eqem_Id							 --Relación de Deducciones Extraordinarias con el Equipo Empleado 
INNER JOIN [rrhh].[tbEquipoTrabajo] AS rhet ON rhet.eqtra_Id = rhee.eqtra_Id						 --Relación de Equipo Empleado con el Equipo Trabajo
INNER JOIN [rrhh].[tbEmpleados] AS rhe ON rhe.emp_Id = rhee.emp_Id									 --Relación de Equipo Empleado con Empleados
INNER JOIN [rrhh].[tbPersonas] AS rhp ON rhp.per_Id = rhe.per_Id									 --Relación de Empleados con Personas
INNER JOIN [rrhh].[tbCargos] AS rhc ON rhc.car_Id = rhe.car_Id										 --Relación de Empleados con Cargos
WHERE pde.dex_Activo = 1
GO
/****** Object:  View [Plani].[V_CatalogoDeIngresos]    Script Date: 19/11/2019 8:12:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Plani].[V_CatalogoDeIngresos]
AS
SELECT  
        cin.cin_IdIngreso, 
		cin.cin_DescripcionIngreso , 
		cin.cin_UsuarioCrea ,
		cin.cin_FechaCrea ,
		cin.cin_UsuarioModifica ,
		cin.cin_FechaModifica ,
		cin.cin_Activo 
FROM [Plani].[tbCatalogoDeIngresos] AS cin 
WHERE cin.cin_Activo = 1
GO
/****** Object:  View [Plani].[V_EmpleadoComisiones]    Script Date: 19/11/2019 8:12:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [Plani].[V_EmpleadoComisiones]
as 
select a.emp_Id,
concat(c.[per_Nombres], '  ', c.[per_Apellidos]) as Empleado,
a.cin_IdIngreso,
d.[cin_DescripcionIngreso],
a.cc_Monto,
a.cc_FechaRegistro, 
a.cc_Pagado
From [Plani].[tbEmpleadoComisiones]as a
Inner join [rrhh].[tbEmpleados] as b  on a.emp_Id = b.[emp_Id]
inner join [rrhh].[tbPersonas]as c on b.per_Id  = c.per_Id
Inner join [Plani].[tbCatalogoDeIngresos]as d on a.cin_IdIngreso = d.[cin_IdIngreso]
GO
/****** Object:  Table [Plani].[tbHistorialDePago]    Script Date: 19/11/2019 8:12:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Plani].[tbHistorialDePago](
	[hipa_IdHistorialDePago] [int] NOT NULL,
	[emp_Id] [int] NOT NULL,
	[hipa_SueldoNeto] [decimal](10, 2) NOT NULL,
	[hipa_FechaInicio] [datetime] NOT NULL,
	[hipa_FechaFin] [datetime] NOT NULL,
	[hipa_FechaPago] [datetime] NOT NULL,
	[hipa_Anio] [int] NOT NULL,
	[hipa_Mes] [int] NOT NULL,
	[peri_IdPeriodo] [int] NOT NULL,
	[hipa_UsuarioCrea] [int] NOT NULL,
	[hipa_FechaCrea] [datetime] NOT NULL,
	[hipa_UsuarioModifica] [int] NULL,
	[hipa_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_Plani_tbHistorialDePago_hipa_IdHistorialdePago] PRIMARY KEY CLUSTERED 
(
	[hipa_IdHistorialDePago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Plani].[V_DecimoTercerMes]    Script Date: 19/11/2019 8:12:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Plani].[V_DecimoTercerMes]
AS
SELECT        
HP.emp_Id, 
P.per_Nombres, 
P.per_Apellidos, 
C.car_Descripcion, 
CP.cpla_DescripcionPlanilla, 
E.emp_CuentaBancaria,
SUM(HP.hipa_SueldoNeto) / 360 * 30 AS dtm_Monto
FROM            Plani.tbHistorialDePago AS HP INNER JOIN
                         Rrhh.tbPersonas AS P ON HP.emp_Id = P.per_Id INNER JOIN
                         Rrhh.tbEmpleados AS E ON E.emp_Id = P.per_Id INNER JOIN
                         Rrhh.tbCargos AS C ON C.car_Id = E.car_Id INNER JOIN
                         Plani.tbCatalogoDePlanillas AS CP ON CP.cpla_IdPlanilla = E.cpla_IdPlanilla
WHERE        (HP.hipa_Anio = YEAR(GETDATE())) AND (CP.cpla_IdPlanilla <> 1)
GROUP BY HP.emp_Id, P.per_Nombres, P.per_Apellidos, C.car_Descripcion, CP.cpla_DescripcionPlanilla, E.emp_CuentaBancaria
GO
/****** Object:  View [Plani].[V_ColaboradoresPorPlanilla]    Script Date: 19/11/2019 8:12:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW  [Plani].[V_ColaboradoresPorPlanilla] as
SELECT 
CPLA.cpla_IdPlanilla,
CPLA.cpla_DescripcionPlanilla,
COUNT(E.emp_Id) AS CantidadColaboradores

FROM [Plani].[tbCatalogoDePlanillas] CPLA
LEFT JOIN [Rrhh].[tbEmpleados] E ON CPLA.cpla_IdPlanilla = E.cpla_IdPlanilla
GROUP BY CPLA.cpla_IdPlanilla,CPLA.cpla_DescripcionPlanilla
GO
/****** Object:  View [Plani].[V_FormaDePago]    Script Date: 19/11/2019 8:12:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Plani].[V_FormaDePago]
AS
SELECT [fpa_IdFormaPago]
      ,[fpa_Descripcion]
      ,[fpa_UsuarioCrea]
      ,[fpa_FechaCrea]
      ,[fpa_UsuarioModifica]
      ,[fpa_FechaModifica]
      ,[fpa_Activo]
  FROM [Plani].[tbFormaPago] 
GO
/****** Object:  View [Plani].[V_TipoDeduccion]    Script Date: 19/11/2019 8:12:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Plani].[V_TipoDeduccion]
AS
SELECT 
tde_IdTipoDedu, 
tde_Descripcion, 
tde_UsuarioCrea, 
tde_FechaCrea, 
tde_UsuarioModifica, 
tde_FechaModifica, 
tde_Activo
FROM [Plani].[tbTipoDeduccion]
GO
/****** Object:  Table [Plani].[tbTechosDeducciones]    Script Date: 19/11/2019 8:12:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Plani].[tbTechosDeducciones](
	[tede_Id] [int] NOT NULL,
	[tede_RangoInicial] [decimal](10, 2) NOT NULL,
	[tede_RangoFinal] [decimal](10, 2) NOT NULL,
	[tede_Porcentaje] [decimal](10, 2) NOT NULL,
	[cde_IdDeducciones] [int] NOT NULL,
	[tede_UsuarioCrea] [int] NOT NULL,
	[tede_FechaCrea] [datetime] NOT NULL,
	[tede_UsuarioModifica] [int] NULL,
	[tede_FechaModifica] [datetime] NULL,
	[tede_Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Plani_tbImpuestoSobreLaRenta_isr_IdImpuestoSobreRenta] PRIMARY KEY CLUSTERED 
(
	[tede_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Plani].[V_TechosDeducciones]    Script Date: 19/11/2019 8:12:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Plani].[V_TechosDeducciones]
AS
SELECT tede_Id, tede_RangoInicial, tede_RangoFinal, tede_Porcentaje, td.cde_IdDeducciones, tede_UsuarioCrea, tede_FechaCrea, tede_UsuarioModifica, tede_FechaModifica, tede_Activo, cde_DescripcionDeduccion, tde_IdTipoDedu, cde_PorcentajeColaborador, cde_PorcentajeEmpresa, cde_UsuarioCrea, cde_FechaCrea, cde_UsuarioModifica, cde_FechaModifica, cde_Activo 
 FROM [Plani].[tbTechosDeducciones] AS td
INNER JOIN [Plani].[tbCatalogoDeDeducciones] AS d ON td.cde_IdDeducciones = d.cde_IdDeducciones 
GO
/****** Object:  View [Plani].[V_tbCatalogoDeIngresos]    Script Date: 19/11/2019 8:12:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Plani].[V_tbCatalogoDeIngresos]
AS
SELECT  
        cin.cin_IdIngreso, 
		cin.cin_DescripcionIngreso , 
		cin.cin_UsuarioCrea ,
		cin.cin_FechaCrea ,
		cin.cin_UsuarioModifica ,
		cin.cin_FechaModifica ,
		cin.cin_Activo 
FROM [Plani].[tbCatalogoDeIngresos] AS cin 
WHERE cin.cin_Activo = 1
GO
/****** Object:  View [Plani].[V_CatalogoDePlanillasConIngresosYDeducciones]    Script Date: 19/11/2019 8:12:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Plani].[V_CatalogoDePlanillasConIngresosYDeducciones]
(
	idPlanilla,
	descripcionPlanilla,
	frecuenciaEnDias,
	idIngreso,
	descripcionIngreso,
	idDeducciones,
	descripcionDeduccion
)

AS
/****************************************************************************************************
 Seleccionar todos los catalogos de planillas unidos con los ingresos y deducciones que estas tienen.
****************************************************************************************************/

SELECT tcdp.cpla_IdPlanilla, 
       tcdp.cpla_DescripcionPlanilla, 
       tcdp.cpla_FrecuenciaEnDias, 
       tcdi.cin_IdIngreso, 
       tcdi.cin_DescripcionIngreso, 
       tcdd.cde_IdDeducciones, 
       tcdd.cde_DescripcionDeduccion
FROM Plani.tbCatalogoDePlanillas tcdp

/****************************************************************
Unir tipo de planilla detalle deduccion y filtrar que este activo
****************************************************************/

     OUTER APPLY
(
    SELECT ttpdd.tpdd_IdPlanillaDetDeduccion, 
           ttpdd.cpla_IdPlanilla, 
           ttpdd.cde_IdDeducciones, 
           ttpdd.tpdd_UsuarioCrea, 
           ttpdd.tpdd_FechaCrea, 
           ttpdd.tpdd_UsuarioModifica, 
           ttpdd.tpdd_FechaModifica, 
           ttpdd.tpdd_Activo
    FROM Plani.tbTipoPlanillaDetalleDeduccion ttpdd
    WHERE ttpdd.tpdd_Activo = 1
          AND ttpdd.cpla_IdPlanilla = tcdp.cpla_IdPlanilla
) AS ttpdd

/************************************************************************************
Unir la tabla Plani.tbTipoPlanillaDetalleIngreso filtrando solo los que estan activos
************************************************************************************/

     OUTER APPLY
(
    SELECT ttpdi.tpdi_IdDetallePlanillaIngreso, 
           ttpdi.cin_IdIngreso, 
           ttpdi.cpla_IdPlanilla, 
           ttpdi.tpdi_UsuarioCrea, 
           ttpdi.tpdi_FechaCrea, 
           ttpdi.tpdi_UsuarioModifica, 
           ttpdi.tpdi_FechaModifica, 
           ttpdi.tpdi_Activo
    FROM Plani.tbTipoPlanillaDetalleIngreso ttpdi
    WHERE ttpdi.tpdi_Activo = 1
          AND ttpdi.cpla_IdPlanilla = tcdp.cpla_IdPlanilla
) AS ttpdi

/*********************************************************************
Unir la tabla Plani.tbCatalogoDeDeducciones y filtrarlo si esta activo
*********************************************************************/

     OUTER APPLY
(
    SELECT tcdd.cde_IdDeducciones, 
           tcdd.cde_DescripcionDeduccion, 
           tcdd.tde_IdTipoDedu, 
           tcdd.cde_PorcentajeColaborador, 
           tcdd.cde_PorcentajeEmpresa, 
           tcdd.cde_UsuarioCrea, 
           tcdd.cde_FechaCrea, 
           tcdd.cde_UsuarioModifica, 
           tcdd.cde_FechaModifica, 
           tcdd.cde_Activo
    FROM Plani.tbCatalogoDeDeducciones tcdd
    WHERE tcdd.cde_Activo = 1
          AND tcdd.cde_IdDeducciones = ttpdd.cde_IdDeducciones
) AS tcdd

/*****************************************************************
Unir catalogo de ingresos y filtrar si estan activos los registros
*****************************************************************/

     OUTER APPLY
(
    SELECT tcdi.cin_IdIngreso, 
           tcdi.cin_DescripcionIngreso, 
           tcdi.cin_UsuarioCrea, 
           tcdi.cin_FechaCrea, 
           tcdi.cin_UsuarioModifica, 
           tcdi.cin_FechaModifica, 
           tcdi.cin_Activo
    FROM Plani.tbCatalogoDeIngresos tcdi
    WHERE tcdi.cin_Activo = 1
          AND ttpdi.cin_IdIngreso = tcdi.cin_IdIngreso
) AS tcdi
WHERE tcdp.cpla_Activo = 1;
GO
/****** Object:  View [Plani].[V_DeduccionesExtraordinarias_Empleados]    Script Date: 19/11/2019 8:12:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [Plani].[V_DeduccionesExtraordinarias_Empleados]
AS
SELECT
pde.dex_IdDeduccionesExtra,
pde.eqem_Id,
CONCAT(rhp.per_Nombres, ' ', rhp.per_Apellidos) AS per_Empleado,
rhc.car_Descripcion AS car_Cargo,
pde.dex_MontoInicial,
pde.dex_MontoRestante,
pde.dex_ObservacionesComentarios,
pde.cde_IdDeducciones,
pde.dex_Cuota,
pde.dex_UsuarioCrea,
pde.dex_FechaCrea,
pde.dex_UsuarioModifica,
pde.dex_FechaModifica,
pde.dex_Activo
FROM [Plani].[tbDeduccionesExtraordinarias] AS pde
INNER JOIN [Plani].[tbCatalogoDeDeducciones] AS pcd ON pcd.cde_IdDeducciones = pde.cde_IdDeducciones --Relación de Deducciones Extraordinarias con el Catalogo de Deducciones
INNER JOIN [rrhh].[tbEquipoEmpleados] AS rhee ON rhee.eqem_Id = pde.eqem_Id							 --Relación de Deducciones Extraordinarias con el Equipo Empleado 
INNER JOIN [rrhh].[tbEquipoTrabajo] AS rhet ON rhet.eqtra_Id = rhee.eqtra_Id						 --Relación de Equipo Empleado con el Equipo Trabajo
INNER JOIN [rrhh].[tbEmpleados] AS rhe ON rhe.emp_Id = rhee.emp_Id									 --Relación de Equipo Empleado con Empleados
INNER JOIN [rrhh].[tbPersonas] AS rhp ON rhp.per_Id = rhe.per_Id									 --Relación de Empleados con Personas
INNER JOIN [rrhh].[tbCargos] AS rhc ON rhc.car_Id = rhe.car_Id

GO
/****** Object:  View [Plani].[V_EmpleadoBonos]    Script Date: 19/11/2019 8:12:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [Plani].[V_EmpleadoBonos]
AS
SELECT 
	cb.cb_Id,
	cb.emp_Id,
	(p.per_Nombres + ' ' + p.per_Apellidos) AS per_Nombres,
	cb.cin_IdIngreso,
	ci.cin_DescripcionIngreso,
	cb.cb_Monto,
	cb.cb_FechaRegistro,
	cb.cb_Pagado,
	cb.cb_UsuarioCrea,
	cb.cb_FechaCrea, 
	cb.cb_UsuarioModifica, 
	cb.cb_FechaModifica
FROM [Plani].[tbEmpleadoBonos] AS cb
INNER JOIN [rrhh].[tbEmpleados] AS e ON cb.emp_Id = e.emp_Id
INNER JOIN [rrhh].[tbPersonas] AS p ON p.per_Id = e.per_Id
INNER JOIN [Plani].[tbCatalogoDeIngresos] AS ci ON ci.cin_IdIngreso =  cb.cin_IdIngreso
WHERE cb_Activo = 1
GO
/****** Object:  View [Plani].[V_tbCatalogoDeDeducciones]    Script Date: 19/11/2019 8:12:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Plani].[V_tbCatalogoDeDeducciones]
AS
SELECT * FROM [Plani].[tbCatalogoDeDeducciones]
GO
/****** Object:  View [Plani].[V_DecimoCuartoMes]    Script Date: 19/11/2019 8:12:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Plani].[V_DecimoCuartoMes]
AS

    SELECT HP.emp_Id,
            P.[per_Nombres],
            P.[per_Apellidos],
            C.[car_Descripcion],
            CP.[cpla_DescripcionPlanilla],
            SUM(HP.[hipa_SueldoNeto]) / 360 * 30 AS [DecimoTercerMes]
    FROM [Plani].[tbHistorialDePago] HP
    INNER JOIN [Rrhh].[tbPersonas] P ON HP.emp_Id = P.per_Id
    INNER JOIN [Rrhh].[tbEmpleados] E ON E.[emp_Id] = P.per_Id
    INNER JOIN [Rrhh].[tbCargos] C ON C.[car_Id] = E.[car_Id]
    INNER JOIN [Plani].[tbCatalogoDePlanillas] CP ON CP.cpla_IdPlanilla = E.cpla_IdPlanilla
    WHERE HP.hipa_FechaPago BETWEEN CONVERT(DATETIME, CONCAT((YEAR(GETDATE())-1),'-06-30')) 
								AND CONVERT(DATETIME, CONCAT((YEAR(GETDATE())),'-06-30'))
    AND CP.cpla_IdPlanilla != 1
    GROUP BY HP.emp_Id,
                P.per_Nombres,
                P.per_Apellidos,
                C.[car_Descripcion],
                CP.cpla_DescripcionPlanilla
GO
/****** Object:  Table [rrhh].[tbAreas]    Script Date: 19/11/2019 8:12:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rrhh].[tbAreas](
	[area_Id] [int] NOT NULL,
	[car_Id] [int] NOT NULL,
	[suc_Id] [int] NOT NULL,
	[area_Descripcion] [nvarchar](50) NOT NULL,
	[area_Estado] [bit] NOT NULL,
	[area_Razoninactivo] [nvarchar](100) NULL,
	[area_Usuariocrea] [int] NOT NULL,
	[area_Fechacrea] [datetime] NOT NULL,
	[area_Usuariomodifica] [int] NULL,
	[area_Fechamodifica] [datetime] NULL,
 CONSTRAINT [PK_tbAreas_area_Id] PRIMARY KEY CLUSTERED 
(
	[area_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [rrhh].[tbDepartamentos]    Script Date: 19/11/2019 8:12:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rrhh].[tbDepartamentos](
	[depto_Id] [int] NOT NULL,
	[area_Id] [int] NOT NULL,
	[car_Id] [int] NOT NULL,
	[depto_Descripcion] [nvarchar](50) NOT NULL,
	[depto_Estado] [bit] NOT NULL,
	[depto_RazonInactivo] [nvarchar](100) NULL,
	[depto_UsuarioCrea] [int] NOT NULL,
	[depto_Fechacrea] [datetime] NOT NULL,
	[depto_UsuarioModifica] [int] NULL,
	[depto_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_tbDepartamentos_depto_Id] PRIMARY KEY CLUSTERED 
(
	[depto_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Plani].[V_DeduccionesExtraordinarias_Detalles]    Script Date: 19/11/2019 8:12:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [Plani].[V_DeduccionesExtraordinarias_Detalles]
AS
SELECT
pde.dex_IdDeduccionesExtra,
pde.eqem_Id,
CONCAT(rhp.per_Nombres, ' ', rhp.per_Apellidos) AS per_Empleado,
rhc.car_Descripcion AS car_Cargo,
rhd.depto_Descripcion AS depto_Departamento,
rha.area_Descripcion AS area_Area,
pde.dex_ObservacionesComentarios,
rhet.eqtra_Id,
rhet.eqtra_Codigo,
rhet.eqtra_Descripcion,
pde.dex_MontoInicial,
pde.dex_MontoRestante,
pde.dex_Cuota,
pde.cde_IdDeducciones,
pcd.cde_DescripcionDeduccion,
pde.dex_UsuarioCrea,
pde.dex_FechaCrea,
pde.dex_UsuarioModifica,
pde.dex_FechaModifica,
pde.dex_Activo
FROM [Plani].[tbDeduccionesExtraordinarias] AS pde
INNER JOIN [Plani].[tbCatalogoDeDeducciones] AS pcd ON pcd.cde_IdDeducciones = pde.cde_IdDeducciones --Relación de Deducciones Extraordinarias con el Catalogo de Deducciones
INNER JOIN [rrhh].[tbEquipoEmpleados] AS rhee ON rhee.eqem_Id = pde.eqem_Id							 --Relación de Deducciones Extraordinarias con el Equipo Empleado 
INNER JOIN [rrhh].[tbEquipoTrabajo] AS rhet ON rhet.eqtra_Id = rhee.eqtra_Id						 --Relación de Equipo Empleado con el Equipo Trabajo
INNER JOIN [rrhh].[tbEmpleados] AS rhe ON rhe.emp_Id = rhee.emp_Id									 --Relación de Equipo Empleado con Empleados
INNER JOIN [rrhh].[tbPersonas] AS rhp ON rhp.per_Id = rhe.per_Id									 --Relación de Empleados con Personas
INNER JOIN [rrhh].[tbCargos] AS rhc ON rhc.car_Id = rhe.car_Id										 --Relación de Empleados con Cargos
INNER JOIN [rrhh].[tbDepartamentos] AS rhd ON rhd.car_Id = rhc.car_Id                                --Relación de Cargos con Departamentos
INNER JOIN [rrhh].[tbAreas] AS rha ON rha.area_Id = rhd.area_Id                                      --Relación de Departamentos con Áreas
WHERE pde.dex_Activo = 1
GO
/****** Object:  Table [Acce].[tbAccesoRol]    Script Date: 19/11/2019 8:12:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Acce].[tbAccesoRol](
	[acrol_Id] [int] NOT NULL,
	[rol_Id] [int] NULL,
	[obj_Id] [int] NULL,
	[acrol_UsuarioCrea] [int] NULL,
	[acrol_FechaCrea] [datetime] NULL,
	[acrol_UsuarioModifica] [int] NULL,
	[acrol_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_ Acce _ tbAccesoRol _acrol_Id] PRIMARY KEY CLUSTERED 
(
	[acrol_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Acce].[tbObjeto]    Script Date: 19/11/2019 8:12:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Acce].[tbObjeto](
	[obj_Id] [int] NOT NULL,
	[obj_Pantalla] [nvarchar](50) NULL,
	[obj_Referencia] [varchar](100) NULL,
	[obj_UsuarioCrea] [int] NULL,
	[obj_FechaCrea] [datetime] NULL,
	[obj_UsuarioModifica] [int] NULL,
	[obj_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_Acce_ tbObjeto _obj_Id] PRIMARY KEY CLUSTERED 
(
	[obj_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Acce].[tbRol]    Script Date: 19/11/2019 8:12:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Acce].[tbRol](
	[rol_Id] [int] NOT NULL,
	[rol_Descripcion] [varchar](100) NULL,
	[rol_UsuarioCrea] [int] NULL,
	[rol_FechaCrea] [datetime] NULL,
	[rol_UsuarioModifica] [int] NULL,
	[rol_FechaModifica] [datetime] NULL,
	[rol_Estado] [bit] NOT NULL,
 CONSTRAINT [PK_ Acce _ tbRol _rol_Id] PRIMARY KEY CLUSTERED 
(
	[rol_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Acce].[tbRolesUsuario]    Script Date: 19/11/2019 8:12:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Acce].[tbRolesUsuario](
	[rolu_Id] [int] NOT NULL,
	[rol_Id] [int] NULL,
	[usu_Id] [int] NULL,
	[rolu_UsuarioCrea] [int] NULL,
	[rolu_FechaCrea] [datetime] NULL,
	[rolu_UsuarioModifica] [int] NULL,
	[rolu_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_Acce_tbRolesUsuario_rolu_Id] PRIMARY KEY CLUSTERED 
(
	[rolu_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Acce].[tbUsuario]    Script Date: 19/11/2019 8:12:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Acce].[tbUsuario](
	[usu_Id] [int] NOT NULL,
	[usu_NombreUsuario] [varchar](100) NULL,
	[usu_Password] [varbinary](64) NULL,
	[usu_Nombres] [varchar](150) NULL,
	[usu_Apellidos] [varchar](150) NULL,
	[usu_Correos] [varchar](150) NULL,
	[usu_EsActivo] [bit] NOT NULL,
	[usu_RazonInactivo] [varchar](150) NULL,
	[usu_EsAdministrador] [bit] NOT NULL,
	[usu_SesionesValidas] [tinyint] NULL,
 CONSTRAINT [PK_usu_Id] PRIMARY KEY CLUSTERED 
(
	[usu_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Plani].[tbAdelantoSueldo]    Script Date: 19/11/2019 8:12:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Plani].[tbAdelantoSueldo](
	[adsu_IdAdelantoSueldo] [int] NOT NULL,
	[emp_Id] [int] NOT NULL,
	[adsu_FechaAdelanto] [datetime] NOT NULL,
	[adsu_RazonAdelanto] [nvarchar](50) NOT NULL,
	[adsu_Monto] [decimal](16, 2) NOT NULL,
	[peri_IdPeriodo] [int] NOT NULL,
	[cde_IdDeducciones] [int] NOT NULL,
	[adsu_Pagado] [bit] NOT NULL,
	[adsu_UsuarioCrea] [int] NOT NULL,
	[adsu_FechaCrea] [datetime] NOT NULL,
	[adsu_UsuarioModifica] [int] NULL,
	[adsu_FechaModifica] [datetime] NULL,
	[adsu_Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Plani_tbAdelantoSueldo_IdAdelantoSueldo] PRIMARY KEY CLUSTERED 
(
	[adsu_IdAdelantoSueldo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Plani].[tbAuxilioDeCesantias]    Script Date: 19/11/2019 8:12:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Plani].[tbAuxilioDeCesantias](
	[aces_IdAuxilioCesantia] [int] NOT NULL,
	[aces_RangoInicioMeses] [int] NOT NULL,
	[aces_RangoFinMeses] [int] NOT NULL,
	[aces_DiasAuxilioCesantia] [int] NOT NULL,
	[aces_UsuarioCrea] [int] NOT NULL,
	[aces_FechaCrea] [datetime] NOT NULL,
	[aces_UsuarioModifica] [int] NULL,
	[aces_FechaModifica] [datetime] NULL,
	[aces_Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Plani_tbAuxilioDeCesantias_aces_IdAuxilioCesantia] PRIMARY KEY CLUSTERED 
(
	[aces_IdAuxilioCesantia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Plani].[tbDecimoCuartoMes]    Script Date: 19/11/2019 8:12:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Plani].[tbDecimoCuartoMes](
	[dcm_IdDecimoCuartoMes] [int] NOT NULL,
	[hipa_IdHistorialDePago] [int] NOT NULL,
	[dcm_FechaInicio] [datetime] NOT NULL,
	[dcm_FechaFin] [datetime] NOT NULL,
	[dcm_FechaPago] [datetime] NOT NULL,
	[dcm_Anio] [int] NOT NULL,
	[dcm_UsuarioCrea] [int] NOT NULL,
	[dcm_FechaCrea] [datetime] NOT NULL,
	[dcm_UsuarioModifica] [int] NULL,
	[dcm_FechaModifica] [datetime] NULL,
	[dcm_Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Plani_tbDecimoCuartoMes_dcm_IdDecimoCuartoMes] PRIMARY KEY CLUSTERED 
(
	[dcm_IdDecimoCuartoMes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Plani].[tbDecimoTercerMes]    Script Date: 19/11/2019 8:12:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Plani].[tbDecimoTercerMes](
	[dtm_IdDecimoTercerMes] [int] IDENTITY(1,1) NOT NULL,
	[dtm_FechaPago] [datetime] NOT NULL,
	[dtm_UsuarioCrea] [int] NOT NULL,
	[dtm_FechaCrea] [datetime] NOT NULL,
	[dtm_UsuarioModifica] [int] NULL,
	[dtm_FechaModifica] [datetime] NULL,
	[emp_Id] [int] NULL,
	[dtm_Monto] [decimal](18, 3) NULL,
	[dtm_CodigoPago] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Plani_tbDecimoTercerMes_dtm_Id_DecimoTercerMes] PRIMARY KEY CLUSTERED 
(
	[dtm_IdDecimoTercerMes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Plani].[tbHistorialDeduccionPago]    Script Date: 19/11/2019 8:12:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Plani].[tbHistorialDeduccionPago](
	[hidp_IdHistorialdeDeduPago] [int] NOT NULL,
	[tpdd_IdPlanillaDetDeduccion] [int] NOT NULL,
	[hipa_IdHistorialDePago] [int] NOT NULL,
	[hidp_Total] [decimal](10, 2) NOT NULL,
	[hidp_UsuarioCrea] [int] NOT NULL,
	[hidp_FechaCrea] [datetime] NOT NULL,
	[hidp_UsuarioModifica] [int] NULL,
	[hidp_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_Plani_tbHistorialDeDeduccionPago_hidp_IdHistorialdeDeduPago ] PRIMARY KEY CLUSTERED 
(
	[hidp_IdHistorialdeDeduPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Plani].[tbHistorialDeIngresosPago]    Script Date: 19/11/2019 8:12:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Plani].[tbHistorialDeIngresosPago](
	[hip_IdHistorialDeIngresosPago] [int] NOT NULL,
	[hipa_IdHistorialDePago] [int] NOT NULL,
	[hip_FechaInicio] [datetime] NOT NULL,
	[hip_FechaFinal] [datetime] NOT NULL,
	[hip_UnidadesPagar] [int] NOT NULL,
	[hip_MedidaUnitaria] [int] NOT NULL,
	[hip_TotalPagar] [decimal](10, 2) NOT NULL,
	[tpdi_IdDetallePlanillaIngreso] [int] NOT NULL,
	[hip_UsuarioCrea] [int] NOT NULL,
	[hip_FechaCrea] [datetime] NOT NULL,
	[hip_UsuarioModifica] [int] NULL,
	[hip_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_Plani_tbHistorialDeIngresosPago_hip_IdHistorialdeIngresoPago ] PRIMARY KEY CLUSTERED 
(
	[hip_IdHistorialDeIngresosPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Plani].[tbLiquidaciones]    Script Date: 19/11/2019 8:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Plani].[tbLiquidaciones](
	[liqu_IdLiquidacion] [int] NOT NULL,
	[emp_Id] [int] NOT NULL,
	[prea_IdPreaviso] [int] NOT NULL,
	[pvac_IdPagoVacaciones] [int] NOT NULL,
	[aces_IdAuxilioCesantia] [int] NOT NULL,
	[mliq_IdMotivoLiquidacion] [int] NOT NULL,
	[liqu_UsuarioCrea] [int] NOT NULL,
	[liqu_FechaCrea] [datetime] NOT NULL,
	[liqu_UsuarioModifica] [int] NULL,
	[liqu_FechaModifica] [datetime] NULL,
	[liqu_Activo] [bit] NOT NULL,
 CONSTRAINT [PK_tbLiquidaciones] PRIMARY KEY CLUSTERED 
(
	[liqu_IdLiquidacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Plani].[tbLiquidacionVacaciones]    Script Date: 19/11/2019 8:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Plani].[tbLiquidacionVacaciones](
	[pvac_IdPagoVacaciones] [int] NOT NULL,
	[pvac_Antiguedad] [int] NOT NULL,
	[pvac_dias] [int] NOT NULL,
	[pvac_UsuarioCrea] [int] NOT NULL,
	[pvac_FechaCrea] [datetime] NOT NULL,
	[pvac_UsuarioModifica] [int] NULL,
	[pvac_FechaModifica] [datetime] NULL,
	[pvac_Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Plani_tbLiquidacionesVacaciones_pvac_IdPagoVacaciones] PRIMARY KEY CLUSTERED 
(
	[pvac_IdPagoVacaciones] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Plani].[tbMotivoLiquidaciones]    Script Date: 19/11/2019 8:12:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Plani].[tbMotivoLiquidaciones](
	[mliq_IdMotivoLiquidacion] [int] NOT NULL,
	[mliq_Descripcion] [nvarchar](50) NOT NULL,
	[mliq_EsJustificado] [bit] NOT NULL,
	[mliq_UsuarioCrea] [int] NOT NULL,
	[mliq_FechaCrea] [datetime] NOT NULL,
	[mliq_UsuarioModifica] [int] NULL,
	[mliq_FechaModifica] [datetime] NULL,
	[mliq_Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Plani_tbMotivoLiquidaciones_mliq_IdMotivoLiquidacion] PRIMARY KEY CLUSTERED 
(
	[mliq_IdMotivoLiquidacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Plani].[tbPeriodos]    Script Date: 19/11/2019 8:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Plani].[tbPeriodos](
	[peri_IdPeriodo] [int] NOT NULL,
	[peri_DescripPeriodo] [nvarchar](100) NOT NULL,
	[peri_UsuarioCrea] [int] NOT NULL,
	[peri_FechaCrea] [datetime] NOT NULL,
	[peri_UsuarioModifica] [int] NULL,
	[peri_FechaModifica] [datetime] NULL,
	[peri_Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Plani_tbPeriodos_peri_IdPeriodo] PRIMARY KEY CLUSTERED 
(
	[peri_IdPeriodo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Plani].[tbPreaviso]    Script Date: 19/11/2019 8:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Plani].[tbPreaviso](
	[prea_IdPreaviso] [int] NOT NULL,
	[prea_RangoInicioMeses] [int] NOT NULL,
	[prea_RangoFinMeses] [int] NOT NULL,
	[prea_DiasPreaviso] [int] NOT NULL,
	[prea_UsuarioCrea] [int] NOT NULL,
	[prea_FechaCrea] [datetime] NOT NULL,
	[prea_UsuarioModifica] [int] NULL,
	[prea_FechaModifica] [datetime] NULL,
	[prea_Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Plani_tbPreaviso_prea_IdPreaviso] PRIMARY KEY CLUSTERED 
(
	[prea_IdPreaviso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Plani].[tbRamaActividad]    Script Date: 19/11/2019 8:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Plani].[tbRamaActividad](
	[rama_Id] [int] NOT NULL,
	[rama_Descripcion] [nvarchar](100) NOT NULL,
	[rama_UsuarioCrea] [int] NOT NULL,
	[rama_FechaCrea] [datetime] NOT NULL,
	[rama_UsuarioModifica] [int] NULL,
	[rama_FechaModifica] [datetime] NULL,
	[rama_Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Plani_tbRamaActividad_rama_Id] PRIMARY KEY CLUSTERED 
(
	[rama_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Plani].[tbSalarioPorHora]    Script Date: 19/11/2019 8:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Plani].[tbSalarioPorHora](
	[saph_Idsaph] [int] NOT NULL,
	[rama_Id] [int] NOT NULL,
	[saph_SalarioMinimo] [decimal](10, 2) NOT NULL,
	[jor_Id] [int] NOT NULL,
	[saph_Monto] [decimal](10, 2) NOT NULL,
	[saph_TamanoEmpresaInicial] [int] NOT NULL,
	[saph_TamanoEmpresaFinal] [int] NOT NULL,
	[saph_UsuarioCrea] [int] NOT NULL,
	[saph_FechaCrea] [datetime] NOT NULL,
	[saph_UsuarioModifica] [int] NULL,
	[saph_FechaModifica] [datetime] NULL,
	[saph_Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Plani_tbSalarioPorHora_saph_Id] PRIMARY KEY CLUSTERED 
(
	[saph_Idsaph] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [rrhh].[tbCompetencias]    Script Date: 19/11/2019 8:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rrhh].[tbCompetencias](
	[comp_Id] [int] NOT NULL,
	[comp_Descripcion] [nvarchar](100) NOT NULL,
	[comp_Estado] [bit] NOT NULL,
	[comp_RazonInactivo] [nvarchar](100) NULL,
	[comp_UsuarioCrea] [int] NOT NULL,
	[comp_FechaCrea] [datetime] NOT NULL,
	[comp_UsuarioModifica] [int] NULL,
	[comp_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_tbCompetencias_comp_Id] PRIMARY KEY CLUSTERED 
(
	[comp_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [rrhh].[tbCompetenciasPersona]    Script Date: 19/11/2019 8:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rrhh].[tbCompetenciasPersona](
	[cope_Id] [int] NOT NULL,
	[per_Id] [int] NOT NULL,
	[comp_Id] [int] NOT NULL,
	[cope_Estado] [bit] NOT NULL,
	[cope_RazonInactivo] [nvarchar](100) NULL,
	[cope_UsuarioCrea] [int] NOT NULL,
	[cope_FechaCrea] [datetime] NOT NULL,
	[cope_UsuarioModifica] [int] NULL,
	[cope_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_tbcompetenciasPersona_cope_Id] PRIMARY KEY CLUSTERED 
(
	[cope_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [rrhh].[tbCompetenciasRequisicion]    Script Date: 19/11/2019 8:12:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rrhh].[tbCompetenciasRequisicion](
	[creq_Id] [int] NOT NULL,
	[req_Id] [int] NOT NULL,
	[comp_Id] [int] NOT NULL,
	[creq_Estado] [bit] NOT NULL,
	[creq_RazonInactivo] [nvarchar](100) NULL,
	[creq_UsuarioCrea] [int] NOT NULL,
	[creq_FechaCrea] [datetime] NOT NULL,
	[creq_UsuarioModifica] [int] NULL,
	[req_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_tbCompetenciasRequisicion_creq_Id] PRIMARY KEY CLUSTERED 
(
	[creq_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [rrhh].[tbEmpresas]    Script Date: 19/11/2019 8:12:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rrhh].[tbEmpresas](
	[empr_Id] [int] NOT NULL,
	[empr_Nombre] [nvarchar](40) NOT NULL,
	[empr_Estado] [bit] NOT NULL,
	[empr_RazonInactivo] [nvarchar](100) NULL,
	[empr_UsuarioCrea] [int] NOT NULL,
	[empr_FechaCrea] [datetime] NOT NULL,
	[empr_UsuarioModifica] [int] NULL,
	[empr_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_tbEmpresas_empr_Id] PRIMARY KEY CLUSTERED 
(
	[empr_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [rrhh].[tbFaseSeleccion]    Script Date: 19/11/2019 8:12:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rrhh].[tbFaseSeleccion](
	[fsel_Id] [int] NOT NULL,
	[fare_Id] [int] NOT NULL,
	[fsel_Fecha] [datetime] NOT NULL,
	[fsel_Estado] [bit] NOT NULL,
	[fsel_RazonInactivo] [nvarchar](100) NULL,
	[fsel_UsuarioCrea] [int] NOT NULL,
	[fsel_FechaCrea] [datetime] NOT NULL,
	[fsel_UsuarioModifica] [int] NULL,
	[fsel_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_tbFaseSeleccion_fsel_Id] PRIMARY KEY CLUSTERED 
(
	[fsel_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [rrhh].[tbFasesReclutamiento]    Script Date: 19/11/2019 8:12:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rrhh].[tbFasesReclutamiento](
	[fare_Id] [int] NOT NULL,
	[fare_Descripcion] [nvarchar](50) NOT NULL,
	[fare_Estado] [bit] NOT NULL,
	[fare_RazonInactivo] [nvarchar](100) NULL,
	[fare_UsuarioCrea] [int] NOT NULL,
	[fare_FechaCrea] [datetime] NOT NULL,
	[fare_UsuarioModifica] [int] NULL,
	[fare_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_tbFasesReclutamiento_fare_Id] PRIMARY KEY CLUSTERED 
(
	[fare_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [rrhh].[tbHabilidades]    Script Date: 19/11/2019 8:12:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rrhh].[tbHabilidades](
	[habi_Id] [int] NOT NULL,
	[habi_Descripcion] [nvarchar](50) NULL,
	[habi_Estado] [bit] NOT NULL,
	[habi_RazonInactivo] [nvarchar](50) NULL,
	[habi_UsuarioCrea] [int] NOT NULL,
	[habi_FechaCrea] [datetime] NOT NULL,
	[habi_UsuarioModifica] [int] NULL,
	[habi_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_tbHabilidades_habi_Id] PRIMARY KEY CLUSTERED 
(
	[habi_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [rrhh].[tbHabilidadesPersona]    Script Date: 19/11/2019 8:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rrhh].[tbHabilidadesPersona](
	[hape_Id] [int] NOT NULL,
	[per_Id] [int] NOT NULL,
	[habi_Id] [int] NOT NULL,
	[hape_Estado] [bit] NOT NULL,
	[hape_RazonInactivo] [nvarchar](100) NULL,
	[hape_UsuarioCrea] [int] NOT NULL,
	[hape_FechaCrea] [datetime] NOT NULL,
	[hape_UsuarioModifica] [int] NULL,
	[hape_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_tbHabilidadesPersona_hape_Id] PRIMARY KEY CLUSTERED 
(
	[hape_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [rrhh].[tbHabilidadesRequisicion]    Script Date: 19/11/2019 8:12:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rrhh].[tbHabilidadesRequisicion](
	[hreq_Id] [int] NOT NULL,
	[req_Id] [int] NOT NULL,
	[habi_Id] [int] NOT NULL,
	[hreq_Estado] [bit] NOT NULL,
	[hreq_RazonInactivo] [nvarchar](100) NULL,
	[hreq_UsuarioCrea] [int] NOT NULL,
	[hreq_FechaCrea] [datetime] NOT NULL,
	[hreq_UsuarioModifica] [int] NULL,
	[hreq_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_tbHabilidadesRequisicion_hreq_Id] PRIMARY KEY CLUSTERED 
(
	[hreq_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [rrhh].[tbHistorialAmonestaciones]    Script Date: 19/11/2019 8:12:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rrhh].[tbHistorialAmonestaciones](
	[hamo_Id] [int] NOT NULL,
	[emp_Id] [int] NOT NULL,
	[tamo_Id] [int] NOT NULL,
	[tamo_Fecha] [datetime] NOT NULL,
	[hamo_AmonestacionAnterior] [int] NOT NULL,
	[hamo_Observacion] [nvarchar](25) NULL,
	[hamo_Estado] [bit] NOT NULL,
	[hamo_EsInactivo] [nvarchar](100) NULL,
	[hamo_UsuarioCrea] [int] NOT NULL,
	[hamo_FechaCrea] [datetime] NOT NULL,
	[hamo_UsuarioModifica] [int] NULL,
	[hamo_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_tbHistorialAmonestaciones_hamo_Id] PRIMARY KEY CLUSTERED 
(
	[hamo_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [rrhh].[tbHistorialAudienciaDescargo]    Script Date: 19/11/2019 8:12:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rrhh].[tbHistorialAudienciaDescargo](
	[aude_Id] [int] NOT NULL,
	[emp_Id] [int] NOT NULL,
	[aude_Descripcion] [nvarchar](25) NOT NULL,
	[aude_FechaAudiencia] [datetime] NOT NULL,
	[aude_Testigo] [bit] NOT NULL,
	[aude_DireccionArchivo] [nvarchar](25) NULL,
	[aude_Estado] [bit] NOT NULL,
	[aude_RazonInactivo] [nvarchar](100) NULL,
	[aude_UsuarioCrea] [int] NOT NULL,
	[aude_FechaCrea] [datetime] NOT NULL,
	[aude_UsuarioModifica] [int] NULL,
	[aude_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_tbHistorialAudienciaDescargo_aude_Id] PRIMARY KEY CLUSTERED 
(
	[aude_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [rrhh].[tbHistorialCargos]    Script Date: 19/11/2019 8:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rrhh].[tbHistorialCargos](
	[hcar_Id] [int] NOT NULL,
	[emp_Id] [int] NOT NULL,
	[car_Id] [int] NOT NULL,
	[hcar_Fecha] [datetime] NULL,
	[hcar_Estado] [bit] NOT NULL,
	[hcar_RazonInactivo] [nvarchar](100) NULL,
	[hcar_UsuarioCrea] [int] NOT NULL,
	[hcar_FechaCrea] [datetime] NOT NULL,
	[hcar_UsuarioModifica] [int] NULL,
	[hcar_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_tbHistorialCargos_hcar_Id] PRIMARY KEY CLUSTERED 
(
	[hcar_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [rrhh].[tbHistorialContrataciones]    Script Date: 19/11/2019 8:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rrhh].[tbHistorialContrataciones](
	[hcon_Id] [int] NOT NULL,
	[scan_Id] [int] NOT NULL,
	[depto_Id] [int] NOT NULL,
	[hcon_FechaContratado] [date] NOT NULL,
	[hcon_Estado] [bit] NOT NULL,
	[hcon_RazonInactivo] [nvarchar](100) NULL,
	[hcon_UsuarioCrea] [int] NOT NULL,
	[hcon_FechaCrea] [datetime] NOT NULL,
	[hcon_UsuarioModifica] [int] NULL,
	[hcon_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_tbHistorialContrataciones_hcon_Id] PRIMARY KEY CLUSTERED 
(
	[hcon_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [rrhh].[tbHistorialHorasTrabajadas]    Script Date: 19/11/2019 8:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rrhh].[tbHistorialHorasTrabajadas](
	[htra_Id] [int] NOT NULL,
	[emp_Id] [int] NOT NULL,
	[tiho_Id] [int] NOT NULL,
	[jor_Id] [int] NOT NULL,
	[htra_CantidadHoras] [int] NOT NULL,
	[htra_Fecha] [date] NULL,
	[htra_Estado] [bit] NOT NULL,
	[htra_RazonInactivo] [nvarchar](100) NULL,
	[htra_UsuarioCrea] [int] NOT NULL,
	[htra_FechaCrea] [datetime] NOT NULL,
	[htra_UsuarioModifica] [int] NULL,
	[htra_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_tbHistorialHorasTrabajadas_htra_Id] PRIMARY KEY CLUSTERED 
(
	[htra_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [rrhh].[tbHistorialIncapacidades]    Script Date: 19/11/2019 8:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rrhh].[tbHistorialIncapacidades](
	[hinc_Id] [int] NOT NULL,
	[Emp_Id] [int] NOT NULL,
	[ticn_Id] [int] NOT NULL,
	[hinc_PorcentajeIndemnizado] [int] NOT NULL,
	[hinc_Observacion] [nvarchar](25) NULL,
	[hinc_FechaInicio] [datetime] NULL,
	[hinc_FechaFin] [datetime] NULL,
	[hinc_UsuarioCrea] [int] NOT NULL,
	[hinc_FechaCrea] [datetime] NOT NULL,
	[hinc_UsuarioModifica] [int] NULL,
	[hinc_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_tbHistorialincapacidades_hinc_Id] PRIMARY KEY CLUSTERED 
(
	[hinc_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [rrhh].[tbHistorialLiquidaciones]    Script Date: 19/11/2019 8:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rrhh].[tbHistorialLiquidaciones](
	[hliq_Id] [int] NOT NULL,
	[emp_Id] [int] NOT NULL,
	[hliq_fechaIngreso] [datetime] NOT NULL,
	[hliq_fechaLiquidacion] [datetime] NOT NULL,
	[hliq_PorcentajeLiquidacion] [int] NOT NULL,
	[hliq_Observaciones] [nvarchar](25) NULL,
	[hliq_Estado] [bit] NOT NULL,
	[hliq_RazonInactivo] [nvarchar](100) NULL,
	[hliq_UsuarioCrea] [int] NOT NULL,
	[hliq_FechaCrea] [datetime] NOT NULL,
	[hliq_UsuarioModifica] [int] NULL,
	[hliq_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_tbHistorialLiquidaciones_hliq_Id] PRIMARY KEY CLUSTERED 
(
	[hliq_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [rrhh].[tbHistorialPermisos]    Script Date: 19/11/2019 8:12:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rrhh].[tbHistorialPermisos](
	[hper_Id] [int] NOT NULL,
	[emp_Id] [int] NOT NULL,
	[tper_Id] [int] NOT NULL,
	[hper_fechaInicio] [datetime] NOT NULL,
	[hper_fechaFin] [datetime] NOT NULL,
	[hper_Duracion] [int] NOT NULL,
	[hper_Observacion] [nvarchar](25) NULL,
	[hper_Estado] [bit] NOT NULL,
	[hper_RazonInactivo] [nvarchar](100) NULL,
	[hper_UsuarioCrea] [int] NOT NULL,
	[hper_FechaCrea] [datetime] NOT NULL,
	[hper_UsuarioModifica] [int] NULL,
	[hper_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_tbHistorialPermisos_hper_Id] PRIMARY KEY CLUSTERED 
(
	[hper_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [rrhh].[tbHistorialRefrendamientos]    Script Date: 19/11/2019 8:12:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rrhh].[tbHistorialRefrendamientos](
	[href_Id] [int] NOT NULL,
	[emp_Id] [int] NOT NULL,
	[href_Archivo] [nvarchar](25) NULL,
	[href_FechaRefrendado] [date] NOT NULL,
	[href_Estado] [bit] NOT NULL,
	[href_RazonInactivo] [nvarchar](100) NULL,
	[href_UsuarioCrea] [int] NOT NULL,
	[href_FechaCrea] [datetime] NOT NULL,
	[href_UsuarioModifica] [int] NULL,
	[href_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_tbHistorialRefrendamientos_href_Id] PRIMARY KEY CLUSTERED 
(
	[href_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [rrhh].[tbHistorialSalidas]    Script Date: 19/11/2019 8:12:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rrhh].[tbHistorialSalidas](
	[hsal_Id] [int] NOT NULL,
	[emp_Id] [int] NOT NULL,
	[tsal_Id] [int] NOT NULL,
	[rsal_Id] [int] NOT NULL,
	[pres_Id] [int] NOT NULL,
	[hsal_FechaSalida] [date] NOT NULL,
	[hsal_Observacion] [nvarchar](25) NULL,
	[hsal_Estado] [bit] NOT NULL,
	[hsal_RazonInactivo] [nvarchar](100) NULL,
	[hsal_UsuarioCrea] [int] NOT NULL,
	[hsal_FechaCrea] [datetime] NOT NULL,
	[hsal_UsuarioModifica] [int] NULL,
	[hsal_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_tbHistorialSalidas_hsal_Id] PRIMARY KEY CLUSTERED 
(
	[hsal_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [rrhh].[tbHistorialVacaciones]    Script Date: 19/11/2019 8:12:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rrhh].[tbHistorialVacaciones](
	[hvac_Id] [int] NOT NULL,
	[emp_Id] [int] NOT NULL,
	[hvac_Fechanainicio] [date] NOT NULL,
	[hvac_Fechafin] [date] NOT NULL,
	[hvac_DiasTomados] [bit] NOT NULL,
	[hvac_MesVacaciones] [int] NOT NULL,
	[hvac_AnioVacaciones] [int] NOT NULL,
	[hvac_Estado] [bit] NOT NULL,
	[hvac_RazonInactivo] [nvarchar](100) NULL,
	[hvac_UsuarioCrea] [int] NOT NULL,
	[hvac_FechaCrea] [datetime] NOT NULL,
	[hvac_UsuarioModifica] [int] NULL,
	[hvac_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_tbHistorialVacaciones_hvac_Id] PRIMARY KEY CLUSTERED 
(
	[hvac_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [rrhh].[tbHorarios]    Script Date: 19/11/2019 8:12:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rrhh].[tbHorarios](
	[hor_Id] [int] NOT NULL,
	[jor_Id] [int] NOT NULL,
	[hor_Descripcion] [nvarchar](50) NULL,
	[hor_HoraInicio] [time](7) NOT NULL,
	[hor_HoraFin] [time](7) NOT NULL,
	[hor_CantidadHoras] [time](7) NOT NULL,
	[hor_Estado] [bit] NOT NULL,
	[hor_RazonInactivo] [nvarchar](100) NULL,
	[hor_UsuarioCrea] [int] NOT NULL,
	[hor_FechaCrea] [datetime] NOT NULL,
	[hor_UsuarioModifica] [int] NULL,
	[hor_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_tbHorarios_hor_Id] PRIMARY KEY CLUSTERED 
(
	[hor_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [rrhh].[tbIdiomaPersona]    Script Date: 19/11/2019 8:12:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rrhh].[tbIdiomaPersona](
	[idpe_Id] [int] NOT NULL,
	[per_Id] [int] NULL,
	[idi_Id] [int] NULL,
	[idpe_Estado] [bit] NOT NULL,
	[idpe_RazonInactivo] [nvarchar](100) NULL,
	[idpe_UsuarioCrea] [int] NOT NULL,
	[idpe_FechaCrea] [datetime] NOT NULL,
	[idpe_UsuarioModifica] [int] NULL,
	[idpe_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_tbIdiomaPersona_idpe_Id] PRIMARY KEY CLUSTERED 
(
	[idpe_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [rrhh].[tbIdiomas]    Script Date: 19/11/2019 8:12:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rrhh].[tbIdiomas](
	[idi_Id] [int] NOT NULL,
	[idi_Descripcion] [nvarchar](50) NULL,
	[idi_Estado] [bit] NOT NULL,
	[idi_RazonInactivo] [nvarchar](100) NULL,
	[idi_UsuarioCrea] [int] NOT NULL,
	[idi_FechaCrea] [datetime] NOT NULL,
	[idi_UsuarioModifica] [int] NULL,
	[idi_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_tbidiomas_idi_Id] PRIMARY KEY CLUSTERED 
(
	[idi_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [rrhh].[tbIdiomasRequisicion]    Script Date: 19/11/2019 8:12:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rrhh].[tbIdiomasRequisicion](
	[ireq_Id] [int] NOT NULL,
	[req_Id] [int] NOT NULL,
	[idi_Id] [int] NOT NULL,
	[ireq_Estado] [bit] NOT NULL,
	[ireq_RazonInactivo] [nvarchar](100) NULL,
	[ireq_UsuarioCrea] [int] NOT NULL,
	[ireq_FechaCrea] [datetime] NOT NULL,
	[ireq_UsuarioModifica] [int] NULL,
	[ireq_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_tbIdiomasRequisicion_ireq_Id] PRIMARY KEY CLUSTERED 
(
	[ireq_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [rrhh].[tbJornadas]    Script Date: 19/11/2019 8:12:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rrhh].[tbJornadas](
	[jor_Id] [int] NOT NULL,
	[jor_Descripcion] [nvarchar](30) NULL,
	[jor_Estado] [bit] NOT NULL,
	[jor_RazonInactivo] [nvarchar](100) NULL,
	[jor_UsuarioCrea] [int] NOT NULL,
	[jor_FechaCrea] [datetime] NOT NULL,
	[jor_UsuarioModifica] [int] NULL,
	[jor_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_tbJornadas_jor_Id] PRIMARY KEY CLUSTERED 
(
	[jor_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [rrhh].[tbNacionalidades]    Script Date: 19/11/2019 8:12:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rrhh].[tbNacionalidades](
	[nac_Id] [int] NOT NULL,
	[nac_Descripcion] [nvarchar](50) NULL,
	[nac_Estado] [bit] NOT NULL,
	[nac_RazonInactivo] [nvarchar](100) NULL,
	[nac_UsuarioCrea] [int] NOT NULL,
	[nac_FechaCrea] [datetime] NOT NULL,
	[nac_UsuarioModifica] [int] NULL,
	[nac_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_tbNacionalidades_nac_Id] PRIMARY KEY CLUSTERED 
(
	[nac_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [rrhh].[tbPrestaciones]    Script Date: 19/11/2019 8:12:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rrhh].[tbPrestaciones](
	[pres_Id] [int] NOT NULL,
	[pres_DerechoPreaviso] [bit] NOT NULL,
	[pres_Preaviso] [decimal](8, 4) NOT NULL,
	[pres_DecimoTercer] [decimal](8, 4) NOT NULL,
	[pres_Catorceavo] [decimal](8, 4) NOT NULL,
	[pres_Estado] [bit] NOT NULL,
	[pres_RazonInactivo] [nvarchar](100) NULL,
	[pres_UsuarioCrea] [int] NOT NULL,
	[pres_FechaCrea] [datetime] NOT NULL,
	[pres_UsuarioModifica] [int] NULL,
	[pres_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_tbPrestaciones_pres_Id] PRIMARY KEY CLUSTERED 
(
	[pres_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [rrhh].[tbRazonSalidas]    Script Date: 19/11/2019 8:12:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rrhh].[tbRazonSalidas](
	[rsal_Id] [int] NOT NULL,
	[rsal_Descripcion] [nvarchar](50) NOT NULL,
	[rsal_Estado] [bit] NOT NULL,
	[rsal_RazonInactivo] [nvarchar](100) NULL,
	[rsal_UsuarioCrea] [int] NOT NULL,
	[rsal_FechaCrea] [datetime] NOT NULL,
	[rsal_UsuarioModifica] [int] NULL,
	[rsal_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK__tbRazonSalidas_rsal_Id] PRIMARY KEY CLUSTERED 
(
	[rsal_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [rrhh].[tbRequisiciones]    Script Date: 19/11/2019 8:12:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rrhh].[tbRequisiciones](
	[req_Id] [int] NOT NULL,
	[req_Edad] [int] NULL,
	[req_Experiencia] [nvarchar](100) NULL,
	[req_Sexo] [char](10) NULL,
	[req_Descripcion] [nvarchar](50) NOT NULL,
	[req_Estado] [bit] NOT NULL,
	[req_RazonInactivo] [nvarchar](100) NULL,
	[req_Vacantes] [nvarchar](50) NOT NULL,
	[req_FechaRequisicion] [datetime] NULL,
	[req_FechaContratacion] [datetime] NULL,
	[req_UsuarioCrea] [int] NOT NULL,
	[req_FechaCrea] [datetime] NOT NULL,
	[req_UsuarioModifica] [int] NULL,
	[req_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_tbRequisiciones_req_Id] PRIMARY KEY CLUSTERED 
(
	[req_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [rrhh].[tbSeleccionCandidatos]    Script Date: 19/11/2019 8:12:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rrhh].[tbSeleccionCandidatos](
	[scan_Id] [int] NOT NULL,
	[per_Id] [int] NOT NULL,
	[fare_Id] [int] NOT NULL,
	[scan_Fecha] [datetime] NULL,
	[rper_Id] [int] NOT NULL,
	[scan_Estado] [bit] NOT NULL,
	[scan_RazonInactivo] [nvarchar](100) NULL,
	[scan_UsuarioCrea] [int] NOT NULL,
	[scan_FechaCrea] [datetime] NOT NULL,
	[scan_UsuarioModifica] [int] NULL,
	[scan_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_tbSeleccionCandidatos_scan_Id] PRIMARY KEY CLUSTERED 
(
	[scan_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [rrhh].[tbSucursales]    Script Date: 19/11/2019 8:12:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rrhh].[tbSucursales](
	[suc_Id] [int] NOT NULL,
	[empr_Id] [int] NOT NULL,
	[mun_Codigo] [char](4) NOT NULL,
	[bod_Id] [int] NOT NULL,
	[pemi_Id] [int] NOT NULL,
	[suc_Descripcion] [nvarchar](50) NOT NULL,
	[suc_Correo] [nvarchar](50) NOT NULL,
	[suc_Direccion] [nvarchar](100) NOT NULL,
	[suc_Telefono] [nvarchar](9) NOT NULL,
	[suc_Estado] [bit] NOT NULL,
	[suc_RazonInactivo] [nvarchar](100) NULL,
	[suc_UsuarioCrea] [int] NOT NULL,
	[suc_FechaCrea] [datetime] NOT NULL,
	[suc_UsuarioModifica] [int] NULL,
	[suc_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_tbSucursales_suc_Id] PRIMARY KEY CLUSTERED 
(
	[suc_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [rrhh].[tbTipoAmonestaciones]    Script Date: 19/11/2019 8:12:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rrhh].[tbTipoAmonestaciones](
	[tamo_Id] [int] NOT NULL,
	[tamo_Descripcion] [nvarchar](50) NOT NULL,
	[tamo_Estado] [bit] NOT NULL,
	[tamo_RazonInactivo] [nvarchar](100) NULL,
	[tamo_UsuarioCrea] [int] NOT NULL,
	[tamo_FechaCrea] [datetime] NOT NULL,
	[tamo_UsuarioModifica] [int] NULL,
	[tamo_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_tbTipoAmonestaciones_tamo_Id] PRIMARY KEY CLUSTERED 
(
	[tamo_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [rrhh].[tbTipoHoras]    Script Date: 19/11/2019 8:12:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rrhh].[tbTipoHoras](
	[tiho_Id] [int] NOT NULL,
	[tiho_Descripcion] [nvarchar](25) NOT NULL,
	[tiho_Recargo] [int] NOT NULL,
	[tiho_Estado] [bit] NOT NULL,
	[tiho_RazonInactivo] [nvarchar](100) NULL,
	[tiho_UsuarioCrea] [int] NOT NULL,
	[tiho_FechaCrea] [datetime] NOT NULL,
	[tiho_UsuarioModifica] [int] NULL,
	[tiho_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_tbTipoHoras_tiho_Id] PRIMARY KEY CLUSTERED 
(
	[tiho_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [rrhh].[tbTipoIncapacidades]    Script Date: 19/11/2019 8:12:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rrhh].[tbTipoIncapacidades](
	[ticn_Id] [int] NOT NULL,
	[ticn_Descripcion] [nvarchar](25) NOT NULL,
	[ticn_Estado] [bit] NOT NULL,
	[ticn_RazonInactivo] [nvarchar](100) NULL,
	[ticn_UsuarioCrea] [int] NOT NULL,
	[ticn_FechaCrea] [datetime] NOT NULL,
	[ticn_UsuarioModifica] [int] NULL,
	[ticn_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_tbTipoIncapacidades_ticn_Id] PRIMARY KEY CLUSTERED 
(
	[ticn_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [rrhh].[tbTipoPermisos]    Script Date: 19/11/2019 8:12:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rrhh].[tbTipoPermisos](
	[tper_Id] [int] NOT NULL,
	[tper_Descripcion] [nvarchar](25) NOT NULL,
	[tper_Estado] [bit] NOT NULL,
	[tper_RazonInactivo] [nvarchar](100) NULL,
	[tper_UsuarioCrea] [int] NOT NULL,
	[tper_FechaCrea] [datetime] NOT NULL,
	[tper_UsuarioModifica] [int] NULL,
	[tper_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_tbTipoPermisos_tper_Id] PRIMARY KEY CLUSTERED 
(
	[tper_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [rrhh].[tbTipoSalidas]    Script Date: 19/11/2019 8:12:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rrhh].[tbTipoSalidas](
	[tsal_Id] [int] NOT NULL,
	[tsal_Descripcion] [nvarchar](50) NULL,
	[tsal_Estado] [bit] NOT NULL,
	[tsal_RazonInactivo] [nvarchar](100) NULL,
	[tsal_UsuarioCrea] [int] NOT NULL,
	[tsal_FechaCrea] [datetime] NOT NULL,
	[tsal_UsuarioModifica] [int] NULL,
	[tsal_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_tbTipoSalidas_tsal_Id] PRIMARY KEY CLUSTERED 
(
	[tsal_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [rrhh].[tbTitulos]    Script Date: 19/11/2019 8:12:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rrhh].[tbTitulos](
	[titu_Id] [int] NOT NULL,
	[titu_Descripcion] [nvarchar](100) NOT NULL,
	[titu_Estado] [bit] NOT NULL,
	[titu_RazonInactivo] [nvarchar](100) NULL,
	[titu_UsuarioCrea] [int] NOT NULL,
	[titu_FechaCrea] [datetime] NOT NULL,
	[titu_UsuarioModifica] [int] NULL,
	[titu_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_tbTitulos_titu_Id] PRIMARY KEY CLUSTERED 
(
	[titu_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [rrhh].[tbTitulosPersona]    Script Date: 19/11/2019 8:12:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rrhh].[tbTitulosPersona](
	[tipe_Id] [int] NOT NULL,
	[per_Id] [int] NOT NULL,
	[titu_Id] [int] NOT NULL,
	[tipe_Estado] [bit] NOT NULL,
	[tipe_RazonInactivo] [nvarchar](100) NULL,
	[tipe_UsuarioCrea] [int] NOT NULL,
	[tipe_FechaCrea] [datetime] NULL,
	[tipe_UsuarioModifica] [int] NULL,
	[tipe_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_tbTitulosPersona_tipe_Id] PRIMARY KEY CLUSTERED 
(
	[tipe_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [rrhh].[tbTitulosRequisicion]    Script Date: 19/11/2019 8:12:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rrhh].[tbTitulosRequisicion](
	[treq_Id] [int] NOT NULL,
	[req_Id] [int] NOT NULL,
	[titu_Id] [int] NOT NULL,
	[treq_Estado] [bit] NOT NULL,
	[treq_RazonInactivo] [nvarchar](100) NULL,
	[treq_UsuarioCrea] [int] NOT NULL,
	[treq_FechaCrea] [datetime] NOT NULL,
	[treq_UsuarioModifica] [int] NULL,
	[treq_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_tbTitulosRequisicion_treq_Id] PRIMARY KEY CLUSTERED 
(
	[treq_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [rrhh].[tbVacaciones]    Script Date: 19/11/2019 8:12:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rrhh].[tbVacaciones](
	[vaca_Id] [int] NOT NULL,
	[emp_Id] [int] NOT NULL,
	[vaca_Dias] [int] NULL,
	[vaca_Estado] [bit] NOT NULL,
	[vaca_RazonInactivo] [nvarchar](100) NULL,
	[vaca_UsuarioCrea] [int] NOT NULL,
	[vaca_FechaCrea] [datetime] NOT NULL,
	[vaca_UsuarioModifica] [int] NULL,
	[vaca_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_tbVacaciones_vaca_Id] PRIMARY KEY CLUSTERED 
(
	[vaca_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [Acce].[tbRol] ([rol_Id], [rol_Descripcion], [rol_UsuarioCrea], [rol_FechaCrea], [rol_UsuarioModifica], [rol_FechaModifica], [rol_Estado]) VALUES (1, N'RolGenerico', 0, CAST(N'2019-11-15T02:52:15.330' AS DateTime), 0, NULL, 0)
INSERT [Acce].[tbUsuario] ([usu_Id], [usu_NombreUsuario], [usu_Password], [usu_Nombres], [usu_Apellidos], [usu_Correos], [usu_EsActivo], [usu_RazonInactivo], [usu_EsAdministrador], [usu_SesionesValidas]) VALUES (0, N'PRUEBA', 0x0001AFAE, N'PRUEBA', N'PRUEBA', N'PRUEBA', 1, NULL, 0, 1)
INSERT [Acce].[tbUsuario] ([usu_Id], [usu_NombreUsuario], [usu_Password], [usu_Nombres], [usu_Apellidos], [usu_Correos], [usu_EsActivo], [usu_RazonInactivo], [usu_EsAdministrador], [usu_SesionesValidas]) VALUES (1, N'PRUEBA', 0x0001AFAE, N'PRUEBA', N'PRUEBA', N'PRUEBA', 1, NULL, 0, 1)
INSERT [Acce].[tbUsuario] ([usu_Id], [usu_NombreUsuario], [usu_Password], [usu_Nombres], [usu_Apellidos], [usu_Correos], [usu_EsActivo], [usu_RazonInactivo], [usu_EsAdministrador], [usu_SesionesValidas]) VALUES (2, N'PRUEBA', 0x0001AFAE, N'PRUEBA', N'PRUEBA', N'PRUEBA', 1, NULL, 0, 1)
INSERT [Acce].[tbUsuario] ([usu_Id], [usu_NombreUsuario], [usu_Password], [usu_Nombres], [usu_Apellidos], [usu_Correos], [usu_EsActivo], [usu_RazonInactivo], [usu_EsAdministrador], [usu_SesionesValidas]) VALUES (3, N'PRUEBA', 0x0001AFAE, N'PRUEBA', N'PRUEBA', N'PRUEBA', 1, NULL, 0, 1)
INSERT [Acce].[tbUsuario] ([usu_Id], [usu_NombreUsuario], [usu_Password], [usu_Nombres], [usu_Apellidos], [usu_Correos], [usu_EsActivo], [usu_RazonInactivo], [usu_EsAdministrador], [usu_SesionesValidas]) VALUES (7, N'Usuario0', 0x0000E241, N'User', N'apellidos', N'correo@gmail.prueba', 1, N'', 0, 1)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (1, N'RAP23', 2, CAST(25.00 AS Decimal(16, 2)), CAST(36.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-11T12:26:41.783' AS DateTime), 1, CAST(N'2019-11-11T12:26:41.783' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (4, N'Cooperativa Elga', 3, CAST(2.55 AS Decimal(16, 2)), CAST(6.20 AS Decimal(16, 2)), 1, CAST(N'2019-11-11T11:35:12.523' AS DateTime), 1, CAST(N'2019-11-11T11:35:12.523' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (5, N'Cooperativa Arsenault', 3, CAST(5.55 AS Decimal(16, 2)), CAST(2.33 AS Decimal(16, 2)), 1, CAST(N'2019-11-11T12:58:25.350' AS DateTime), 1, CAST(N'2019-11-11T12:58:25.350' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (6, N'Cooperativa Taulabé', 1, CAST(4.60 AS Decimal(16, 2)), CAST(1.33 AS Decimal(16, 2)), 1, CAST(N'2019-11-09T15:23:37.470' AS DateTime), 1, CAST(N'2019-11-09T15:23:37.470' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (7, N'IHSS', 1, CAST(3.50 AS Decimal(16, 2)), CAST(2.50 AS Decimal(16, 2)), 1, CAST(N'2019-11-08T22:09:44.780' AS DateTime), 1, CAST(N'2019-11-08T22:09:44.780' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (8, N'Cooperativa Sagrada Familia', 1, CAST(2.22 AS Decimal(16, 2)), CAST(1.33 AS Decimal(16, 2)), 1, CAST(N'2019-11-11T21:37:01.510' AS DateTime), 1, CAST(N'2019-11-11T21:37:01.510' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (9, N'prueba12', 9, CAST(1.00 AS Decimal(16, 2)), CAST(2.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-08T22:52:34.603' AS DateTime), 1, CAST(N'2019-11-14T11:11:11.393' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (10, N'prueba02', 1, CAST(1.00 AS Decimal(16, 2)), CAST(2.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-09T09:45:53.190' AS DateTime), 1, CAST(N'2019-11-09T09:45:53.190' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (11, N'prueba03', 4, CAST(1.00 AS Decimal(16, 2)), CAST(2.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-11T13:05:51.457' AS DateTime), 1, CAST(N'2019-11-11T13:05:51.457' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (12, N'prueba2', 11, CAST(1.00 AS Decimal(16, 2)), CAST(2.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-08T22:52:59.307' AS DateTime), 1, CAST(N'2019-11-15T08:34:55.090' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (13, N'prueba05', 1, CAST(2.00 AS Decimal(16, 2)), CAST(1.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-08T23:58:10.620' AS DateTime), 1, CAST(N'2019-11-08T23:58:10.620' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (14, N'Prueba4 e', 1, CAST(1.60 AS Decimal(16, 2)), CAST(8.30 AS Decimal(16, 2)), 1, CAST(N'2019-11-08T23:39:24.727' AS DateTime), 1, CAST(N'2019-11-14T15:16:26.247' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (15, N'pr', 1, CAST(2.10 AS Decimal(16, 2)), CAST(3.50 AS Decimal(16, 2)), 1, CAST(N'2019-11-08T23:55:00.823' AS DateTime), 1, CAST(N'2019-11-08T23:55:00.823' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (16, N'_', 2, CAST(1.00 AS Decimal(16, 2)), CAST(5.33 AS Decimal(16, 2)), 1, CAST(N'2019-11-08T23:59:03.763' AS DateTime), 1, CAST(N'2019-11-13T12:57:57.533' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (17, N'ok', 1, CAST(12.00 AS Decimal(16, 2)), CAST(5.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-09T00:26:43.267' AS DateTime), 1, CAST(N'2019-11-09T00:26:43.267' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (18, N'Prueba Sabado', 1, CAST(1.33 AS Decimal(16, 2)), CAST(2.22 AS Decimal(16, 2)), 1, CAST(N'2019-11-09T09:47:07.057' AS DateTime), 1, CAST(N'2019-11-09T09:47:07.057' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (19, N'Prueba Sabado2', 1, CAST(2.33 AS Decimal(16, 2)), CAST(3.22 AS Decimal(16, 2)), 1, CAST(N'2019-11-09T09:46:49.760' AS DateTime), 1, CAST(N'2019-11-09T09:46:49.760' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (20, N'prueba3', 3, CAST(10.00 AS Decimal(16, 2)), CAST(25.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-09T10:11:50.627' AS DateTime), 1, CAST(N'2019-11-15T08:34:42.113' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (21, N'Nuevo 11:32 am 9 noviembre editado', 1, CAST(54.20 AS Decimal(16, 2)), CAST(82.50 AS Decimal(16, 2)), 1, CAST(N'2019-11-09T11:33:08.953' AS DateTime), 1, CAST(N'2019-11-09T11:33:08.953' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (22, N'Maciso', 1, CAST(3.22 AS Decimal(16, 2)), CAST(2.09 AS Decimal(16, 2)), 1, CAST(N'2019-11-09T11:44:57.157' AS DateTime), 1, CAST(N'2019-11-09T11:44:57.157' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (23, N'LaGrande', 1, CAST(666.00 AS Decimal(16, 2)), CAST(0.67 AS Decimal(16, 2)), 1, CAST(N'2019-11-10T17:33:57.347' AS DateTime), 1, CAST(N'2019-11-10T17:33:57.347' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (24, N'impuesto Vecinal', 1, CAST(5.00 AS Decimal(16, 2)), CAST(5.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-11T12:59:10.737' AS DateTime), 1, CAST(N'2019-11-11T12:59:10.737' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (25, N'Impuesto de Juan Orlando1', 4, CAST(15.00 AS Decimal(16, 2)), CAST(15.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-11T12:44:57.730' AS DateTime), 1, CAST(N'2019-11-11T12:44:57.730' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (26, N'9598', 2, CAST(26.36 AS Decimal(16, 2)), CAST(15.33 AS Decimal(16, 2)), 1, CAST(N'2019-11-11T11:35:03.533' AS DateTime), 1, CAST(N'2019-11-11T11:35:03.533' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (27, N'Instituciones financieras', 2, CAST(2.99 AS Decimal(16, 2)), CAST(4.33 AS Decimal(16, 2)), 1, CAST(N'2019-11-11T16:11:03.400' AS DateTime), 1, CAST(N'2019-11-11T16:11:03.400' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (28, N'Deduccion extraordinaria', 4, CAST(50.33 AS Decimal(16, 2)), CAST(40.33 AS Decimal(16, 2)), 1, CAST(N'2019-11-11T12:48:05.763' AS DateTime), 1, CAST(N'2019-11-11T12:48:05.763' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (29, N'648', 8, CAST(5.78 AS Decimal(16, 2)), CAST(8.98 AS Decimal(16, 2)), 1, CAST(N'2019-11-11T16:15:24.597' AS DateTime), 1, CAST(N'2019-11-11T16:15:24.597' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (30, N'PruebaUsuarioNumero', 4, CAST(6.30 AS Decimal(16, 2)), CAST(7.30 AS Decimal(16, 2)), 1, CAST(N'2019-11-11T13:51:18.923' AS DateTime), 1, CAST(N'2019-11-11T13:51:18.923' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (31, N'WWWWWWWWW', 2, CAST(8.65 AS Decimal(16, 2)), CAST(4.21 AS Decimal(16, 2)), 1, CAST(N'2019-11-11T14:07:55.673' AS DateTime), 1, CAST(N'2019-11-11T14:07:55.673' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (32, N'ww', 3, CAST(5.22 AS Decimal(16, 2)), CAST(8.45 AS Decimal(16, 2)), 1, CAST(N'2019-11-13T11:57:02.010' AS DateTime), 1, CAST(N'2019-11-13T11:57:32.353' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (33, N'EhyhO', 16, CAST(2.00 AS Decimal(16, 2)), CAST(4.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-13T15:43:45.420' AS DateTime), 1, CAST(N'2019-11-13T15:48:07.427' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (34, N'IHSS', 4, CAST(2.50 AS Decimal(16, 2)), CAST(1.10 AS Decimal(16, 2)), 1, CAST(N'2019-11-13T21:26:06.067' AS DateTime), 1, CAST(N'2019-11-15T09:16:42.910' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (35, N'Hola', 3, CAST(32.00 AS Decimal(16, 2)), CAST(34.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-14T11:06:16.327' AS DateTime), 1, CAST(N'2019-11-14T13:12:58.137' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (36, N'Borrame', 1, CAST(0.00 AS Decimal(16, 2)), CAST(0.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-14T11:58:51.573' AS DateTime), 1, CAST(N'2019-11-14T12:11:46.460' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (37, N'Borrame2', 4, CAST(0.00 AS Decimal(16, 2)), CAST(0.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-14T11:59:10.117' AS DateTime), 1, CAST(N'2019-11-14T12:11:43.037' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (38, N'sdf', 3, CAST(0.00 AS Decimal(16, 2)), CAST(0.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-14T12:11:24.123' AS DateTime), 1, CAST(N'2019-11-14T15:20:10.223' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (39, N'Nuevo', 9, CAST(15.21 AS Decimal(16, 2)), CAST(15.20 AS Decimal(16, 2)), 1, CAST(N'2019-11-14T13:13:18.390' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (40, N'NUEVO', 1, CAST(2.20 AS Decimal(16, 2)), CAST(23.40 AS Decimal(16, 2)), 1, CAST(N'2019-11-14T13:20:02.373' AS DateTime), 1, CAST(N'2019-11-15T08:35:54.210' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (41, N'LOL', 15, CAST(1.20 AS Decimal(16, 2)), CAST(14.20 AS Decimal(16, 2)), 1, CAST(N'2019-11-14T13:22:23.243' AS DateTime), 1, CAST(N'2019-11-18T08:26:54.847' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (42, N'LOLA', 19, CAST(25.30 AS Decimal(16, 2)), CAST(14.20 AS Decimal(16, 2)), 1, CAST(N'2019-11-14T13:23:59.917' AS DateTime), 1, CAST(N'2019-11-18T08:27:01.337' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (43, N'A ver y no al cine xd', 20, CAST(12.36 AS Decimal(16, 2)), CAST(50.30 AS Decimal(16, 2)), 1, CAST(N'2019-11-14T15:16:45.850' AS DateTime), 1, CAST(N'2019-11-14T15:33:47.173' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (44, N'PruebaLC', 1, CAST(0.00 AS Decimal(16, 2)), CAST(0.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-14T16:09:59.680' AS DateTime), 1, CAST(N'2019-11-15T08:31:54.463' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (45, N'Prueba5', 4, CAST(1.00 AS Decimal(16, 2)), CAST(1.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-14T21:29:37.350' AS DateTime), 1, CAST(N'2019-11-14T21:29:43.693' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (46, N'wer', 6, CAST(0.00 AS Decimal(16, 2)), CAST(0.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-15T07:54:37.283' AS DateTime), 1, CAST(N'2019-11-15T08:28:41.543' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (47, N'wer2', 2, CAST(0.00 AS Decimal(16, 2)), CAST(0.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-15T07:55:18.163' AS DateTime), 1, CAST(N'2019-11-15T08:27:53.537' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (48, N'wer', 1, CAST(0.00 AS Decimal(16, 2)), CAST(0.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-15T07:56:56.510' AS DateTime), 1, CAST(N'2019-11-15T08:03:00.590' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (49, N'yu', 2, CAST(0.00 AS Decimal(16, 2)), CAST(0.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-15T07:57:35.020' AS DateTime), 1, CAST(N'2019-11-15T08:02:42.143' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (50, N'gf', 1, CAST(0.00 AS Decimal(16, 2)), CAST(0.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-15T07:58:20.953' AS DateTime), 1, CAST(N'2019-11-15T08:02:57.073' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (51, N'hgj', 3, CAST(0.00 AS Decimal(16, 2)), CAST(0.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-15T07:58:36.987' AS DateTime), 1, CAST(N'2019-11-15T08:02:53.427' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (52, N'fdg', 1, CAST(0.00 AS Decimal(16, 2)), CAST(0.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-15T07:58:52.237' AS DateTime), 1, CAST(N'2019-11-15T08:02:50.240' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (53, N'fdg', 3, CAST(0.00 AS Decimal(16, 2)), CAST(0.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-15T07:59:30.067' AS DateTime), 1, CAST(N'2019-11-15T08:02:46.817' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (54, N'rsgfd', 5, CAST(0.00 AS Decimal(16, 2)), CAST(0.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-15T08:03:28.017' AS DateTime), 1, CAST(N'2019-11-15T08:30:13.817' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (55, N'jhg', 17, CAST(25.00 AS Decimal(16, 2)), CAST(2.30 AS Decimal(16, 2)), 1, CAST(N'2019-11-15T08:04:13.627' AS DateTime), 1, CAST(N'2019-11-18T08:27:08.113' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (56, N'dfdsdfgdgdfgdf', 2, CAST(0.00 AS Decimal(16, 2)), CAST(0.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-15T08:32:22.643' AS DateTime), 1, CAST(N'2019-11-15T08:32:42.423' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (57, N'Carlos', 4, CAST(34.00 AS Decimal(16, 2)), CAST(0.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-15T08:32:31.790' AS DateTime), 1, CAST(N'2019-11-15T08:36:10.090' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (58, N'Caarlos', 3, CAST(0.00 AS Decimal(16, 2)), CAST(0.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-15T08:34:02.387' AS DateTime), 1, CAST(N'2019-11-15T08:36:16.280' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (59, N'fg', 3, CAST(0.00 AS Decimal(16, 2)), CAST(0.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-15T08:35:31.877' AS DateTime), 1, CAST(N'2019-11-15T08:35:42.413' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (60, N'iiooy ya esta?', 1, CAST(12.00 AS Decimal(16, 2)), CAST(13.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-15T08:44:44.580' AS DateTime), 1, CAST(N'2019-11-18T15:54:18.763' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (61, N'Actu2?', 4, CAST(80.00 AS Decimal(16, 2)), CAST(80.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-15T08:44:56.950' AS DateTime), 1, CAST(N'2019-11-18T15:51:24.227' AS DateTime), 1)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (62, N'zz', 6, CAST(0.00 AS Decimal(16, 2)), CAST(0.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-15T08:46:14.713' AS DateTime), 1, CAST(N'2019-11-15T09:28:50.510' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (63, N'gfgh', 2, CAST(0.00 AS Decimal(16, 2)), CAST(0.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-15T08:46:38.447' AS DateTime), 1, CAST(N'2019-11-15T09:25:09.697' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (64, N'zzzzzz', 3, CAST(0.00 AS Decimal(16, 2)), CAST(0.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-15T08:46:44.850' AS DateTime), 1, CAST(N'2019-11-15T08:48:07.827' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (65, N'ffgb222', 2, CAST(0.00 AS Decimal(16, 2)), CAST(0.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-15T08:47:08.647' AS DateTime), 1, CAST(N'2019-11-15T09:28:42.367' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (66, N'z22', 4, CAST(0.00 AS Decimal(16, 2)), CAST(0.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-15T08:47:19.997' AS DateTime), 1, CAST(N'2019-11-15T08:48:17.280' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (67, N'z2', 3, CAST(0.00 AS Decimal(16, 2)), CAST(0.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-15T08:48:22.480' AS DateTime), 1, CAST(N'2019-11-15T08:51:44.177' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (68, N'ffdg', 3, CAST(0.00 AS Decimal(16, 2)), CAST(0.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-15T09:16:47.613' AS DateTime), 1, CAST(N'2019-11-15T09:25:04.070' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (69, N'dfgdf', 11, CAST(0.00 AS Decimal(16, 2)), CAST(0.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-15T09:25:17.867' AS DateTime), 1, CAST(N'2019-11-15T09:28:36.903' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (70, N'Actualizado?verificar', 2, CAST(15.00 AS Decimal(16, 2)), CAST(14.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-15T13:06:22.013' AS DateTime), 1, CAST(N'2019-11-19T07:30:19.640' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (71, N'Inactivarlp', 1, CAST(2.20 AS Decimal(16, 2)), CAST(12.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-15T13:17:14.550' AS DateTime), 1, CAST(N'2019-11-18T15:20:51.717' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (72, N'jupiiiiii?', 1, CAST(80.00 AS Decimal(16, 2)), CAST(89.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-15T15:33:18.523' AS DateTime), 1, CAST(N'2019-11-18T15:55:50.317' AS DateTime), 1)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (73, N'joy', 3, CAST(75.00 AS Decimal(16, 2)), CAST(75.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-15T15:53:55.283' AS DateTime), 1, CAST(N'2019-11-18T15:45:27.940' AS DateTime), 1)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (74, N'wqwqwe', 2, CAST(11.00 AS Decimal(16, 2)), CAST(12.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-15T15:56:22.083' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (75, N'Pribar', 2, CAST(1.00 AS Decimal(16, 2)), CAST(1.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-15T16:05:02.283' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (76, N'prueba', 9, CAST(80.00 AS Decimal(16, 2)), CAST(100.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-18T08:26:36.397' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (77, N'Hola', 1, CAST(5.00 AS Decimal(16, 2)), CAST(5.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-18T14:17:49.650' AS DateTime), 1, CAST(N'2019-11-18T15:34:41.483' AS DateTime), 1)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (78, N'prueva', 7, CAST(12.30 AS Decimal(16, 2)), CAST(12.30 AS Decimal(16, 2)), 1, CAST(N'2019-11-18T14:36:21.247' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (79, N'prueva2', 5, CAST(4.00 AS Decimal(16, 2)), CAST(4.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-18T14:38:58.977' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (80, N'prueva3', 6, CAST(4.00 AS Decimal(16, 2)), CAST(5.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-18T14:39:37.463' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (81, N'prueva3', 7, CAST(3.00 AS Decimal(16, 2)), CAST(3.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-18T14:39:59.477' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (82, N'prueva3', 2, CAST(3.00 AS Decimal(16, 2)), CAST(3.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-18T14:40:25.973' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (83, N'prueva4', 4, CAST(3.00 AS Decimal(16, 2)), CAST(3.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-18T14:41:02.677' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (84, N'prueva5', 8, CAST(6.00 AS Decimal(16, 2)), CAST(6.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-18T14:42:58.957' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (85, N'prueva5', 3, CAST(55.00 AS Decimal(16, 2)), CAST(6.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-18T14:43:23.030' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (86, N'Actu2?', 3, CAST(12.00 AS Decimal(16, 2)), CAST(12.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-18T15:56:50.357' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (87, N'Actu233', 12, CAST(45.00 AS Decimal(16, 2)), CAST(45.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-18T15:58:18.083' AS DateTime), 1, CAST(N'2019-11-18T16:28:29.207' AS DateTime), 1)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (88, N'Prueba', 1, CAST(1.00 AS Decimal(16, 2)), CAST(10.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-18T15:58:59.490' AS DateTime), 1, CAST(N'2019-11-18T15:59:22.077' AS DateTime), 1)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (89, N'sel', 5, CAST(12.00 AS Decimal(16, 2)), CAST(12.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-18T16:21:16.533' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (90, N'sel22222', 3, CAST(7.00 AS Decimal(16, 2)), CAST(78.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-18T16:28:13.103' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (91, N'sel22222', 9, CAST(34.00 AS Decimal(16, 2)), CAST(45.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-18T16:28:32.300' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones], [cde_DescripcionDeduccion], [tde_IdTipoDedu], [cde_PorcentajeColaborador], [cde_PorcentajeEmpresa], [cde_UsuarioCrea], [cde_FechaCrea], [cde_UsuarioModifica], [cde_FechaModifica], [cde_Activo]) VALUES (92, N'uuu', 3, CAST(33.00 AS Decimal(16, 2)), CAST(33.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-19T07:45:33.863' AS DateTime), 1, CAST(N'2019-11-19T07:45:48.623' AS DateTime), 1)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (1, N'Séptimo día', 1, CAST(N'2019-11-11T16:06:20.593' AS DateTime), 1, CAST(N'2019-11-11T16:06:20.593' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (2, N'ghfghiouiofgdf', 1, CAST(N'2019-11-08T00:00:00.000' AS DateTime), 1, CAST(N'2019-11-15T15:59:09.397' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (3, N'Bono Navidad', 1, CAST(N'2019-11-11T13:23:53.633' AS DateTime), 1, NULL, 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (4, N'Comisiones', 1, CAST(N'2019-11-08T00:00:00.000' AS DateTime), 1, CAST(N'2019-11-13T15:49:28.767' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (5, N'Bonos', 1, CAST(N'2019-11-11T00:00:00.000' AS DateTime), 1, CAST(N'2019-11-18T13:21:27.570' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (6, N'Hola', 1, CAST(N'2019-11-11T12:54:42.400' AS DateTime), 1, CAST(N'2019-11-13T15:51:02.407' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (7, N'Hola', 1, CAST(N'2019-11-11T12:54:43.047' AS DateTime), 1, CAST(N'2019-11-14T12:39:11.543' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (8, N'Hola2', 1, CAST(N'2019-11-11T12:54:42.853' AS DateTime), 1, CAST(N'2019-11-14T12:36:05.777' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (9, N'Ioo', 1, CAST(N'2019-11-11T12:59:22.620' AS DateTime), 1, CAST(N'2019-11-14T12:38:40.840' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (10, N'aasfdf', 1, CAST(N'2019-11-11T14:05:15.370' AS DateTime), 1, NULL, 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (11, N'sdasd', 1, CAST(N'2019-11-11T13:25:44.353' AS DateTime), 1, CAST(N'2019-11-14T12:40:01.150' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (12, N'Fabiola', 1, CAST(N'2019-11-11T15:23:39.587' AS DateTime), 1, CAST(N'2019-11-11T15:23:39.587' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (13, N'pipp', 1, CAST(N'2019-11-11T13:28:06.997' AS DateTime), 1, NULL, 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (14, N'Holae', 1, CAST(N'2019-11-11T14:57:16.830' AS DateTime), 1, CAST(N'2019-11-13T15:20:54.253' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (15, N'Prueba1.1', 1, CAST(N'2019-11-13T15:20:24.483' AS DateTime), 1, CAST(N'2019-11-14T12:39:55.927' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (16, N'Prueba2.2', 1, CAST(N'2019-11-14T08:04:08.140' AS DateTime), 1, CAST(N'2019-11-14T08:04:26.930' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (17, N'PruebaInactivar', 1, CAST(N'2019-11-14T08:06:16.130' AS DateTime), 1, CAST(N'2019-11-14T08:06:31.080' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (18, N'hgj', 1, CAST(N'2019-11-14T12:35:13.977' AS DateTime), 1, CAST(N'2019-11-18T15:11:47.620' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (19, N'Comisiones', 1, CAST(N'2019-11-14T12:42:39.327' AS DateTime), 1, CAST(N'2019-11-14T13:37:18.993' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (20, N'Gagaaaaa', 1, CAST(N'2019-11-14T12:45:22.793' AS DateTime), 1, CAST(N'2019-11-14T12:45:37.230' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (21, N'kkbhj', 1, CAST(N'2019-11-14T12:53:22.687' AS DateTime), 1, CAST(N'2019-11-14T12:54:24.407' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (22, N'jg', 1, CAST(N'2019-11-14T12:54:36.437' AS DateTime), 1, CAST(N'2019-11-14T12:59:58.397' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (23, N'fsdf', 1, CAST(N'2019-11-14T12:59:32.517' AS DateTime), 1, CAST(N'2019-11-14T13:00:10.747' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (24, N'df', 1, CAST(N'2019-11-14T13:22:00.473' AS DateTime), 1, CAST(N'2019-11-14T13:36:36.643' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (25, N'Comisiones', 1, CAST(N'2019-11-14T13:37:28.227' AS DateTime), 1, CAST(N'2019-11-15T12:51:21.597' AS DateTime), 1)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (26, N'Dias compensatorios', 1, CAST(N'2019-11-14T13:44:06.000' AS DateTime), 1, CAST(N'2019-11-15T00:12:37.583' AS DateTime), 1)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (27, N'sdasd', 1, CAST(N'2019-11-14T13:45:14.467' AS DateTime), 1, CAST(N'2019-11-15T00:12:12.470' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (28, N'dfsdf', 1, CAST(N'2019-11-14T13:46:03.017' AS DateTime), 1, CAST(N'2019-11-15T00:12:07.317' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (29, N'erwe', 1, CAST(N'2019-11-14T13:47:33.263' AS DateTime), 1, CAST(N'2019-11-15T00:12:02.587' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (30, N'dfsdf', 1, CAST(N'2019-11-14T13:52:01.033' AS DateTime), 1, CAST(N'2019-11-15T00:11:58.500' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (31, N'fdsdfsdfsdf', 1, CAST(N'2019-11-14T15:25:31.543' AS DateTime), 1, CAST(N'2019-11-15T00:11:55.477' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (32, N'saad', 1, CAST(N'2019-11-14T15:26:13.820' AS DateTime), 1, CAST(N'2019-11-15T00:11:42.187' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (33, N'csdfd', 1, CAST(N'2019-11-14T15:26:23.497' AS DateTime), 1, CAST(N'2019-11-14T16:10:55.420' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (34, N'sdsd', 1, CAST(N'2019-11-14T15:27:22.400' AS DateTime), 1, CAST(N'2019-11-14T16:10:26.717' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (35, N'dfsdfsd', 1, CAST(N'2019-11-14T15:27:59.063' AS DateTime), 1, CAST(N'2019-11-14T16:10:12.130' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (36, N'fxdfsdf', 1, CAST(N'2019-11-14T15:30:16.760' AS DateTime), 1, CAST(N'2019-11-14T16:10:08.090' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (37, N'fgdfg', 1, CAST(N'2019-11-14T15:36:42.327' AS DateTime), 1, CAST(N'2019-11-14T16:09:56.890' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (38, N'asddsa', 1, CAST(N'2019-11-14T15:46:46.480' AS DateTime), 1, CAST(N'2019-11-14T16:10:03.933' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (39, N'dsdf', 1, CAST(N'2019-11-14T16:04:12.037' AS DateTime), 1, CAST(N'2019-11-14T16:09:53.200' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (40, N'Prueba1:43AM', 1, CAST(N'2019-11-15T01:43:44.230' AS DateTime), 1, CAST(N'2019-11-15T01:44:00.207' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (41, N'Hallowens', 1, CAST(N'2019-11-15T12:50:10.247' AS DateTime), 1, CAST(N'2019-11-15T12:51:14.943' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (42, N'57645656jhkhjk', 1, CAST(N'2019-11-15T12:51:33.277' AS DateTime), 1, CAST(N'2019-11-15T12:51:56.613' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (43, N'ffgfgdfgdf', 1, CAST(N'2019-11-15T12:55:16.260' AS DateTime), 1, CAST(N'2019-11-15T12:55:26.213' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (44, N'gfhfgh', 1, CAST(N'2019-11-15T15:35:57.373' AS DateTime), 1, CAST(N'2019-11-18T12:26:26.373' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (45, N'iououo', 1, CAST(N'2019-11-15T15:39:27.920' AS DateTime), 1, CAST(N'2019-11-18T12:26:22.237' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (46, N'd', 1, CAST(N'2019-11-15T15:43:49.507' AS DateTime), 1, CAST(N'2019-11-18T12:26:18.243' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (47, N'fdfs', 1, CAST(N'2019-11-15T15:47:22.963' AS DateTime), 1, CAST(N'2019-11-18T12:26:13.020' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (48, N'dsd', 1, CAST(N'2019-11-15T15:58:46.280' AS DateTime), 1, CAST(N'2019-11-18T12:26:08.173' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (49, N'848', 1, CAST(N'2019-11-18T12:25:39.907' AS DateTime), 1, CAST(N'2019-11-18T12:25:50.687' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (50, N'hkuhiu', 1, CAST(N'2019-11-18T13:48:37.420' AS DateTime), 1, CAST(N'2019-11-18T15:29:47.383' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (51, N'h fghfggf', 1, CAST(N'2019-11-18T13:49:26.073' AS DateTime), 1, CAST(N'2019-11-18T15:28:43.453' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (52, N'Bonificaciones.', 1, CAST(N'2019-11-18T15:33:21.600' AS DateTime), 1, CAST(N'2019-11-18T15:36:56.753' AS DateTime), 1)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (53, N'asasd', 1, CAST(N'2019-11-18T15:37:14.487' AS DateTime), 1, CAST(N'2019-11-18T15:39:05.910' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (54, N'sdad', 1, CAST(N'2019-11-18T15:37:20.520' AS DateTime), 1, CAST(N'2019-11-18T15:37:24.910' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (55, N'Séptimo Día', 1, CAST(N'2019-11-18T15:38:48.193' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (56, N'Aguinaldos', 1, CAST(N'2019-11-18T15:38:56.303' AS DateTime), 1, CAST(N'2019-11-18T15:45:19.247' AS DateTime), 1)
INSERT [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso], [cin_DescripcionIngreso], [cin_UsuarioCrea], [cin_FechaCrea], [cin_UsuarioModifica], [cin_FechaModifica], [cin_Activo]) VALUES (57, N'blablasd', 1, CAST(N'2019-11-18T15:44:29.417' AS DateTime), 1, CAST(N'2019-11-18T15:45:12.903' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDePlanillas] ([cpla_IdPlanilla], [cpla_DescripcionPlanilla], [cpla_FrecuenciaEnDias], [cpla_UsuarioCrea], [cpla_FechaCrea], [cpla_UsuarioModifica], [cpla_FechaModifica], [cpla_Activo]) VALUES (1, N'OutSourcing', 15, 1, CAST(N'2019-11-08T00:00:00.000' AS DateTime), 1, CAST(N'2019-11-17T01:24:37.693' AS DateTime), 1)
INSERT [Plani].[tbCatalogoDePlanillas] ([cpla_IdPlanilla], [cpla_DescripcionPlanilla], [cpla_FrecuenciaEnDias], [cpla_UsuarioCrea], [cpla_FechaCrea], [cpla_UsuarioModifica], [cpla_FechaModifica], [cpla_Activo]) VALUES (2, N'Vendedores!!', 14, 1, CAST(N'2019-11-09T00:00:00.000' AS DateTime), 1, CAST(N'2019-11-15T02:20:11.910' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDePlanillas] ([cpla_IdPlanilla], [cpla_DescripcionPlanilla], [cpla_FrecuenciaEnDias], [cpla_UsuarioCrea], [cpla_FechaCrea], [cpla_UsuarioModifica], [cpla_FechaModifica], [cpla_Activo]) VALUES (3, N'Hackers', 15, 1, CAST(N'2019-11-11T21:26:20.480' AS DateTime), NULL, NULL, 0)
INSERT [Plani].[tbCatalogoDePlanillas] ([cpla_IdPlanilla], [cpla_DescripcionPlanilla], [cpla_FrecuenciaEnDias], [cpla_UsuarioCrea], [cpla_FechaCrea], [cpla_UsuarioModifica], [cpla_FechaModifica], [cpla_Activo]) VALUES (4, N'Programadores', 30, 1, CAST(N'2019-11-11T21:32:53.703' AS DateTime), 1, CAST(N'2019-11-14T15:42:49.957' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDePlanillas] ([cpla_IdPlanilla], [cpla_DescripcionPlanilla], [cpla_FrecuenciaEnDias], [cpla_UsuarioCrea], [cpla_FechaCrea], [cpla_UsuarioModifica], [cpla_FechaModifica], [cpla_Activo]) VALUES (5, N'Programadores 2', 30, 1, CAST(N'2019-11-11T21:35:31.030' AS DateTime), NULL, NULL, 0)
INSERT [Plani].[tbCatalogoDePlanillas] ([cpla_IdPlanilla], [cpla_DescripcionPlanilla], [cpla_FrecuenciaEnDias], [cpla_UsuarioCrea], [cpla_FechaCrea], [cpla_UsuarioModifica], [cpla_FechaModifica], [cpla_Activo]) VALUES (6, N'Programadores 3', 30, 1, CAST(N'2019-11-11T21:38:20.930' AS DateTime), NULL, NULL, 0)
INSERT [Plani].[tbCatalogoDePlanillas] ([cpla_IdPlanilla], [cpla_DescripcionPlanilla], [cpla_FrecuenciaEnDias], [cpla_UsuarioCrea], [cpla_FechaCrea], [cpla_UsuarioModifica], [cpla_FechaModifica], [cpla_Activo]) VALUES (7, N'Programadores 4', 30, 1, CAST(N'2019-11-11T21:39:57.140' AS DateTime), NULL, NULL, 0)
INSERT [Plani].[tbCatalogoDePlanillas] ([cpla_IdPlanilla], [cpla_DescripcionPlanilla], [cpla_FrecuenciaEnDias], [cpla_UsuarioCrea], [cpla_FechaCrea], [cpla_UsuarioModifica], [cpla_FechaModifica], [cpla_Activo]) VALUES (8, N'Programadores 5', 30, 1, CAST(N'2019-11-11T21:40:26.483' AS DateTime), NULL, NULL, 0)
INSERT [Plani].[tbCatalogoDePlanillas] ([cpla_IdPlanilla], [cpla_DescripcionPlanilla], [cpla_FrecuenciaEnDias], [cpla_UsuarioCrea], [cpla_FechaCrea], [cpla_UsuarioModifica], [cpla_FechaModifica], [cpla_Activo]) VALUES (9, N'CEO', 365, 1, CAST(N'2019-11-11T21:48:03.017' AS DateTime), NULL, NULL, 0)
INSERT [Plani].[tbCatalogoDePlanillas] ([cpla_IdPlanilla], [cpla_DescripcionPlanilla], [cpla_FrecuenciaEnDias], [cpla_UsuarioCrea], [cpla_FechaCrea], [cpla_UsuarioModifica], [cpla_FechaModifica], [cpla_Activo]) VALUES (10, N'CEO 1', 491, 1, CAST(N'2019-11-11T22:01:02.047' AS DateTime), NULL, NULL, 0)
INSERT [Plani].[tbCatalogoDePlanillas] ([cpla_IdPlanilla], [cpla_DescripcionPlanilla], [cpla_FrecuenciaEnDias], [cpla_UsuarioCrea], [cpla_FechaCrea], [cpla_UsuarioModifica], [cpla_FechaModifica], [cpla_Activo]) VALUES (11, N'Contabilidad', 30, 1, CAST(N'2019-11-11T22:49:23.133' AS DateTime), NULL, NULL, 0)
INSERT [Plani].[tbCatalogoDePlanillas] ([cpla_IdPlanilla], [cpla_DescripcionPlanilla], [cpla_FrecuenciaEnDias], [cpla_UsuarioCrea], [cpla_FechaCrea], [cpla_UsuarioModifica], [cpla_FechaModifica], [cpla_Activo]) VALUES (12, N'Contabilidad 2', 30, 1, CAST(N'2019-11-11T23:58:11.340' AS DateTime), NULL, NULL, 0)
INSERT [Plani].[tbCatalogoDePlanillas] ([cpla_IdPlanilla], [cpla_DescripcionPlanilla], [cpla_FrecuenciaEnDias], [cpla_UsuarioCrea], [cpla_FechaCrea], [cpla_UsuarioModifica], [cpla_FechaModifica], [cpla_Activo]) VALUES (13, N'Nueva Planilla para Programadores', 30, 1, CAST(N'2019-11-13T23:19:04.383' AS DateTime), 1, CAST(N'2019-11-13T23:19:51.900' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDePlanillas] ([cpla_IdPlanilla], [cpla_DescripcionPlanilla], [cpla_FrecuenciaEnDias], [cpla_UsuarioCrea], [cpla_FechaCrea], [cpla_UsuarioModifica], [cpla_FechaModifica], [cpla_Activo]) VALUES (14, N'Nueva planilla para hackers editada', 61, 1, CAST(N'2019-11-13T23:20:53.627' AS DateTime), 1, CAST(N'2019-11-13T23:21:56.260' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDePlanillas] ([cpla_IdPlanilla], [cpla_DescripcionPlanilla], [cpla_FrecuenciaEnDias], [cpla_UsuarioCrea], [cpla_FechaCrea], [cpla_UsuarioModifica], [cpla_FechaModifica], [cpla_Activo]) VALUES (15, N'Gerentes e', 70, 1, CAST(N'2019-11-13T23:32:57.663' AS DateTime), 1, CAST(N'2019-11-13T23:33:31.577' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDePlanillas] ([cpla_IdPlanilla], [cpla_DescripcionPlanilla], [cpla_FrecuenciaEnDias], [cpla_UsuarioCrea], [cpla_FechaCrea], [cpla_UsuarioModifica], [cpla_FechaModifica], [cpla_Activo]) VALUES (16, N'Planilla para programadores junior ediit', 60, 1, CAST(N'2019-11-14T13:03:50.717' AS DateTime), 1, CAST(N'2019-11-15T01:50:45.467' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDePlanillas] ([cpla_IdPlanilla], [cpla_DescripcionPlanilla], [cpla_FrecuenciaEnDias], [cpla_UsuarioCrea], [cpla_FechaCrea], [cpla_UsuarioModifica], [cpla_FechaModifica], [cpla_Activo]) VALUES (17, N'planilla viernes 2am edit', 60, 1, CAST(N'2019-11-15T01:53:12.373' AS DateTime), 1, CAST(N'2019-11-16T20:17:06.173' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDePlanillas] ([cpla_IdPlanilla], [cpla_DescripcionPlanilla], [cpla_FrecuenciaEnDias], [cpla_UsuarioCrea], [cpla_FechaCrea], [cpla_UsuarioModifica], [cpla_FechaModifica], [cpla_Activo]) VALUES (18, N'Planilla para mujeres edit', 90, 1, CAST(N'2019-11-15T12:33:35.230' AS DateTime), 1, CAST(N'2019-11-16T20:12:31.610' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDePlanillas] ([cpla_IdPlanilla], [cpla_DescripcionPlanilla], [cpla_FrecuenciaEnDias], [cpla_UsuarioCrea], [cpla_FechaCrea], [cpla_UsuarioModifica], [cpla_FechaModifica], [cpla_Activo]) VALUES (19, N'planilla 1:13pm', 30, 1, CAST(N'2019-11-15T13:14:22.253' AS DateTime), NULL, NULL, 0)
INSERT [Plani].[tbCatalogoDePlanillas] ([cpla_IdPlanilla], [cpla_DescripcionPlanilla], [cpla_FrecuenciaEnDias], [cpla_UsuarioCrea], [cpla_FechaCrea], [cpla_UsuarioModifica], [cpla_FechaModifica], [cpla_Activo]) VALUES (20, N'3:27 plani', 30, 1, CAST(N'2019-11-15T15:28:03.467' AS DateTime), NULL, NULL, 0)
INSERT [Plani].[tbCatalogoDePlanillas] ([cpla_IdPlanilla], [cpla_DescripcionPlanilla], [cpla_FrecuenciaEnDias], [cpla_UsuarioCrea], [cpla_FechaCrea], [cpla_UsuarioModifica], [cpla_FechaModifica], [cpla_Activo]) VALUES (21, N'720 viernes editado', 60, 1, CAST(N'2019-11-15T19:21:57.470' AS DateTime), 1, CAST(N'2019-11-15T19:23:33.270' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDePlanillas] ([cpla_IdPlanilla], [cpla_DescripcionPlanilla], [cpla_FrecuenciaEnDias], [cpla_UsuarioCrea], [cpla_FechaCrea], [cpla_UsuarioModifica], [cpla_FechaModifica], [cpla_Activo]) VALUES (22, N'Vendedores', 30, 1, CAST(N'2019-11-16T20:30:28.520' AS DateTime), 1, CAST(N'2019-11-16T20:31:11.647' AS DateTime), 1)
INSERT [Plani].[tbCatalogoDePlanillas] ([cpla_IdPlanilla], [cpla_DescripcionPlanilla], [cpla_FrecuenciaEnDias], [cpla_UsuarioCrea], [cpla_FechaCrea], [cpla_UsuarioModifica], [cpla_FechaModifica], [cpla_Activo]) VALUES (23, N'Planilla prueba 1', 30, 1, CAST(N'2019-11-16T21:36:47.973' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbCatalogoDePlanillas] ([cpla_IdPlanilla], [cpla_DescripcionPlanilla], [cpla_FrecuenciaEnDias], [cpla_UsuarioCrea], [cpla_FechaCrea], [cpla_UsuarioModifica], [cpla_FechaModifica], [cpla_Activo]) VALUES (24, N'Planilla prueba 2', 30, 1, CAST(N'2019-11-16T21:37:31.283' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbCatalogoDePlanillas] ([cpla_IdPlanilla], [cpla_DescripcionPlanilla], [cpla_FrecuenciaEnDias], [cpla_UsuarioCrea], [cpla_FechaCrea], [cpla_UsuarioModifica], [cpla_FechaModifica], [cpla_Activo]) VALUES (25, N'Planilla prueba 3 e', 25, 1, CAST(N'2019-11-16T21:38:15.347' AS DateTime), 1, CAST(N'2019-11-17T00:23:53.993' AS DateTime), 1)
INSERT [Plani].[tbCatalogoDePlanillas] ([cpla_IdPlanilla], [cpla_DescripcionPlanilla], [cpla_FrecuenciaEnDias], [cpla_UsuarioCrea], [cpla_FechaCrea], [cpla_UsuarioModifica], [cpla_FechaModifica], [cpla_Activo]) VALUES (26, N'Planilla prueba 4', 14, 1, CAST(N'2019-11-16T23:55:39.340' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbCatalogoDePlanillas] ([cpla_IdPlanilla], [cpla_DescripcionPlanilla], [cpla_FrecuenciaEnDias], [cpla_UsuarioCrea], [cpla_FechaCrea], [cpla_UsuarioModifica], [cpla_FechaModifica], [cpla_Activo]) VALUES (27, N'Prueba planilla 4', 30, 1, CAST(N'2019-11-17T00:27:34.470' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbCatalogoDePlanillas] ([cpla_IdPlanilla], [cpla_DescripcionPlanilla], [cpla_FrecuenciaEnDias], [cpla_UsuarioCrea], [cpla_FechaCrea], [cpla_UsuarioModifica], [cpla_FechaModifica], [cpla_Activo]) VALUES (28, N'Prueba planilla 5 ed', 10, 1, CAST(N'2019-11-17T00:28:53.903' AS DateTime), 1, CAST(N'2019-11-17T01:37:17.413' AS DateTime), 1)
INSERT [Plani].[tbCatalogoDePlanillas] ([cpla_IdPlanilla], [cpla_DescripcionPlanilla], [cpla_FrecuenciaEnDias], [cpla_UsuarioCrea], [cpla_FechaCrea], [cpla_UsuarioModifica], [cpla_FechaModifica], [cpla_Activo]) VALUES (29, N'Planilla 6', 40, 1, CAST(N'2019-11-17T00:31:55.373' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbCatalogoDePlanillas] ([cpla_IdPlanilla], [cpla_DescripcionPlanilla], [cpla_FrecuenciaEnDias], [cpla_UsuarioCrea], [cpla_FechaCrea], [cpla_UsuarioModifica], [cpla_FechaModifica], [cpla_Activo]) VALUES (30, N'Planilla 6', 40, 1, CAST(N'2019-11-17T00:32:08.550' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbCatalogoDePlanillas] ([cpla_IdPlanilla], [cpla_DescripcionPlanilla], [cpla_FrecuenciaEnDias], [cpla_UsuarioCrea], [cpla_FechaCrea], [cpla_UsuarioModifica], [cpla_FechaModifica], [cpla_Activo]) VALUES (31, N'Prueba planilla 7', 30, 1, CAST(N'2019-11-17T00:33:52.470' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbCatalogoDePlanillas] ([cpla_IdPlanilla], [cpla_DescripcionPlanilla], [cpla_FrecuenciaEnDias], [cpla_UsuarioCrea], [cpla_FechaCrea], [cpla_UsuarioModifica], [cpla_FechaModifica], [cpla_Activo]) VALUES (32, N'Prueba planilla 8', 30, 1, CAST(N'2019-11-17T00:35:19.100' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbCatalogoDePlanillas] ([cpla_IdPlanilla], [cpla_DescripcionPlanilla], [cpla_FrecuenciaEnDias], [cpla_UsuarioCrea], [cpla_FechaCrea], [cpla_UsuarioModifica], [cpla_FechaModifica], [cpla_Activo]) VALUES (33, N'Planilla prueba 9', 12, 1, CAST(N'2019-11-17T00:38:12.550' AS DateTime), 1, CAST(N'2019-11-18T14:32:23.923' AS DateTime), 1)
INSERT [Plani].[tbCatalogoDePlanillas] ([cpla_IdPlanilla], [cpla_DescripcionPlanilla], [cpla_FrecuenciaEnDias], [cpla_UsuarioCrea], [cpla_FechaCrea], [cpla_UsuarioModifica], [cpla_FechaModifica], [cpla_Activo]) VALUES (34, N'Planilla prueba 10', 12, 1, CAST(N'2019-11-17T00:38:51.353' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbCatalogoDePlanillas] ([cpla_IdPlanilla], [cpla_DescripcionPlanilla], [cpla_FrecuenciaEnDias], [cpla_UsuarioCrea], [cpla_FechaCrea], [cpla_UsuarioModifica], [cpla_FechaModifica], [cpla_Activo]) VALUES (35, N'Planilla prueba 11', 15, 1, CAST(N'2019-11-17T01:11:25.730' AS DateTime), NULL, NULL, 0)
INSERT [Plani].[tbCatalogoDePlanillas] ([cpla_IdPlanilla], [cpla_DescripcionPlanilla], [cpla_FrecuenciaEnDias], [cpla_UsuarioCrea], [cpla_FechaCrea], [cpla_UsuarioModifica], [cpla_FechaModifica], [cpla_Activo]) VALUES (36, N'planillaprueba 11 ed', 15, 1, CAST(N'2019-11-17T01:12:58.890' AS DateTime), 1, CAST(N'2019-11-18T21:05:14.883' AS DateTime), 1)
INSERT [Plani].[tbCatalogoDePlanillas] ([cpla_IdPlanilla], [cpla_DescripcionPlanilla], [cpla_FrecuenciaEnDias], [cpla_UsuarioCrea], [cpla_FechaCrea], [cpla_UsuarioModifica], [cpla_FechaModifica], [cpla_Activo]) VALUES (37, N'prueba planilla 12 e', 30, 1, CAST(N'2019-11-17T01:19:50.640' AS DateTime), 1, CAST(N'2019-11-18T21:03:34.637' AS DateTime), 1)
INSERT [Plani].[tbCatalogoDePlanillas] ([cpla_IdPlanilla], [cpla_DescripcionPlanilla], [cpla_FrecuenciaEnDias], [cpla_UsuarioCrea], [cpla_FechaCrea], [cpla_UsuarioModifica], [cpla_FechaModifica], [cpla_Activo]) VALUES (38, N'Prueba planilla 13 edit', 15, 1, CAST(N'2019-11-17T01:26:10.287' AS DateTime), 1, CAST(N'2019-11-18T21:01:39.463' AS DateTime), 1)
INSERT [Plani].[tbCatalogoDePlanillas] ([cpla_IdPlanilla], [cpla_DescripcionPlanilla], [cpla_FrecuenciaEnDias], [cpla_UsuarioCrea], [cpla_FechaCrea], [cpla_UsuarioModifica], [cpla_FechaModifica], [cpla_Activo]) VALUES (39, N'Prueba planilla 14', 30, 1, CAST(N'2019-11-17T01:29:38.093' AS DateTime), 1, CAST(N'2019-11-17T01:32:31.817' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDePlanillas] ([cpla_IdPlanilla], [cpla_DescripcionPlanilla], [cpla_FrecuenciaEnDias], [cpla_UsuarioCrea], [cpla_FechaCrea], [cpla_UsuarioModifica], [cpla_FechaModifica], [cpla_Activo]) VALUES (40, N'planilla 16', 34, 1, CAST(N'2019-11-17T01:37:44.163' AS DateTime), 1, CAST(N'2019-11-18T15:30:37.170' AS DateTime), 0)
INSERT [Plani].[tbCatalogoDePlanillas] ([cpla_IdPlanilla], [cpla_DescripcionPlanilla], [cpla_FrecuenciaEnDias], [cpla_UsuarioCrea], [cpla_FechaCrea], [cpla_UsuarioModifica], [cpla_FechaModifica], [cpla_Activo]) VALUES (41, N'Prueba Planilla 17 e', 60, 1, CAST(N'2019-11-18T12:40:00.730' AS DateTime), 1, CAST(N'2019-11-18T12:41:13.037' AS DateTime), 0)
INSERT [Plani].[tbDeduccionesExtraordinarias] ([dex_IdDeduccionesExtra], [eqem_Id], [dex_MontoInicial], [dex_MontoRestante], [dex_ObservacionesComentarios], [cde_IdDeducciones], [dex_Cuota], [dex_UsuarioCrea], [dex_FechaCrea], [dex_UsuarioModifica], [dex_FechaModifica], [dex_Activo]) VALUES (1, 1, CAST(500.00 AS Decimal(10, 2)), CAST(300.00 AS Decimal(10, 2)), N'Disco Duro Defectuoso', 28, CAST(50.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-15T13:45:04.913' AS DateTime), 1, CAST(N'2019-11-18T16:15:54.147' AS DateTime), 0)
INSERT [Plani].[tbDeduccionesExtraordinarias] ([dex_IdDeduccionesExtra], [eqem_Id], [dex_MontoInicial], [dex_MontoRestante], [dex_ObservacionesComentarios], [cde_IdDeducciones], [dex_Cuota], [dex_UsuarioCrea], [dex_FechaCrea], [dex_UsuarioModifica], [dex_FechaModifica], [dex_Activo]) VALUES (2, 2, CAST(300.00 AS Decimal(10, 2)), CAST(100.00 AS Decimal(10, 2)), N'Cable VGA Extraviado', 28, CAST(100.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-15T14:03:53.550' AS DateTime), 1, CAST(N'2019-11-18T15:46:18.237' AS DateTime), 1)
INSERT [Plani].[tbDeduccionesExtraordinarias] ([dex_IdDeduccionesExtra], [eqem_Id], [dex_MontoInicial], [dex_MontoRestante], [dex_ObservacionesComentarios], [cde_IdDeducciones], [dex_Cuota], [dex_UsuarioCrea], [dex_FechaCrea], [dex_UsuarioModifica], [dex_FechaModifica], [dex_Activo]) VALUES (3, 3, CAST(250.00 AS Decimal(10, 2)), CAST(100.00 AS Decimal(10, 2)), N'Mouse Defectuoso', 28, CAST(50.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-15T14:05:40.337' AS DateTime), 1, CAST(N'2019-11-18T16:06:18.943' AS DateTime), 0)
INSERT [Plani].[tbDeduccionesExtraordinarias] ([dex_IdDeduccionesExtra], [eqem_Id], [dex_MontoInicial], [dex_MontoRestante], [dex_ObservacionesComentarios], [cde_IdDeducciones], [dex_Cuota], [dex_UsuarioCrea], [dex_FechaCrea], [dex_UsuarioModifica], [dex_FechaModifica], [dex_Activo]) VALUES (4, 3, CAST(1000.00 AS Decimal(10, 2)), CAST(1000.00 AS Decimal(10, 2)), N'Monitor Defectuoso', 28, CAST(200.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-18T15:39:49.163' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbDeduccionesExtraordinarias] ([dex_IdDeduccionesExtra], [eqem_Id], [dex_MontoInicial], [dex_MontoRestante], [dex_ObservacionesComentarios], [cde_IdDeducciones], [dex_Cuota], [dex_UsuarioCrea], [dex_FechaCrea], [dex_UsuarioModifica], [dex_FechaModifica], [dex_Activo]) VALUES (5, 2, CAST(500.00 AS Decimal(10, 2)), CAST(500.00 AS Decimal(10, 2)), N'Cable HDMI Inservible', 28, CAST(100.00 AS Decimal(16, 2)), 1, CAST(N'2019-11-18T15:42:11.950' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbDeduccionInstitucionFinanciera] ([deif_IdDeduccionInstFinanciera], [emp_Id], [insf_IdInstitucionFinanciera], [deif_Monto], [deif_Comentarios], [cde_IdDeducciones], [deif_UsuarioCrea], [deif_FechaCrea], [deif_UsuarioModifica], [deif_FechaModifica], [deif_Activo], [deif_Pagado]) VALUES (1, 1, 1, CAST(500.00 AS Decimal(10, 2)), N'Couta prestamo', 27, 1, CAST(N'2019-11-11T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL)
INSERT [Plani].[tbEmpleadoBonos] ([cb_Id], [emp_Id], [cin_IdIngreso], [cb_Monto], [cb_FechaRegistro], [cb_Pagado], [cb_UsuarioCrea], [cb_FechaCrea], [cb_UsuarioModifica], [cb_FechaModifica], [cb_Activo]) VALUES (1, 1, 5, CAST(250.00 AS Decimal(10, 2)), CAST(N'2019-11-10T01:00:00.000' AS DateTime), 0, 1, CAST(N'2019-10-11T00:00:00.000' AS DateTime), 1, CAST(N'2019-11-12T10:52:17.690' AS DateTime), 0)
INSERT [Plani].[tbEmpleadoBonos] ([cb_Id], [emp_Id], [cin_IdIngreso], [cb_Monto], [cb_FechaRegistro], [cb_Pagado], [cb_UsuarioCrea], [cb_FechaCrea], [cb_UsuarioModifica], [cb_FechaModifica], [cb_Activo]) VALUES (2, 1, 12, CAST(850.00 AS Decimal(10, 2)), CAST(N'2019-11-11T00:00:00.000' AS DateTime), 0, 1, CAST(N'2019-11-10T15:05:23.817' AS DateTime), 1, CAST(N'2019-11-11T00:00:00.000' AS DateTime), 0)
INSERT [Plani].[tbEmpleadoBonos] ([cb_Id], [emp_Id], [cin_IdIngreso], [cb_Monto], [cb_FechaRegistro], [cb_Pagado], [cb_UsuarioCrea], [cb_FechaCrea], [cb_UsuarioModifica], [cb_FechaModifica], [cb_Activo]) VALUES (3, 2, 2, CAST(1051.00 AS Decimal(10, 2)), CAST(N'2019-12-11T10:47:00.000' AS DateTime), 0, 1, CAST(N'2019-11-12T10:47:11.680' AS DateTime), 1, CAST(N'2019-11-12T10:48:29.093' AS DateTime), 0)
INSERT [Plani].[tbEmpleadoBonos] ([cb_Id], [emp_Id], [cin_IdIngreso], [cb_Monto], [cb_FechaRegistro], [cb_Pagado], [cb_UsuarioCrea], [cb_FechaCrea], [cb_UsuarioModifica], [cb_FechaModifica], [cb_Activo]) VALUES (4, 2, 5, CAST(1209.00 AS Decimal(10, 2)), CAST(N'2019-10-13T02:00:00.000' AS DateTime), 0, 1, CAST(N'2019-11-13T15:23:24.513' AS DateTime), 1, CAST(N'2019-11-14T22:14:08.780' AS DateTime), 0)
INSERT [Plani].[tbEmpleadoBonos] ([cb_Id], [emp_Id], [cin_IdIngreso], [cb_Monto], [cb_FechaRegistro], [cb_Pagado], [cb_UsuarioCrea], [cb_FechaCrea], [cb_UsuarioModifica], [cb_FechaModifica], [cb_Activo]) VALUES (5, 6, 12, CAST(4000.00 AS Decimal(10, 2)), CAST(N'2019-11-14T12:00:00.000' AS DateTime), 0, 1, CAST(N'2019-11-14T07:26:27.033' AS DateTime), 1, CAST(N'2019-11-14T07:26:49.460' AS DateTime), 0)
INSERT [Plani].[tbEmpleadoBonos] ([cb_Id], [emp_Id], [cin_IdIngreso], [cb_Monto], [cb_FechaRegistro], [cb_Pagado], [cb_UsuarioCrea], [cb_FechaCrea], [cb_UsuarioModifica], [cb_FechaModifica], [cb_Activo]) VALUES (6, 2, 5, CAST(500.00 AS Decimal(10, 2)), CAST(N'2019-11-14T12:00:00.000' AS DateTime), 0, 1, CAST(N'2019-11-14T13:55:09.853' AS DateTime), 1, CAST(N'2019-11-14T22:09:09.643' AS DateTime), 0)
INSERT [Plani].[tbEmpleadoBonos] ([cb_Id], [emp_Id], [cin_IdIngreso], [cb_Monto], [cb_FechaRegistro], [cb_Pagado], [cb_UsuarioCrea], [cb_FechaCrea], [cb_UsuarioModifica], [cb_FechaModifica], [cb_Activo]) VALUES (7, 1, 5, CAST(200.00 AS Decimal(10, 2)), CAST(N'2019-11-12T12:00:00.000' AS DateTime), 1, 1, CAST(N'2019-11-14T23:08:18.080' AS DateTime), 1, CAST(N'2019-11-15T13:40:11.793' AS DateTime), 0)
INSERT [Plani].[tbEmpleadoBonos] ([cb_Id], [emp_Id], [cin_IdIngreso], [cb_Monto], [cb_FechaRegistro], [cb_Pagado], [cb_UsuarioCrea], [cb_FechaCrea], [cb_UsuarioModifica], [cb_FechaModifica], [cb_Activo]) VALUES (8, 3, 5, CAST(10000.00 AS Decimal(10, 2)), CAST(N'2019-12-12T12:00:00.000' AS DateTime), 0, 1, CAST(N'2019-11-14T23:10:36.287' AS DateTime), 1, CAST(N'2019-11-15T13:40:02.653' AS DateTime), 1)
INSERT [Plani].[tbEmpleadoBonos] ([cb_Id], [emp_Id], [cin_IdIngreso], [cb_Monto], [cb_FechaRegistro], [cb_Pagado], [cb_UsuarioCrea], [cb_FechaCrea], [cb_UsuarioModifica], [cb_FechaModifica], [cb_Activo]) VALUES (9, 4, 5, CAST(200.00 AS Decimal(10, 2)), CAST(N'2019-12-12T12:00:00.000' AS DateTime), 0, 1, CAST(N'2019-11-14T23:13:10.923' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbEmpleadoBonos] ([cb_Id], [emp_Id], [cin_IdIngreso], [cb_Monto], [cb_FechaRegistro], [cb_Pagado], [cb_UsuarioCrea], [cb_FechaCrea], [cb_UsuarioModifica], [cb_FechaModifica], [cb_Activo]) VALUES (10, 2, 5, CAST(555.00 AS Decimal(10, 2)), CAST(N'2019-11-12T12:00:00.000' AS DateTime), 0, 1, CAST(N'2019-11-14T23:14:01.197' AS DateTime), 1, CAST(N'2019-11-15T13:52:02.370' AS DateTime), 1)
INSERT [Plani].[tbEmpleadoBonos] ([cb_Id], [emp_Id], [cin_IdIngreso], [cb_Monto], [cb_FechaRegistro], [cb_Pagado], [cb_UsuarioCrea], [cb_FechaCrea], [cb_UsuarioModifica], [cb_FechaModifica], [cb_Activo]) VALUES (11, 1, 5, CAST(151.00 AS Decimal(10, 2)), CAST(N'2019-12-12T12:00:00.000' AS DateTime), 0, 1, CAST(N'2019-11-15T13:19:55.410' AS DateTime), 1, CAST(N'2019-11-15T13:40:34.117' AS DateTime), 1)
INSERT [Plani].[tbEmpleadoBonos] ([cb_Id], [emp_Id], [cin_IdIngreso], [cb_Monto], [cb_FechaRegistro], [cb_Pagado], [cb_UsuarioCrea], [cb_FechaCrea], [cb_UsuarioModifica], [cb_FechaModifica], [cb_Activo]) VALUES (12, 1, 5, CAST(300.00 AS Decimal(10, 2)), CAST(N'2019-11-15T13:27:21.000' AS DateTime), 0, 1, CAST(N'2019-11-15T13:27:21.943' AS DateTime), 1, CAST(N'2019-11-15T13:40:19.903' AS DateTime), 1)
INSERT [Plani].[tbEmpleadoBonos] ([cb_Id], [emp_Id], [cin_IdIngreso], [cb_Monto], [cb_FechaRegistro], [cb_Pagado], [cb_UsuarioCrea], [cb_FechaCrea], [cb_UsuarioModifica], [cb_FechaModifica], [cb_Activo]) VALUES (13, 2, 5, CAST(150000.00 AS Decimal(10, 2)), CAST(N'2019-11-15T13:41:26.330' AS DateTime), 0, 1, CAST(N'2019-11-15T13:41:26.330' AS DateTime), 1, CAST(N'2019-12-12T00:00:00.000' AS DateTime), 0)
INSERT [Plani].[tbEmpleadoBonos] ([cb_Id], [emp_Id], [cin_IdIngreso], [cb_Monto], [cb_FechaRegistro], [cb_Pagado], [cb_UsuarioCrea], [cb_FechaCrea], [cb_UsuarioModifica], [cb_FechaModifica], [cb_Activo]) VALUES (14, 1, 5, CAST(250.00 AS Decimal(10, 2)), CAST(N'2019-11-15T13:55:13.000' AS DateTime), 0, 1, CAST(N'2019-11-15T13:55:13.953' AS DateTime), 1, CAST(N'2019-11-14T00:00:00.000' AS DateTime), 0)
INSERT [Plani].[tbEmpleadoComisiones] ([cc_Id], [emp_Id], [cin_IdIngreso], [cc_Monto], [cc_FechaRegistro], [cc_Pagado], [cc_UsuarioCrea], [cc_FechaCrea], [cc_UsuarioModifica], [cc_FechaModifica], [cc_Activo]) VALUES (1, 2, 4, CAST(100.00 AS Decimal(10, 2)), CAST(N'2019-11-18T15:08:49.000' AS DateTime), 0, 1, CAST(N'2019-11-18T15:08:49.430' AS DateTime), 1, CAST(N'2019-11-18T15:12:48.500' AS DateTime), 0)
INSERT [Plani].[tbEmpleadoComisiones] ([cc_Id], [emp_Id], [cin_IdIngreso], [cc_Monto], [cc_FechaRegistro], [cc_Pagado], [cc_UsuarioCrea], [cc_FechaCrea], [cc_UsuarioModifica], [cc_FechaModifica], [cc_Activo]) VALUES (2, 1, 4, CAST(2000.00 AS Decimal(10, 2)), CAST(N'2019-11-18T15:09:29.397' AS DateTime), 0, 1, CAST(N'2019-11-18T15:09:29.397' AS DateTime), 1, CAST(N'2019-11-18T19:03:08.063' AS DateTime), 0)
INSERT [Plani].[tbEmpleadoComisiones] ([cc_Id], [emp_Id], [cin_IdIngreso], [cc_Monto], [cc_FechaRegistro], [cc_Pagado], [cc_UsuarioCrea], [cc_FechaCrea], [cc_UsuarioModifica], [cc_FechaModifica], [cc_Activo]) VALUES (3, 1, 4, CAST(100.00 AS Decimal(10, 2)), CAST(N'2019-11-18T15:09:35.903' AS DateTime), 0, 1, CAST(N'2019-11-18T15:09:35.903' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbEmpleadoComisiones] ([cc_Id], [emp_Id], [cin_IdIngreso], [cc_Monto], [cc_FechaRegistro], [cc_Pagado], [cc_UsuarioCrea], [cc_FechaCrea], [cc_UsuarioModifica], [cc_FechaModifica], [cc_Activo]) VALUES (4, 2, 4, CAST(300.00 AS Decimal(10, 2)), CAST(N'2019-11-18T15:10:32.000' AS DateTime), 0, 1, CAST(N'2019-11-18T15:10:32.897' AS DateTime), 1, CAST(N'2019-11-18T19:03:03.407' AS DateTime), 0)
INSERT [Plani].[tbEmpleadoComisiones] ([cc_Id], [emp_Id], [cin_IdIngreso], [cc_Monto], [cc_FechaRegistro], [cc_Pagado], [cc_UsuarioCrea], [cc_FechaCrea], [cc_UsuarioModifica], [cc_FechaModifica], [cc_Activo]) VALUES (5, 1, 4, CAST(100.00 AS Decimal(10, 2)), CAST(N'2019-11-18T15:10:53.573' AS DateTime), 0, 1, CAST(N'2019-11-18T15:10:53.573' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbEmpleadoComisiones] ([cc_Id], [emp_Id], [cin_IdIngreso], [cc_Monto], [cc_FechaRegistro], [cc_Pagado], [cc_UsuarioCrea], [cc_FechaCrea], [cc_UsuarioModifica], [cc_FechaModifica], [cc_Activo]) VALUES (6, 4, 4, CAST(300.00 AS Decimal(10, 2)), CAST(N'2019-11-18T15:11:04.373' AS DateTime), 0, 1, CAST(N'2019-11-18T15:11:04.373' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbEmpleadoComisiones] ([cc_Id], [emp_Id], [cin_IdIngreso], [cc_Monto], [cc_FechaRegistro], [cc_Pagado], [cc_UsuarioCrea], [cc_FechaCrea], [cc_UsuarioModifica], [cc_FechaModifica], [cc_Activo]) VALUES (7, 3, 4, CAST(600.00 AS Decimal(10, 2)), CAST(N'2019-11-18T15:37:16.000' AS DateTime), 0, 1, CAST(N'2019-11-18T15:37:16.417' AS DateTime), 1, CAST(N'2019-11-18T16:04:50.370' AS DateTime), 1)
INSERT [Plani].[tbEmpleadoComisiones] ([cc_Id], [emp_Id], [cin_IdIngreso], [cc_Monto], [cc_FechaRegistro], [cc_Pagado], [cc_UsuarioCrea], [cc_FechaCrea], [cc_UsuarioModifica], [cc_FechaModifica], [cc_Activo]) VALUES (8, 2, 4, CAST(968888.00 AS Decimal(10, 2)), CAST(N'2019-11-18T16:13:31.000' AS DateTime), 0, 1, CAST(N'2019-11-18T16:13:31.667' AS DateTime), 1, CAST(N'2019-11-18T23:15:16.290' AS DateTime), 1)
INSERT [Plani].[tbEmpleadoComisiones] ([cc_Id], [emp_Id], [cin_IdIngreso], [cc_Monto], [cc_FechaRegistro], [cc_Pagado], [cc_UsuarioCrea], [cc_FechaCrea], [cc_UsuarioModifica], [cc_FechaModifica], [cc_Activo]) VALUES (9, 1, 4, CAST(900.00 AS Decimal(10, 2)), CAST(N'2019-11-18T21:41:28.387' AS DateTime), 0, 1, CAST(N'2019-11-18T21:41:28.387' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbEmpleadoComisiones] ([cc_Id], [emp_Id], [cin_IdIngreso], [cc_Monto], [cc_FechaRegistro], [cc_Pagado], [cc_UsuarioCrea], [cc_FechaCrea], [cc_UsuarioModifica], [cc_FechaModifica], [cc_Activo]) VALUES (10, 1, 4, CAST(5565675.00 AS Decimal(10, 2)), CAST(N'2019-11-18T21:53:13.763' AS DateTime), 0, 1, CAST(N'2019-11-18T21:53:13.763' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbFormaPago] ([fpa_IdFormaPago], [fpa_Descripcion], [fpa_UsuarioCrea], [fpa_FechaCrea], [fpa_UsuarioModifica], [fpa_FechaModifica], [fpa_Activo]) VALUES (1, N'Transferencia Bancaria', 1, CAST(N'2019-11-09T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbFormaPago] ([fpa_IdFormaPago], [fpa_Descripcion], [fpa_UsuarioCrea], [fpa_FechaCrea], [fpa_UsuarioModifica], [fpa_FechaModifica], [fpa_Activo]) VALUES (2, N'Cheque', 1, CAST(N'2019-11-11T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbFormaPago] ([fpa_IdFormaPago], [fpa_Descripcion], [fpa_UsuarioCrea], [fpa_FechaCrea], [fpa_UsuarioModifica], [fpa_FechaModifica], [fpa_Activo]) VALUES (3, N'Efectivo', 1, CAST(N'2019-11-15T21:37:03.753' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbFormaPago] ([fpa_IdFormaPago], [fpa_Descripcion], [fpa_UsuarioCrea], [fpa_FechaCrea], [fpa_UsuarioModifica], [fpa_FechaModifica], [fpa_Activo]) VALUES (4, N'Transferencia Electronica', 1, CAST(N'2019-11-15T21:37:03.753' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbHistorialDePago] ([hipa_IdHistorialDePago], [emp_Id], [hipa_SueldoNeto], [hipa_FechaInicio], [hipa_FechaFin], [hipa_FechaPago], [hipa_Anio], [hipa_Mes], [peri_IdPeriodo], [hipa_UsuarioCrea], [hipa_FechaCrea], [hipa_UsuarioModifica], [hipa_FechaModifica]) VALUES (1, 1, CAST(8000.00 AS Decimal(10, 2)), CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2018-01-31T00:00:00.000' AS DateTime), CAST(N'2018-01-30T00:00:00.000' AS DateTime), 2018, 1, 1, 1, CAST(N'2019-11-09T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Plani].[tbHistorialDePago] ([hipa_IdHistorialDePago], [emp_Id], [hipa_SueldoNeto], [hipa_FechaInicio], [hipa_FechaFin], [hipa_FechaPago], [hipa_Anio], [hipa_Mes], [peri_IdPeriodo], [hipa_UsuarioCrea], [hipa_FechaCrea], [hipa_UsuarioModifica], [hipa_FechaModifica]) VALUES (2, 1, CAST(8000.00 AS Decimal(10, 2)), CAST(N'2019-01-01T00:00:00.000' AS DateTime), CAST(N'2019-01-31T00:00:00.000' AS DateTime), CAST(N'2019-01-30T00:00:00.000' AS DateTime), 2019, 1, 1, 1, CAST(N'2019-11-09T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Plani].[tbHistorialDePago] ([hipa_IdHistorialDePago], [emp_Id], [hipa_SueldoNeto], [hipa_FechaInicio], [hipa_FechaFin], [hipa_FechaPago], [hipa_Anio], [hipa_Mes], [peri_IdPeriodo], [hipa_UsuarioCrea], [hipa_FechaCrea], [hipa_UsuarioModifica], [hipa_FechaModifica]) VALUES (3, 2, CAST(8500.00 AS Decimal(10, 2)), CAST(N'2019-01-01T00:00:00.000' AS DateTime), CAST(N'2019-01-31T00:00:00.000' AS DateTime), CAST(N'2019-01-30T00:00:00.000' AS DateTime), 2019, 1, 1, 1, CAST(N'2019-11-10T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Plani].[tbInstitucionesFinancieras] ([insf_IdInstitucionFinanciera], [insf_DescInstitucionFinanc], [insf_Contacto], [insf_Telefono], [insf_Correo], [insf_UsuarioCrea], [insf_FechaCrea], [insf_UsuarioModifica], [insf_FechaModifica], [insf_Activo]) VALUES (1, N'Cooperativa Elga', N'Cesar Rodriguez', N'96857415', N'CooperativaElga@gmail.com', 1, CAST(N'2019-11-11T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbInstitucionesFinancieras] ([insf_IdInstitucionFinanciera], [insf_DescInstitucionFinanc], [insf_Contacto], [insf_Telefono], [insf_Correo], [insf_UsuarioCrea], [insf_FechaCrea], [insf_UsuarioModifica], [insf_FechaModifica], [insf_Activo]) VALUES (2, N'Cooperativa Arsenault', N'Dayana Martinez', N'98736154', N'Arsenault@outlook.com', 1, CAST(N'2019-11-11T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbInstitucionesFinancieras] ([insf_IdInstitucionFinanciera], [insf_DescInstitucionFinanc], [insf_Contacto], [insf_Telefono], [insf_Correo], [insf_UsuarioCrea], [insf_FechaCrea], [insf_UsuarioModifica], [insf_FechaModifica], [insf_Activo]) VALUES (3, N'Cooperativa Taulabe', N'Brayan Ochoa', N'97364528', N'Cooperativa.Taulabe@gmail.com', 1, CAST(N'2019-11-11T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbInstitucionesFinancieras] ([insf_IdInstitucionFinanciera], [insf_DescInstitucionFinanc], [insf_Contacto], [insf_Telefono], [insf_Correo], [insf_UsuarioCrea], [insf_FechaCrea], [insf_UsuarioModifica], [insf_FechaModifica], [insf_Activo]) VALUES (4, N'BANPAIS', N'Andrea Bueso', N'87459634', N'abueso@bac.com', 1, CAST(N'2019-11-18T12:44:01.940' AS DateTime), 1, CAST(N'2019-11-18T14:20:17.383' AS DateTime), 0)
INSERT [Plani].[tbInstitucionesFinancieras] ([insf_IdInstitucionFinanciera], [insf_DescInstitucionFinanc], [insf_Contacto], [insf_Telefono], [insf_Correo], [insf_UsuarioCrea], [insf_FechaCrea], [insf_UsuarioModifica], [insf_FechaModifica], [insf_Activo]) VALUES (6, N'BanhCafe', N'Maynor Hernandez', N'8796-5482', N'mhernandez@correo.com', 1, CAST(N'2019-11-18T12:45:11.073' AS DateTime), 1, CAST(N'2019-11-18T12:50:41.830' AS DateTime), 0)
INSERT [Plani].[tbInstitucionesFinancieras] ([insf_IdInstitucionFinanciera], [insf_DescInstitucionFinanc], [insf_Contacto], [insf_Telefono], [insf_Correo], [insf_UsuarioCrea], [insf_FechaCrea], [insf_UsuarioModifica], [insf_FechaModifica], [insf_Activo]) VALUES (8, N'Banco de los trabajadores - BANTRAB', N'David Matute', N'24872547', N'correo@bantrab.com', 1, CAST(N'2019-11-18T13:28:00.823' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbInstitucionesFinancieras] ([insf_IdInstitucionFinanciera], [insf_DescInstitucionFinanc], [insf_Contacto], [insf_Telefono], [insf_Correo], [insf_UsuarioCrea], [insf_FechaCrea], [insf_UsuarioModifica], [insf_FechaModifica], [insf_Activo]) VALUES (9, N'Cooperativa AHM', N'Mario Funez', N'0012045897481', N'Mario.f@ahm.com', 1, CAST(N'2019-11-18T14:09:16.753' AS DateTime), 1, CAST(N'2019-11-18T15:50:37.703' AS DateTime), 0)
INSERT [Plani].[tbInstitucionesFinancieras] ([insf_IdInstitucionFinanciera], [insf_DescInstitucionFinanc], [insf_Contacto], [insf_Telefono], [insf_Correo], [insf_UsuarioCrea], [insf_FechaCrea], [insf_UsuarioModifica], [insf_FechaModifica], [insf_Activo]) VALUES (10, N'Cooperativa Desarrolladores', N'Vladimir Putin', N'0013025478974', N'putin@rusia.com', 1, CAST(N'2019-11-18T14:22:17.623' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbInstitucionesFinancieras] ([insf_IdInstitucionFinanciera], [insf_DescInstitucionFinanc], [insf_Contacto], [insf_Telefono], [insf_Correo], [insf_UsuarioCrea], [insf_FechaCrea], [insf_UsuarioModifica], [insf_FechaModifica], [insf_Activo]) VALUES (11, N'Cooperativa Aegis', N'Panteon Garcia', N'33108438', N'putin@rusia.com', 1, CAST(N'2019-11-18T15:50:15.763' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbPeriodos] ([peri_IdPeriodo], [peri_DescripPeriodo], [peri_UsuarioCrea], [peri_FechaCrea], [peri_UsuarioModifica], [peri_FechaModifica], [peri_Activo]) VALUES (1, N'Mensual', 1, CAST(N'2019-11-09T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTechosDeducciones] ([tede_Id], [tede_RangoInicial], [tede_RangoFinal], [tede_Porcentaje], [cde_IdDeducciones], [tede_UsuarioCrea], [tede_FechaCrea], [tede_UsuarioModifica], [tede_FechaModifica], [tede_Activo]) VALUES (1, CAST(16323.00 AS Decimal(10, 2)), CAST(24545.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)), 6, 1, CAST(N'2019-11-11T19:56:05.480' AS DateTime), 1, CAST(N'2019-11-11T16:23:33.027' AS DateTime), 0)
INSERT [Plani].[tbTechosDeducciones] ([tede_Id], [tede_RangoInicial], [tede_RangoFinal], [tede_Porcentaje], [cde_IdDeducciones], [tede_UsuarioCrea], [tede_FechaCrea], [tede_UsuarioModifica], [tede_FechaModifica], [tede_Activo]) VALUES (2, CAST(144.00 AS Decimal(10, 2)), CAST(111.00 AS Decimal(10, 2)), CAST(11.00 AS Decimal(10, 2)), 6, 1, CAST(N'2019-11-11T15:05:08.697' AS DateTime), 1, CAST(N'2019-11-13T16:13:08.733' AS DateTime), 0)
INSERT [Plani].[tbTechosDeducciones] ([tede_Id], [tede_RangoInicial], [tede_RangoFinal], [tede_Porcentaje], [cde_IdDeducciones], [tede_UsuarioCrea], [tede_FechaCrea], [tede_UsuarioModifica], [tede_FechaModifica], [tede_Activo]) VALUES (3, CAST(1111111.00 AS Decimal(10, 2)), CAST(11111.00 AS Decimal(10, 2)), CAST(29.00 AS Decimal(10, 2)), 4, 1, CAST(N'2019-11-13T16:21:19.260' AS DateTime), 1, CAST(N'2019-11-15T13:09:38.050' AS DateTime), 0)
INSERT [Plani].[tbTechosDeducciones] ([tede_Id], [tede_RangoInicial], [tede_RangoFinal], [tede_Porcentaje], [cde_IdDeducciones], [tede_UsuarioCrea], [tede_FechaCrea], [tede_UsuarioModifica], [tede_FechaModifica], [tede_Activo]) VALUES (4, CAST(17500.00 AS Decimal(10, 2)), CAST(22000.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)), 8, 1, CAST(N'2019-11-14T15:33:33.990' AS DateTime), 1, CAST(N'2019-11-15T13:36:49.607' AS DateTime), 0)
INSERT [Plani].[tbTechosDeducciones] ([tede_Id], [tede_RangoInicial], [tede_RangoFinal], [tede_Porcentaje], [cde_IdDeducciones], [tede_UsuarioCrea], [tede_FechaCrea], [tede_UsuarioModifica], [tede_FechaModifica], [tede_Activo]) VALUES (5, CAST(32166.00 AS Decimal(10, 2)), CAST(50000.00 AS Decimal(10, 2)), CAST(255.00 AS Decimal(10, 2)), 5, 1, CAST(N'2019-11-14T15:49:04.630' AS DateTime), 1, CAST(N'2019-11-15T13:36:22.243' AS DateTime), 0)
INSERT [Plani].[tbTechosDeducciones] ([tede_Id], [tede_RangoInicial], [tede_RangoFinal], [tede_Porcentaje], [cde_IdDeducciones], [tede_UsuarioCrea], [tede_FechaCrea], [tede_UsuarioModifica], [tede_FechaModifica], [tede_Activo]) VALUES (6, CAST(123.00 AS Decimal(10, 2)), CAST(124.00 AS Decimal(10, 2)), CAST(6.00 AS Decimal(10, 2)), 7, 1, CAST(N'2019-11-14T15:50:20.037' AS DateTime), 1, CAST(N'2019-11-15T02:13:15.130' AS DateTime), 1)
INSERT [Plani].[tbTechosDeducciones] ([tede_Id], [tede_RangoInicial], [tede_RangoFinal], [tede_Porcentaje], [cde_IdDeducciones], [tede_UsuarioCrea], [tede_FechaCrea], [tede_UsuarioModifica], [tede_FechaModifica], [tede_Activo]) VALUES (7, CAST(789.00 AS Decimal(10, 2)), CAST(790.00 AS Decimal(10, 2)), CAST(4.00 AS Decimal(10, 2)), 4, 1, CAST(N'2019-11-14T15:51:30.927' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTechosDeducciones] ([tede_Id], [tede_RangoInicial], [tede_RangoFinal], [tede_Porcentaje], [cde_IdDeducciones], [tede_UsuarioCrea], [tede_FechaCrea], [tede_UsuarioModifica], [tede_FechaModifica], [tede_Activo]) VALUES (8, CAST(456.00 AS Decimal(10, 2)), CAST(654.00 AS Decimal(10, 2)), CAST(5555.00 AS Decimal(10, 2)), 10, 1, CAST(N'2019-11-14T15:53:28.597' AS DateTime), 1, CAST(N'2019-11-18T13:51:47.160' AS DateTime), 1)
INSERT [Plani].[tbTechosDeducciones] ([tede_Id], [tede_RangoInicial], [tede_RangoFinal], [tede_Porcentaje], [cde_IdDeducciones], [tede_UsuarioCrea], [tede_FechaCrea], [tede_UsuarioModifica], [tede_FechaModifica], [tede_Activo]) VALUES (9, CAST(546.00 AS Decimal(10, 2)), CAST(963.00 AS Decimal(10, 2)), CAST(4.00 AS Decimal(10, 2)), 10, 1, CAST(N'2019-11-14T15:54:56.613' AS DateTime), 1, CAST(N'2019-11-15T02:18:40.333' AS DateTime), 1)
INSERT [Plani].[tbTechosDeducciones] ([tede_Id], [tede_RangoInicial], [tede_RangoFinal], [tede_Porcentaje], [cde_IdDeducciones], [tede_UsuarioCrea], [tede_FechaCrea], [tede_UsuarioModifica], [tede_FechaModifica], [tede_Activo]) VALUES (10, CAST(789.00 AS Decimal(10, 2)), CAST(987.00 AS Decimal(10, 2)), CAST(4.00 AS Decimal(10, 2)), 7, 1, CAST(N'2019-11-14T15:56:21.570' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTechosDeducciones] ([tede_Id], [tede_RangoInicial], [tede_RangoFinal], [tede_Porcentaje], [cde_IdDeducciones], [tede_UsuarioCrea], [tede_FechaCrea], [tede_UsuarioModifica], [tede_FechaModifica], [tede_Activo]) VALUES (11, CAST(123.00 AS Decimal(10, 2)), CAST(321.00 AS Decimal(10, 2)), CAST(4.00 AS Decimal(10, 2)), 1, 1, CAST(N'2019-11-14T15:59:00.870' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTechosDeducciones] ([tede_Id], [tede_RangoInicial], [tede_RangoFinal], [tede_Porcentaje], [cde_IdDeducciones], [tede_UsuarioCrea], [tede_FechaCrea], [tede_UsuarioModifica], [tede_FechaModifica], [tede_Activo]) VALUES (12, CAST(321.00 AS Decimal(10, 2)), CAST(456.00 AS Decimal(10, 2)), CAST(6.00 AS Decimal(10, 2)), 5, 1, CAST(N'2019-11-14T15:59:34.927' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTechosDeducciones] ([tede_Id], [tede_RangoInicial], [tede_RangoFinal], [tede_Porcentaje], [cde_IdDeducciones], [tede_UsuarioCrea], [tede_FechaCrea], [tede_UsuarioModifica], [tede_FechaModifica], [tede_Activo]) VALUES (13, CAST(963.00 AS Decimal(10, 2)), CAST(369.00 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)), 6, 1, CAST(N'2019-11-14T16:00:51.257' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTechosDeducciones] ([tede_Id], [tede_RangoInicial], [tede_RangoFinal], [tede_Porcentaje], [cde_IdDeducciones], [tede_UsuarioCrea], [tede_FechaCrea], [tede_UsuarioModifica], [tede_FechaModifica], [tede_Activo]) VALUES (14, CAST(589.00 AS Decimal(10, 2)), CAST(987.00 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)), 11, 1, CAST(N'2019-11-14T16:07:03.153' AS DateTime), 1, CAST(N'2019-11-17T20:11:18.507' AS DateTime), 0)
INSERT [Plani].[tbTechosDeducciones] ([tede_Id], [tede_RangoInicial], [tede_RangoFinal], [tede_Porcentaje], [cde_IdDeducciones], [tede_UsuarioCrea], [tede_FechaCrea], [tede_UsuarioModifica], [tede_FechaModifica], [tede_Activo]) VALUES (15, CAST(900.00 AS Decimal(10, 2)), CAST(1500.00 AS Decimal(10, 2)), CAST(4.00 AS Decimal(10, 2)), 7, 1, CAST(N'2019-11-14T16:08:31.487' AS DateTime), 1, CAST(N'2019-11-15T13:56:00.283' AS DateTime), 1)
INSERT [Plani].[tbTechosDeducciones] ([tede_Id], [tede_RangoInicial], [tede_RangoFinal], [tede_Porcentaje], [cde_IdDeducciones], [tede_UsuarioCrea], [tede_FechaCrea], [tede_UsuarioModifica], [tede_FechaModifica], [tede_Activo]) VALUES (16, CAST(15555.00 AS Decimal(10, 2)), CAST(17000.00 AS Decimal(10, 2)), CAST(14.00 AS Decimal(10, 2)), 4, 1, CAST(N'2019-11-14T16:22:16.957' AS DateTime), 1, CAST(N'2019-11-15T13:45:46.067' AS DateTime), 0)
INSERT [Plani].[tbTechosDeducciones] ([tede_Id], [tede_RangoInicial], [tede_RangoFinal], [tede_Porcentaje], [cde_IdDeducciones], [tede_UsuarioCrea], [tede_FechaCrea], [tede_UsuarioModifica], [tede_FechaModifica], [tede_Activo]) VALUES (17, CAST(9.99 AS Decimal(10, 2)), CAST(10.99 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)), 24, 1, CAST(N'2019-11-15T02:27:51.087' AS DateTime), 1, CAST(N'2019-11-18T13:51:33.703' AS DateTime), 1)
INSERT [Plani].[tbTipoDeduccion] ([tde_IdTipoDedu], [tde_Descripcion], [tde_UsuarioCrea], [tde_FechaCrea], [tde_UsuarioModifica], [tde_FechaModifica], [tde_Activo]) VALUES (1, N'Deduccion Generica 3', 1, CAST(N'2019-10-19T00:00:00.000' AS DateTime), 1, CAST(N'2019-11-15T13:57:57.740' AS DateTime), 1)
INSERT [Plani].[tbTipoDeduccion] ([tde_IdTipoDedu], [tde_Descripcion], [tde_UsuarioCrea], [tde_FechaCrea], [tde_UsuarioModifica], [tde_FechaModifica], [tde_Activo]) VALUES (2, N'Instituciones financieras', 1, CAST(N'2019-11-11T00:00:00.000' AS DateTime), 1, CAST(N'2019-11-13T23:11:01.153' AS DateTime), 1)
INSERT [Plani].[tbTipoDeduccion] ([tde_IdTipoDedu], [tde_Descripcion], [tde_UsuarioCrea], [tde_FechaCrea], [tde_UsuarioModifica], [tde_FechaModifica], [tde_Activo]) VALUES (3, N'Extra', 1, CAST(N'2019-11-11T00:00:00.000' AS DateTime), 1, CAST(N'2019-11-13T23:57:22.933' AS DateTime), 1)
INSERT [Plani].[tbTipoDeduccion] ([tde_IdTipoDedu], [tde_Descripcion], [tde_UsuarioCrea], [tde_FechaCrea], [tde_UsuarioModifica], [tde_FechaModifica], [tde_Activo]) VALUES (4, N'Normal', 1, CAST(N'2019-11-11T00:00:00.000' AS DateTime), 1, CAST(N'2019-11-14T00:17:50.010' AS DateTime), 1)
INSERT [Plani].[tbTipoDeduccion] ([tde_IdTipoDedu], [tde_Descripcion], [tde_UsuarioCrea], [tde_FechaCrea], [tde_UsuarioModifica], [tde_FechaModifica], [tde_Activo]) VALUES (5, N'holas', 1, CAST(N'2019-11-11T16:05:07.243' AS DateTime), 1, CAST(N'2019-11-18T13:46:43.627' AS DateTime), 1)
INSERT [Plani].[tbTipoDeduccion] ([tde_IdTipoDedu], [tde_Descripcion], [tde_UsuarioCrea], [tde_FechaCrea], [tde_UsuarioModifica], [tde_FechaModifica], [tde_Activo]) VALUES (6, N'Deduccion Generica 113', 1, CAST(N'2019-11-11T16:05:14.140' AS DateTime), 1, CAST(N'2019-11-18T16:02:50.687' AS DateTime), 1)
INSERT [Plani].[tbTipoDeduccion] ([tde_IdTipoDedu], [tde_Descripcion], [tde_UsuarioCrea], [tde_FechaCrea], [tde_UsuarioModifica], [tde_FechaModifica], [tde_Activo]) VALUES (7, N'Prueba02', 1, CAST(N'2019-11-11T16:05:26.850' AS DateTime), 1, CAST(N'2019-11-18T13:29:41.513' AS DateTime), 1)
INSERT [Plani].[tbTipoDeduccion] ([tde_IdTipoDedu], [tde_Descripcion], [tde_UsuarioCrea], [tde_FechaCrea], [tde_UsuarioModifica], [tde_FechaModifica], [tde_Activo]) VALUES (8, N'Holaa', 1, CAST(N'2019-11-11T16:05:35.937' AS DateTime), 1, CAST(N'2019-11-18T13:26:46.817' AS DateTime), 1)
INSERT [Plani].[tbTipoDeduccion] ([tde_IdTipoDedu], [tde_Descripcion], [tde_UsuarioCrea], [tde_FechaCrea], [tde_UsuarioModifica], [tde_FechaModifica], [tde_Activo]) VALUES (9, N'holaProb', 1, CAST(N'2019-11-11T16:05:38.427' AS DateTime), 1, CAST(N'2019-11-18T15:26:17.633' AS DateTime), 1)
INSERT [Plani].[tbTipoDeduccion] ([tde_IdTipoDedu], [tde_Descripcion], [tde_UsuarioCrea], [tde_FechaCrea], [tde_UsuarioModifica], [tde_FechaModifica], [tde_Activo]) VALUES (10, N'hola', 1, CAST(N'2019-11-11T16:06:42.267' AS DateTime), 1, CAST(N'2019-11-14T12:57:57.577' AS DateTime), 1)
INSERT [Plani].[tbTipoDeduccion] ([tde_IdTipoDedu], [tde_Descripcion], [tde_UsuarioCrea], [tde_FechaCrea], [tde_UsuarioModifica], [tde_FechaModifica], [tde_Activo]) VALUES (11, N'hola mundo', 1, CAST(N'2019-11-11T16:09:46.020' AS DateTime), 1, CAST(N'2019-11-14T12:48:49.283' AS DateTime), 1)
INSERT [Plani].[tbTipoDeduccion] ([tde_IdTipoDedu], [tde_Descripcion], [tde_UsuarioCrea], [tde_FechaCrea], [tde_UsuarioModifica], [tde_FechaModifica], [tde_Activo]) VALUES (12, N'hey34', 1, CAST(N'2019-11-11T16:14:14.087' AS DateTime), 1, CAST(N'2019-11-18T10:02:52.793' AS DateTime), 1)
INSERT [Plani].[tbTipoDeduccion] ([tde_IdTipoDedu], [tde_Descripcion], [tde_UsuarioCrea], [tde_FechaCrea], [tde_UsuarioModifica], [tde_FechaModifica], [tde_Activo]) VALUES (13, N'hey34', 1, CAST(N'2019-11-11T16:14:52.603' AS DateTime), 1, CAST(N'2019-11-18T10:04:50.980' AS DateTime), 1)
INSERT [Plani].[tbTipoDeduccion] ([tde_IdTipoDedu], [tde_Descripcion], [tde_UsuarioCrea], [tde_FechaCrea], [tde_UsuarioModifica], [tde_FechaModifica], [tde_Activo]) VALUES (14, N'Prueba_MM', 1, CAST(N'2019-11-11T16:15:16.630' AS DateTime), 1, CAST(N'2019-11-18T14:27:30.513' AS DateTime), 1)
INSERT [Plani].[tbTipoDeduccion] ([tde_IdTipoDedu], [tde_Descripcion], [tde_UsuarioCrea], [tde_FechaCrea], [tde_UsuarioModifica], [tde_FechaModifica], [tde_Activo]) VALUES (15, N' niño', 1, CAST(N'2019-11-11T16:18:31.937' AS DateTime), 1, CAST(N'2019-11-18T13:47:52.543' AS DateTime), 1)
INSERT [Plani].[tbTipoDeduccion] ([tde_IdTipoDedu], [tde_Descripcion], [tde_UsuarioCrea], [tde_FechaCrea], [tde_UsuarioModifica], [tde_FechaModifica], [tde_Activo]) VALUES (16, N' niño', 1, CAST(N'2019-11-11T16:18:31.937' AS DateTime), 1, CAST(N'2019-11-18T13:48:27.937' AS DateTime), 1)
INSERT [Plani].[tbTipoDeduccion] ([tde_IdTipoDedu], [tde_Descripcion], [tde_UsuarioCrea], [tde_FechaCrea], [tde_UsuarioModifica], [tde_FechaModifica], [tde_Activo]) VALUES (17, N'niñito', 1, CAST(N'2019-11-11T16:18:54.127' AS DateTime), 1, CAST(N'2019-11-14T12:42:38.717' AS DateTime), 1)
INSERT [Plani].[tbTipoDeduccion] ([tde_IdTipoDedu], [tde_Descripcion], [tde_UsuarioCrea], [tde_FechaCrea], [tde_UsuarioModifica], [tde_FechaModifica], [tde_Activo]) VALUES (18, N'niñito', 1, CAST(N'2019-11-11T16:18:54.123' AS DateTime), 1, CAST(N'2019-11-14T12:43:57.383' AS DateTime), 1)
INSERT [Plani].[tbTipoDeduccion] ([tde_IdTipoDedu], [tde_Descripcion], [tde_UsuarioCrea], [tde_FechaCrea], [tde_UsuarioModifica], [tde_FechaModifica], [tde_Activo]) VALUES (19, N'Probando_test43', 1, CAST(N'2019-11-11T16:21:20.463' AS DateTime), 1, CAST(N'2019-11-18T14:28:30.013' AS DateTime), 1)
INSERT [Plani].[tbTipoDeduccion] ([tde_IdTipoDedu], [tde_Descripcion], [tde_UsuarioCrea], [tde_FechaCrea], [tde_UsuarioModifica], [tde_FechaModifica], [tde_Activo]) VALUES (20, N'Extra23', 1, CAST(N'2019-11-11T16:24:22.263' AS DateTime), 1, CAST(N'2019-11-15T13:59:13.453' AS DateTime), 1)
INSERT [Plani].[tbTipoDeduccion] ([tde_IdTipoDedu], [tde_Descripcion], [tde_UsuarioCrea], [tde_FechaCrea], [tde_UsuarioModifica], [tde_FechaModifica], [tde_Activo]) VALUES (21, N'Prueba Generica 1', 1, CAST(N'2019-11-13T15:34:26.883' AS DateTime), 1, CAST(N'2019-11-18T13:29:21.063' AS DateTime), 1)
INSERT [Plani].[tbTipoDeduccion] ([tde_IdTipoDedu], [tde_Descripcion], [tde_UsuarioCrea], [tde_FechaCrea], [tde_UsuarioModifica], [tde_FechaModifica], [tde_Activo]) VALUES (22, N'GUHOJ', 1, CAST(N'2019-11-13T15:34:42.517' AS DateTime), 1, CAST(N'2019-11-18T10:01:21.387' AS DateTime), 1)
INSERT [Plani].[tbTipoDeduccion] ([tde_IdTipoDedu], [tde_Descripcion], [tde_UsuarioCrea], [tde_FechaCrea], [tde_UsuarioModifica], [tde_FechaModifica], [tde_Activo]) VALUES (23, N'Probando', 1, CAST(N'2019-11-18T14:32:56.657' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoDeduccion] ([tde_IdTipoDedu], [tde_Descripcion], [tde_UsuarioCrea], [tde_FechaCrea], [tde_UsuarioModifica], [tde_FechaModifica], [tde_Activo]) VALUES (24, N'Testing01', 1, CAST(N'2019-11-18T15:36:10.797' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoDeduccion] ([tde_IdTipoDedu], [tde_Descripcion], [tde_UsuarioCrea], [tde_FechaCrea], [tde_UsuarioModifica], [tde_FechaModifica], [tde_Activo]) VALUES (25, N'Testing02', 1, CAST(N'2019-11-18T15:42:18.913' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (7, 6, 1, 1, CAST(N'2019-11-11T21:38:37.663' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (8, 7, 1, 1, CAST(N'2019-11-11T21:39:58.140' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (10, 9, 1, 1, CAST(N'2019-11-11T21:48:04.337' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (11, 10, 1, 1, CAST(N'2019-11-11T22:01:03.613' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (13, 11, 1, 1, CAST(N'2019-11-11T22:49:24.913' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (15, 11, 5, 1, CAST(N'2019-11-11T22:49:25.420' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (16, 11, 6, 1, CAST(N'2019-11-11T22:49:25.713' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (17, 11, 7, 1, CAST(N'2019-11-11T22:49:26.347' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (18, 12, 1, 1, CAST(N'2019-11-11T23:58:12.883' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (19, 12, 4, 1, CAST(N'2019-11-11T23:58:13.073' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (21, 12, 6, 1, CAST(N'2019-11-11T23:58:13.400' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (22, 12, 7, 1, CAST(N'2019-11-11T23:58:13.540' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (23, 12, 8, 1, CAST(N'2019-11-11T23:58:13.727' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (25, 12, 10, 1, CAST(N'2019-11-11T23:58:14.057' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (26, 12, 11, 1, CAST(N'2019-11-11T23:58:14.197' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (28, 12, 13, 1, CAST(N'2019-11-11T23:58:14.523' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (30, 12, 15, 1, CAST(N'2019-11-11T23:58:14.853' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (31, 12, 16, 1, CAST(N'2019-11-11T23:58:15.040' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (32, 12, 17, 1, CAST(N'2019-11-11T23:58:15.180' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (68, 16, 35, 1, CAST(N'2019-11-14T13:05:05.447' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (90, 2, 40, 1, CAST(N'2019-11-15T02:20:13.560' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (110, 1, 73, 1, CAST(N'2019-11-15T16:17:40.910' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (114, 21, 72, 1, CAST(N'2019-11-15T19:23:16.550' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (115, 21, 73, 1, CAST(N'2019-11-15T19:23:16.723' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (116, 18, 41, 1, CAST(N'2019-11-16T20:12:33.397' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (118, 1, 39, 1, CAST(N'2019-11-16T20:29:25.207' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (119, 22, 39, 1, CAST(N'2019-11-16T20:30:30.433' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (120, 22, 72, 1, CAST(N'2019-11-16T20:30:30.747' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (121, 1, 60, 1, CAST(N'2019-11-16T21:26:18.457' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (122, 1, 41, 1, CAST(N'2019-11-16T21:26:44.257' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (123, 23, 39, 1, CAST(N'2019-11-16T21:36:49.247' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (125, 25, 41, 1, CAST(N'2019-11-16T21:38:16.387' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (126, 26, 73, 1, CAST(N'2019-11-16T23:55:39.697' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (127, 27, 73, 1, CAST(N'2019-11-17T00:27:34.840' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (131, 31, 73, 1, CAST(N'2019-11-17T00:33:52.830' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (132, 32, 73, 1, CAST(N'2019-11-17T00:35:19.387' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (134, 34, 39, 1, CAST(N'2019-11-17T00:38:51.657' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (139, 39, 72, 1, CAST(N'2019-11-17T01:29:38.623' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (141, 39, 60, 1, CAST(N'2019-11-17T01:32:32.250' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (142, 38, 39, 1, CAST(N'2019-11-17T01:33:56.177' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (146, 41, 39, 1, CAST(N'2019-11-18T12:40:01.317' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (147, 41, 76, 1, CAST(N'2019-11-18T12:40:43.000' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (149, 33, 76, 1, CAST(N'2019-11-18T14:32:24.790' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (151, 38, 76, 1, CAST(N'2019-11-18T15:29:40.130' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (152, 40, 61, 1, CAST(N'2019-11-18T15:30:37.597' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (153, 38, 61, 1, CAST(N'2019-11-18T21:01:40.853' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (154, 38, 70, 1, CAST(N'2019-11-18T21:01:41.043' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (155, 38, 72, 1, CAST(N'2019-11-18T21:01:41.377' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (156, 38, 73, 1, CAST(N'2019-11-18T21:01:42.350' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (157, 38, 74, 1, CAST(N'2019-11-18T21:01:42.840' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (158, 38, 77, 1, CAST(N'2019-11-18T21:01:43.217' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (159, 38, 78, 1, CAST(N'2019-11-18T21:01:43.407' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (160, 38, 79, 1, CAST(N'2019-11-18T21:01:44.347' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (161, 38, 80, 1, CAST(N'2019-11-18T21:01:44.880' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (162, 38, 81, 1, CAST(N'2019-11-18T21:01:45.067' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (163, 38, 82, 1, CAST(N'2019-11-18T21:01:45.473' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (164, 38, 83, 1, CAST(N'2019-11-18T21:01:45.777' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (165, 38, 84, 1, CAST(N'2019-11-18T21:01:46.073' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (166, 38, 85, 1, CAST(N'2019-11-18T21:01:46.467' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (167, 38, 86, 1, CAST(N'2019-11-18T21:01:46.823' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (168, 38, 87, 1, CAST(N'2019-11-18T21:01:47.110' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (169, 38, 88, 1, CAST(N'2019-11-18T21:01:47.523' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (170, 38, 89, 1, CAST(N'2019-11-18T21:01:47.827' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (171, 38, 90, 1, CAST(N'2019-11-18T21:01:48.133' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (172, 38, 91, 1, CAST(N'2019-11-18T21:01:48.443' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (173, 37, 39, 1, CAST(N'2019-11-18T21:03:35.350' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (174, 37, 61, 1, CAST(N'2019-11-18T21:03:35.853' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (175, 37, 70, 1, CAST(N'2019-11-18T21:03:36.370' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (176, 37, 72, 1, CAST(N'2019-11-18T21:03:36.650' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (177, 37, 73, 1, CAST(N'2019-11-18T21:03:37.160' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (178, 37, 74, 1, CAST(N'2019-11-18T21:03:37.500' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (179, 37, 75, 1, CAST(N'2019-11-18T21:03:37.807' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (180, 37, 76, 1, CAST(N'2019-11-18T21:03:38.117' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (181, 37, 77, 1, CAST(N'2019-11-18T21:03:38.420' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (182, 37, 78, 1, CAST(N'2019-11-18T21:03:38.727' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (183, 37, 79, 1, CAST(N'2019-11-18T21:03:39.037' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (184, 37, 80, 1, CAST(N'2019-11-18T21:03:39.343' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (185, 37, 81, 1, CAST(N'2019-11-18T21:03:39.727' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (186, 37, 82, 1, CAST(N'2019-11-18T21:03:40.013' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (187, 37, 83, 1, CAST(N'2019-11-18T21:03:40.327' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (188, 37, 84, 1, CAST(N'2019-11-18T21:03:40.667' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (189, 37, 85, 1, CAST(N'2019-11-18T21:03:41.187' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (190, 37, 86, 1, CAST(N'2019-11-18T21:03:41.493' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (191, 37, 87, 1, CAST(N'2019-11-18T21:03:41.800' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (192, 37, 88, 1, CAST(N'2019-11-18T21:03:42.107' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (193, 37, 89, 1, CAST(N'2019-11-18T21:03:42.417' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (194, 37, 90, 1, CAST(N'2019-11-18T21:03:42.733' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (195, 37, 91, 1, CAST(N'2019-11-18T21:03:45.200' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (196, 36, 39, 1, CAST(N'2019-11-18T21:05:16.173' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (197, 36, 61, 1, CAST(N'2019-11-18T21:05:16.447' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (198, 36, 70, 1, CAST(N'2019-11-18T21:05:16.743' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (199, 36, 72, 1, CAST(N'2019-11-18T21:05:17.117' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (200, 36, 73, 1, CAST(N'2019-11-18T21:05:17.443' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (201, 36, 74, 1, CAST(N'2019-11-18T21:05:17.753' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (202, 36, 75, 1, CAST(N'2019-11-18T21:05:18.220' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (203, 36, 76, 1, CAST(N'2019-11-18T21:05:18.673' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (204, 36, 77, 1, CAST(N'2019-11-18T21:05:18.980' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (205, 36, 78, 1, CAST(N'2019-11-18T21:05:19.287' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (206, 36, 79, 1, CAST(N'2019-11-18T21:05:19.593' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (207, 36, 80, 1, CAST(N'2019-11-18T21:05:19.900' AS DateTime), NULL, NULL, 1)
GO
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (208, 36, 81, 1, CAST(N'2019-11-18T21:05:20.210' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (209, 36, 82, 1, CAST(N'2019-11-18T21:05:20.513' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (210, 36, 83, 1, CAST(N'2019-11-18T21:05:20.847' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (211, 36, 84, 1, CAST(N'2019-11-18T21:05:21.187' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (212, 36, 85, 1, CAST(N'2019-11-18T21:05:21.533' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (213, 36, 86, 1, CAST(N'2019-11-18T21:05:21.950' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (214, 36, 87, 1, CAST(N'2019-11-18T21:05:22.257' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (215, 36, 88, 1, CAST(N'2019-11-18T21:05:22.743' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (216, 36, 89, 1, CAST(N'2019-11-18T21:05:23.177' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion], [cpla_IdPlanilla], [cde_IdDeducciones], [tpdd_UsuarioCrea], [tpdd_FechaCrea], [tpdd_UsuarioModifica], [tpdd_FechaModifica], [tpdd_Activo]) VALUES (217, 36, 90, 1, CAST(N'2019-11-18T21:05:23.527' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleIngreso] ([tpdi_IdDetallePlanillaIngreso], [cin_IdIngreso], [cpla_IdPlanilla], [tpdi_UsuarioCrea], [tpdi_FechaCrea], [tpdi_UsuarioModifica], [tpdi_FechaModifica], [tpdi_Activo]) VALUES (6, 3, 3, 1, CAST(N'2019-11-11T21:28:34.020' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleIngreso] ([tpdi_IdDetallePlanillaIngreso], [cin_IdIngreso], [cpla_IdPlanilla], [tpdi_UsuarioCrea], [tpdi_FechaCrea], [tpdi_UsuarioModifica], [tpdi_FechaModifica], [tpdi_Activo]) VALUES (7, 4, 3, 1, CAST(N'2019-11-11T21:28:49.083' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleIngreso] ([tpdi_IdDetallePlanillaIngreso], [cin_IdIngreso], [cpla_IdPlanilla], [tpdi_UsuarioCrea], [tpdi_FechaCrea], [tpdi_UsuarioModifica], [tpdi_FechaModifica], [tpdi_Activo]) VALUES (9, 14, 3, 1, CAST(N'2019-11-11T21:29:13.100' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleIngreso] ([tpdi_IdDetallePlanillaIngreso], [cin_IdIngreso], [cpla_IdPlanilla], [tpdi_UsuarioCrea], [tpdi_FechaCrea], [tpdi_UsuarioModifica], [tpdi_FechaModifica], [tpdi_Activo]) VALUES (13, 3, 5, 1, CAST(N'2019-11-11T21:36:32.030' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleIngreso] ([tpdi_IdDetallePlanillaIngreso], [cin_IdIngreso], [cpla_IdPlanilla], [tpdi_UsuarioCrea], [tpdi_FechaCrea], [tpdi_UsuarioModifica], [tpdi_FechaModifica], [tpdi_Activo]) VALUES (16, 3, 6, 1, CAST(N'2019-11-11T21:38:23.617' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleIngreso] ([tpdi_IdDetallePlanillaIngreso], [cin_IdIngreso], [cpla_IdPlanilla], [tpdi_UsuarioCrea], [tpdi_FechaCrea], [tpdi_UsuarioModifica], [tpdi_FechaModifica], [tpdi_Activo]) VALUES (19, 3, 7, 1, CAST(N'2019-11-11T21:39:57.930' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleIngreso] ([tpdi_IdDetallePlanillaIngreso], [cin_IdIngreso], [cpla_IdPlanilla], [tpdi_UsuarioCrea], [tpdi_FechaCrea], [tpdi_UsuarioModifica], [tpdi_FechaModifica], [tpdi_Activo]) VALUES (22, 3, 8, 1, CAST(N'2019-11-11T21:40:27.667' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleIngreso] ([tpdi_IdDetallePlanillaIngreso], [cin_IdIngreso], [cpla_IdPlanilla], [tpdi_UsuarioCrea], [tpdi_FechaCrea], [tpdi_UsuarioModifica], [tpdi_FechaModifica], [tpdi_Activo]) VALUES (28, 4, 10, 1, CAST(N'2019-11-11T22:01:02.803' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleIngreso] ([tpdi_IdDetallePlanillaIngreso], [cin_IdIngreso], [cpla_IdPlanilla], [tpdi_UsuarioCrea], [tpdi_FechaCrea], [tpdi_UsuarioModifica], [tpdi_FechaModifica], [tpdi_Activo]) VALUES (30, 13, 10, 1, CAST(N'2019-11-11T22:01:03.407' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleIngreso] ([tpdi_IdDetallePlanillaIngreso], [cin_IdIngreso], [cpla_IdPlanilla], [tpdi_UsuarioCrea], [tpdi_FechaCrea], [tpdi_UsuarioModifica], [tpdi_FechaModifica], [tpdi_Activo]) VALUES (33, 3, 11, 1, CAST(N'2019-11-11T22:49:23.970' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleIngreso] ([tpdi_IdDetallePlanillaIngreso], [cin_IdIngreso], [cpla_IdPlanilla], [tpdi_UsuarioCrea], [tpdi_FechaCrea], [tpdi_UsuarioModifica], [tpdi_FechaModifica], [tpdi_Activo]) VALUES (34, 4, 11, 1, CAST(N'2019-11-11T22:49:24.237' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleIngreso] ([tpdi_IdDetallePlanillaIngreso], [cin_IdIngreso], [cpla_IdPlanilla], [tpdi_UsuarioCrea], [tpdi_FechaCrea], [tpdi_UsuarioModifica], [tpdi_FechaModifica], [tpdi_Activo]) VALUES (37, 3, 12, 1, CAST(N'2019-11-11T23:58:11.840' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleIngreso] ([tpdi_IdDetallePlanillaIngreso], [cin_IdIngreso], [cpla_IdPlanilla], [tpdi_UsuarioCrea], [tpdi_FechaCrea], [tpdi_UsuarioModifica], [tpdi_FechaModifica], [tpdi_Activo]) VALUES (39, 6, 12, 1, CAST(N'2019-11-11T23:58:12.163' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleIngreso] ([tpdi_IdDetallePlanillaIngreso], [cin_IdIngreso], [cpla_IdPlanilla], [tpdi_UsuarioCrea], [tpdi_FechaCrea], [tpdi_UsuarioModifica], [tpdi_FechaModifica], [tpdi_Activo]) VALUES (122, 46, 1, 1, CAST(N'2019-11-15T16:17:41.430' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleIngreso] ([tpdi_IdDetallePlanillaIngreso], [cin_IdIngreso], [cpla_IdPlanilla], [tpdi_UsuarioCrea], [tpdi_FechaCrea], [tpdi_UsuarioModifica], [tpdi_FechaModifica], [tpdi_Activo]) VALUES (126, 47, 21, 1, CAST(N'2019-11-15T19:23:17.033' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleIngreso] ([tpdi_IdDetallePlanillaIngreso], [cin_IdIngreso], [cpla_IdPlanilla], [tpdi_UsuarioCrea], [tpdi_FechaCrea], [tpdi_UsuarioModifica], [tpdi_FechaModifica], [tpdi_Activo]) VALUES (128, 46, 18, 1, CAST(N'2019-11-16T20:12:34.093' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleIngreso] ([tpdi_IdDetallePlanillaIngreso], [cin_IdIngreso], [cpla_IdPlanilla], [tpdi_UsuarioCrea], [tpdi_FechaCrea], [tpdi_UsuarioModifica], [tpdi_FechaModifica], [tpdi_Activo]) VALUES (129, 46, 17, 1, CAST(N'2019-11-16T20:18:46.127' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleIngreso] ([tpdi_IdDetallePlanillaIngreso], [cin_IdIngreso], [cpla_IdPlanilla], [tpdi_UsuarioCrea], [tpdi_FechaCrea], [tpdi_UsuarioModifica], [tpdi_FechaModifica], [tpdi_Activo]) VALUES (133, 25, 22, 1, CAST(N'2019-11-16T20:30:29.937' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleIngreso] ([tpdi_IdDetallePlanillaIngreso], [cin_IdIngreso], [cpla_IdPlanilla], [tpdi_UsuarioCrea], [tpdi_FechaCrea], [tpdi_UsuarioModifica], [tpdi_FechaModifica], [tpdi_Activo]) VALUES (137, 25, 25, 1, CAST(N'2019-11-16T23:54:21.250' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleIngreso] ([tpdi_IdDetallePlanillaIngreso], [cin_IdIngreso], [cpla_IdPlanilla], [tpdi_UsuarioCrea], [tpdi_FechaCrea], [tpdi_UsuarioModifica], [tpdi_FechaModifica], [tpdi_Activo]) VALUES (139, 25, 27, 1, CAST(N'2019-11-17T00:27:34.650' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleIngreso] ([tpdi_IdDetallePlanillaIngreso], [cin_IdIngreso], [cpla_IdPlanilla], [tpdi_UsuarioCrea], [tpdi_FechaCrea], [tpdi_UsuarioModifica], [tpdi_FechaModifica], [tpdi_Activo]) VALUES (148, 25, 36, 1, CAST(N'2019-11-17T01:12:59.043' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleIngreso] ([tpdi_IdDetallePlanillaIngreso], [cin_IdIngreso], [cpla_IdPlanilla], [tpdi_UsuarioCrea], [tpdi_FechaCrea], [tpdi_UsuarioModifica], [tpdi_FechaModifica], [tpdi_Activo]) VALUES (155, 25, 39, 1, CAST(N'2019-11-17T01:29:38.480' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleIngreso] ([tpdi_IdDetallePlanillaIngreso], [cin_IdIngreso], [cpla_IdPlanilla], [tpdi_UsuarioCrea], [tpdi_FechaCrea], [tpdi_UsuarioModifica], [tpdi_FechaModifica], [tpdi_Activo]) VALUES (161, 1, 2, 1, CAST(N'2019-11-11T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleIngreso] ([tpdi_IdDetallePlanillaIngreso], [cin_IdIngreso], [cpla_IdPlanilla], [tpdi_UsuarioCrea], [tpdi_FechaCrea], [tpdi_UsuarioModifica], [tpdi_FechaModifica], [tpdi_Activo]) VALUES (162, 4, 2, 1, CAST(N'2019-11-11T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleIngreso] ([tpdi_IdDetallePlanillaIngreso], [cin_IdIngreso], [cpla_IdPlanilla], [tpdi_UsuarioCrea], [tpdi_FechaCrea], [tpdi_UsuarioModifica], [tpdi_FechaModifica], [tpdi_Activo]) VALUES (165, 26, 41, 1, CAST(N'2019-11-18T12:40:43.217' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleIngreso] ([tpdi_IdDetallePlanillaIngreso], [cin_IdIngreso], [cpla_IdPlanilla], [tpdi_UsuarioCrea], [tpdi_FechaCrea], [tpdi_UsuarioModifica], [tpdi_FechaModifica], [tpdi_Activo]) VALUES (167, 25, 40, 1, CAST(N'2019-11-18T14:00:54.000' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleIngreso] ([tpdi_IdDetallePlanillaIngreso], [cin_IdIngreso], [cpla_IdPlanilla], [tpdi_UsuarioCrea], [tpdi_FechaCrea], [tpdi_UsuarioModifica], [tpdi_FechaModifica], [tpdi_Activo]) VALUES (169, 50, 33, 1, CAST(N'2019-11-18T14:32:25.323' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleIngreso] ([tpdi_IdDetallePlanillaIngreso], [cin_IdIngreso], [cpla_IdPlanilla], [tpdi_UsuarioCrea], [tpdi_FechaCrea], [tpdi_UsuarioModifica], [tpdi_FechaModifica], [tpdi_Activo]) VALUES (170, 51, 33, 1, CAST(N'2019-11-18T14:32:25.583' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleIngreso] ([tpdi_IdDetallePlanillaIngreso], [cin_IdIngreso], [cpla_IdPlanilla], [tpdi_UsuarioCrea], [tpdi_FechaCrea], [tpdi_UsuarioModifica], [tpdi_FechaModifica], [tpdi_Activo]) VALUES (171, 26, 38, 1, CAST(N'2019-11-18T15:29:40.393' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleIngreso] ([tpdi_IdDetallePlanillaIngreso], [cin_IdIngreso], [cpla_IdPlanilla], [tpdi_UsuarioCrea], [tpdi_FechaCrea], [tpdi_UsuarioModifica], [tpdi_FechaModifica], [tpdi_Activo]) VALUES (172, 25, 38, 1, CAST(N'2019-11-18T21:01:48.750' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleIngreso] ([tpdi_IdDetallePlanillaIngreso], [cin_IdIngreso], [cpla_IdPlanilla], [tpdi_UsuarioCrea], [tpdi_FechaCrea], [tpdi_UsuarioModifica], [tpdi_FechaModifica], [tpdi_Activo]) VALUES (173, 52, 38, 1, CAST(N'2019-11-18T21:01:49.100' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleIngreso] ([tpdi_IdDetallePlanillaIngreso], [cin_IdIngreso], [cpla_IdPlanilla], [tpdi_UsuarioCrea], [tpdi_FechaCrea], [tpdi_UsuarioModifica], [tpdi_FechaModifica], [tpdi_Activo]) VALUES (174, 55, 38, 1, CAST(N'2019-11-18T21:01:49.427' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleIngreso] ([tpdi_IdDetallePlanillaIngreso], [cin_IdIngreso], [cpla_IdPlanilla], [tpdi_UsuarioCrea], [tpdi_FechaCrea], [tpdi_UsuarioModifica], [tpdi_FechaModifica], [tpdi_Activo]) VALUES (175, 25, 37, 1, CAST(N'2019-11-18T21:03:45.487' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleIngreso] ([tpdi_IdDetallePlanillaIngreso], [cin_IdIngreso], [cpla_IdPlanilla], [tpdi_UsuarioCrea], [tpdi_FechaCrea], [tpdi_UsuarioModifica], [tpdi_FechaModifica], [tpdi_Activo]) VALUES (176, 26, 37, 1, CAST(N'2019-11-18T21:03:45.673' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleIngreso] ([tpdi_IdDetallePlanillaIngreso], [cin_IdIngreso], [cpla_IdPlanilla], [tpdi_UsuarioCrea], [tpdi_FechaCrea], [tpdi_UsuarioModifica], [tpdi_FechaModifica], [tpdi_Activo]) VALUES (177, 52, 37, 1, CAST(N'2019-11-18T21:03:46.103' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleIngreso] ([tpdi_IdDetallePlanillaIngreso], [cin_IdIngreso], [cpla_IdPlanilla], [tpdi_UsuarioCrea], [tpdi_FechaCrea], [tpdi_UsuarioModifica], [tpdi_FechaModifica], [tpdi_Activo]) VALUES (178, 55, 37, 1, CAST(N'2019-11-18T21:03:46.567' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleIngreso] ([tpdi_IdDetallePlanillaIngreso], [cin_IdIngreso], [cpla_IdPlanilla], [tpdi_UsuarioCrea], [tpdi_FechaCrea], [tpdi_UsuarioModifica], [tpdi_FechaModifica], [tpdi_Activo]) VALUES (179, 26, 36, 1, CAST(N'2019-11-18T21:05:24.057' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleIngreso] ([tpdi_IdDetallePlanillaIngreso], [cin_IdIngreso], [cpla_IdPlanilla], [tpdi_UsuarioCrea], [tpdi_FechaCrea], [tpdi_UsuarioModifica], [tpdi_FechaModifica], [tpdi_Activo]) VALUES (180, 55, 36, 1, CAST(N'2019-11-18T21:05:24.587' AS DateTime), NULL, NULL, 1)
INSERT [Plani].[tbTipoPlanillaDetalleIngreso] ([tpdi_IdDetallePlanillaIngreso], [cin_IdIngreso], [cpla_IdPlanilla], [tpdi_UsuarioCrea], [tpdi_FechaCrea], [tpdi_UsuarioModifica], [tpdi_FechaModifica], [tpdi_Activo]) VALUES (181, 56, 36, 1, CAST(N'2019-11-18T21:05:25.637' AS DateTime), NULL, NULL, 1)
INSERT [rrhh].[tbAreas] ([area_Id], [car_Id], [suc_Id], [area_Descripcion], [area_Estado], [area_Razoninactivo], [area_Usuariocrea], [area_Fechacrea], [area_Usuariomodifica], [area_Fechamodifica]) VALUES (1, 1, 1, N'informatica', 1, NULL, 1, CAST(N'2019-11-13T09:50:35.100' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbCargos] ([car_Id], [car_Descripcion], [car_Estado], [car_RazonInactivo], [car_UsuarioCrea], [car_FechaCrea], [car_UsuarioModifica], [car_FechaModifica]) VALUES (1, N'jefe editado', 1, NULL, 1, CAST(N'2019-11-13T09:49:05.190' AS DateTime), 2, CAST(N'2019-11-18T09:09:38.173' AS DateTime))
INSERT [rrhh].[tbCargos] ([car_Id], [car_Descripcion], [car_Estado], [car_RazonInactivo], [car_UsuarioCrea], [car_FechaCrea], [car_UsuarioModifica], [car_FechaModifica]) VALUES (2, N'probando', 1, NULL, 1, CAST(N'2019-11-18T08:36:36.273' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbCompetencias] ([comp_Id], [comp_Descripcion], [comp_Estado], [comp_RazonInactivo], [comp_UsuarioCrea], [comp_FechaCrea], [comp_UsuarioModifica], [comp_FechaModifica]) VALUES (1, N'flexible', 1, NULL, 1, CAST(N'2019-11-14T16:44:54.650' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbCompetencias] ([comp_Id], [comp_Descripcion], [comp_Estado], [comp_RazonInactivo], [comp_UsuarioCrea], [comp_FechaCrea], [comp_UsuarioModifica], [comp_FechaModifica]) VALUES (2, N'habilidoso', 0, NULL, 1, CAST(N'2019-11-14T16:45:09.117' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbCompetencias] ([comp_Id], [comp_Descripcion], [comp_Estado], [comp_RazonInactivo], [comp_UsuarioCrea], [comp_FechaCrea], [comp_UsuarioModifica], [comp_FechaModifica]) VALUES (3, N'trabaja en equipo', 1, NULL, 1, CAST(N'2019-11-14T16:45:20.413' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbCompetencias] ([comp_Id], [comp_Descripcion], [comp_Estado], [comp_RazonInactivo], [comp_UsuarioCrea], [comp_FechaCrea], [comp_UsuarioModifica], [comp_FechaModifica]) VALUES (4, N'autodidacta actualizado', 1, NULL, 1, CAST(N'2019-11-18T10:23:49.937' AS DateTime), 2, CAST(N'2019-11-18T10:53:23.533' AS DateTime))
INSERT [rrhh].[tbDepartamentos] ([depto_Id], [area_Id], [car_Id], [depto_Descripcion], [depto_Estado], [depto_RazonInactivo], [depto_UsuarioCrea], [depto_Fechacrea], [depto_UsuarioModifica], [depto_FechaModifica]) VALUES (1, 1, 1, N'it', 1, N'1', 1, CAST(N'2019-11-13T09:50:38.173' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbEmpleados] ([emp_Id], [per_Id], [car_Id], [area_Id], [depto_Id], [jor_Id], [cpla_IdPlanilla], [fpa_IdFormaPago], [emp_CuentaBancaria], [emp_Reingreso], [emp_Fechaingreso], [emp_RazonSalida], [emp_CargoAnterior], [emp_FechaDeSalida], [emp_Estado], [emp_RazonInactivo], [emp_UsuarioCrea], [emp_FechaCrea], [emp_UsuarioModifica], [emp_FechaModifica]) VALUES (1, 1, 1, 1, 1, 1, 2, 1, N'yonose', 0, CAST(N'2019-11-13T09:54:25.513' AS DateTime), NULL, NULL, NULL, 1, NULL, 1, CAST(N'2019-11-13T09:54:25.513' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbEmpleados] ([emp_Id], [per_Id], [car_Id], [area_Id], [depto_Id], [jor_Id], [cpla_IdPlanilla], [fpa_IdFormaPago], [emp_CuentaBancaria], [emp_Reingreso], [emp_Fechaingreso], [emp_RazonSalida], [emp_CargoAnterior], [emp_FechaDeSalida], [emp_Estado], [emp_RazonInactivo], [emp_UsuarioCrea], [emp_FechaCrea], [emp_UsuarioModifica], [emp_FechaModifica]) VALUES (2, 2, 1, 1, 1, 1, 2, 1, N'yonose', 0, CAST(N'2019-11-13T09:54:25.513' AS DateTime), NULL, NULL, NULL, 1, NULL, 1, CAST(N'2019-11-13T09:54:25.513' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbEmpleados] ([emp_Id], [per_Id], [car_Id], [area_Id], [depto_Id], [jor_Id], [cpla_IdPlanilla], [fpa_IdFormaPago], [emp_CuentaBancaria], [emp_Reingreso], [emp_Fechaingreso], [emp_RazonSalida], [emp_CargoAnterior], [emp_FechaDeSalida], [emp_Estado], [emp_RazonInactivo], [emp_UsuarioCrea], [emp_FechaCrea], [emp_UsuarioModifica], [emp_FechaModifica]) VALUES (3, 3, 1, 1, 1, 1, 2, 1, N'yonose', 0, CAST(N'2019-11-13T09:54:25.513' AS DateTime), NULL, NULL, NULL, 1, NULL, 1, CAST(N'2019-11-13T09:54:25.513' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbEmpleados] ([emp_Id], [per_Id], [car_Id], [area_Id], [depto_Id], [jor_Id], [cpla_IdPlanilla], [fpa_IdFormaPago], [emp_CuentaBancaria], [emp_Reingreso], [emp_Fechaingreso], [emp_RazonSalida], [emp_CargoAnterior], [emp_FechaDeSalida], [emp_Estado], [emp_RazonInactivo], [emp_UsuarioCrea], [emp_FechaCrea], [emp_UsuarioModifica], [emp_FechaModifica]) VALUES (4, 4, 1, 1, 1, 1, 2, 1, N'yonose', 0, CAST(N'2019-11-13T09:54:25.513' AS DateTime), NULL, NULL, NULL, 1, NULL, 1, CAST(N'2019-11-13T09:54:25.513' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbEmpleados] ([emp_Id], [per_Id], [car_Id], [area_Id], [depto_Id], [jor_Id], [cpla_IdPlanilla], [fpa_IdFormaPago], [emp_CuentaBancaria], [emp_Reingreso], [emp_Fechaingreso], [emp_RazonSalida], [emp_CargoAnterior], [emp_FechaDeSalida], [emp_Estado], [emp_RazonInactivo], [emp_UsuarioCrea], [emp_FechaCrea], [emp_UsuarioModifica], [emp_FechaModifica]) VALUES (5, 5, 1, 1, 1, 1, 2, 1, N'yonose', 0, CAST(N'2019-11-13T09:54:25.513' AS DateTime), NULL, NULL, NULL, 1, NULL, 1, CAST(N'2019-11-13T09:54:25.513' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbEmpleados] ([emp_Id], [per_Id], [car_Id], [area_Id], [depto_Id], [jor_Id], [cpla_IdPlanilla], [fpa_IdFormaPago], [emp_CuentaBancaria], [emp_Reingreso], [emp_Fechaingreso], [emp_RazonSalida], [emp_CargoAnterior], [emp_FechaDeSalida], [emp_Estado], [emp_RazonInactivo], [emp_UsuarioCrea], [emp_FechaCrea], [emp_UsuarioModifica], [emp_FechaModifica]) VALUES (6, 6, 1, 1, 1, 1, 2, 1, N'yonose', 0, CAST(N'2019-11-13T09:54:25.513' AS DateTime), NULL, NULL, NULL, 1, NULL, 1, CAST(N'2019-11-13T09:54:25.513' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbEmpresas] ([empr_Id], [empr_Nombre], [empr_Estado], [empr_RazonInactivo], [empr_UsuarioCrea], [empr_FechaCrea], [empr_UsuarioModifica], [empr_FechaModifica]) VALUES (1, N'ojojona', 1, NULL, 1, CAST(N'2019-11-13T09:49:35.000' AS DateTime), 0, NULL)
INSERT [rrhh].[tbEmpresas] ([empr_Id], [empr_Nombre], [empr_Estado], [empr_RazonInactivo], [empr_UsuarioCrea], [empr_FechaCrea], [empr_UsuarioModifica], [empr_FechaModifica]) VALUES (2, N'AHM', 1, NULL, 1, CAST(N'2019-11-17T18:06:22.600' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbEmpresas] ([empr_Id], [empr_Nombre], [empr_Estado], [empr_RazonInactivo], [empr_UsuarioCrea], [empr_FechaCrea], [empr_UsuarioModifica], [empr_FechaModifica]) VALUES (3, N'BI-DSS', 1, NULL, 1, CAST(N'2019-11-17T18:07:06.397' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbEquipoEmpleados] ([eqem_Id], [emp_Id], [eqtra_Id], [eqem_Fecha], [eqem_Estado], [eqem_RazonInactivo], [eqem_UsuarioCrea], [eqem_FechaCrea], [eqem_UsuarioModifica], [eqem_FechaModifica]) VALUES (1, 1, 1, CAST(N'2019-11-12T00:00:00.000' AS DateTime), 1, NULL, 1, CAST(N'2019-11-14T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbEquipoEmpleados] ([eqem_Id], [emp_Id], [eqtra_Id], [eqem_Fecha], [eqem_Estado], [eqem_RazonInactivo], [eqem_UsuarioCrea], [eqem_FechaCrea], [eqem_UsuarioModifica], [eqem_FechaModifica]) VALUES (2, 3, 2, CAST(N'2019-11-10T00:00:00.000' AS DateTime), 1, NULL, 3, CAST(N'2019-11-14T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbEquipoEmpleados] ([eqem_Id], [emp_Id], [eqtra_Id], [eqem_Fecha], [eqem_Estado], [eqem_RazonInactivo], [eqem_UsuarioCrea], [eqem_FechaCrea], [eqem_UsuarioModifica], [eqem_FechaModifica]) VALUES (3, 5, 3, CAST(N'2019-11-08T00:00:00.000' AS DateTime), 1, NULL, 7, CAST(N'2019-11-14T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbEquipoTrabajo] ([eqtra_Id], [eqtra_Codigo], [eqtra_Descripcion], [eqtra_Observacion], [eqtra_Estado], [eqtra_RazonInactivo], [eqtra_UsuarioCrea], [eqtra_FechaCrea], [eqtra_UsuarioModifica], [eqtra_FechaModifica]) VALUES (1, N'HD03', N'Disco Duro', N'1TB', 1, NULL, 1, CAST(N'2019-11-11T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbEquipoTrabajo] ([eqtra_Id], [eqtra_Codigo], [eqtra_Descripcion], [eqtra_Observacion], [eqtra_Estado], [eqtra_RazonInactivo], [eqtra_UsuarioCrea], [eqtra_FechaCrea], [eqtra_UsuarioModifica], [eqtra_FechaModifica]) VALUES (2, N'HQ07', N'Cable', N'VGA', 1, NULL, 3, CAST(N'2019-11-11T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbEquipoTrabajo] ([eqtra_Id], [eqtra_Codigo], [eqtra_Descripcion], [eqtra_Observacion], [eqtra_Estado], [eqtra_RazonInactivo], [eqtra_UsuarioCrea], [eqtra_FechaCrea], [eqtra_UsuarioModifica], [eqtra_FechaModifica]) VALUES (3, N'HZ05', N'Memoria USB', N'4GB', 1, NULL, 7, CAST(N'2019-11-11T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbEquipoTrabajo] ([eqtra_Id], [eqtra_Codigo], [eqtra_Descripcion], [eqtra_Observacion], [eqtra_Estado], [eqtra_RazonInactivo], [eqtra_UsuarioCrea], [eqtra_FechaCrea], [eqtra_UsuarioModifica], [eqtra_FechaModifica]) VALUES (4, N'JHS70', N'Equipo 2', N'Observación', 0, N'Observación', 1, CAST(N'2019-11-18T00:00:00.000' AS DateTime), 1, CAST(N'2019-11-18T00:00:00.000' AS DateTime))
INSERT [rrhh].[tbEquipoTrabajo] ([eqtra_Id], [eqtra_Codigo], [eqtra_Descripcion], [eqtra_Observacion], [eqtra_Estado], [eqtra_RazonInactivo], [eqtra_UsuarioCrea], [eqtra_FechaCrea], [eqtra_UsuarioModifica], [eqtra_FechaModifica]) VALUES (5, N'JFD40', N'Computadora', N'HP PRO', 1, NULL, 1, CAST(N'2019-11-18T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbFaseSeleccion] ([fsel_Id], [fare_Id], [fsel_Fecha], [fsel_Estado], [fsel_RazonInactivo], [fsel_UsuarioCrea], [fsel_FechaCrea], [fsel_UsuarioModifica], [fsel_FechaModifica]) VALUES (1, 1, CAST(N'2019-11-14T17:25:08.110' AS DateTime), 1, NULL, 1, CAST(N'2019-11-14T17:25:08.110' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbFasesReclutamiento] ([fare_Id], [fare_Descripcion], [fare_Estado], [fare_RazonInactivo], [fare_UsuarioCrea], [fare_FechaCrea], [fare_UsuarioModifica], [fare_FechaModifica]) VALUES (1, N'Fase 1', 1, NULL, 1, CAST(N'2019-11-14T17:24:27.437' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbHabilidades] ([habi_Id], [habi_Descripcion], [habi_Estado], [habi_RazonInactivo], [habi_UsuarioCrea], [habi_FechaCrea], [habi_UsuarioModifica], [habi_FechaModifica]) VALUES (1, N'Activo', 1, NULL, 1, CAST(N'2019-11-18T11:07:16.217' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbHabilidades] ([habi_Id], [habi_Descripcion], [habi_Estado], [habi_RazonInactivo], [habi_UsuarioCrea], [habi_FechaCrea], [habi_UsuarioModifica], [habi_FechaModifica]) VALUES (2, N'Dinamico', 1, NULL, 1, CAST(N'2019-11-18T11:07:24.383' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbHabilidades] ([habi_Id], [habi_Descripcion], [habi_Estado], [habi_RazonInactivo], [habi_UsuarioCrea], [habi_FechaCrea], [habi_UsuarioModifica], [habi_FechaModifica]) VALUES (3, N'Responsable', 1, NULL, 1, CAST(N'2019-11-18T11:07:31.837' AS DateTime), 1, CAST(N'2019-11-18T11:07:37.367' AS DateTime))
INSERT [rrhh].[tbHabilidades] ([habi_Id], [habi_Descripcion], [habi_Estado], [habi_RazonInactivo], [habi_UsuarioCrea], [habi_FechaCrea], [habi_UsuarioModifica], [habi_FechaModifica]) VALUES (4, N'cortesia', 0, N'por que era prueba', 1, CAST(N'2019-11-18T22:02:55.670' AS DateTime), 1, CAST(N'2019-11-18T22:35:37.043' AS DateTime))
INSERT [rrhh].[tbIdiomas] ([idi_Id], [idi_Descripcion], [idi_Estado], [idi_RazonInactivo], [idi_UsuarioCrea], [idi_FechaCrea], [idi_UsuarioModifica], [idi_FechaModifica]) VALUES (1, N'Español', 1, NULL, 1, CAST(N'2019-11-14T16:27:43.477' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbIdiomas] ([idi_Id], [idi_Descripcion], [idi_Estado], [idi_RazonInactivo], [idi_UsuarioCrea], [idi_FechaCrea], [idi_UsuarioModifica], [idi_FechaModifica]) VALUES (2, N'Ingles Allan', 1, NULL, 2, CAST(N'2019-11-18T07:58:35.870' AS DateTime), 7, CAST(N'2019-11-18T08:18:01.650' AS DateTime))
INSERT [rrhh].[tbIdiomas] ([idi_Id], [idi_Descripcion], [idi_Estado], [idi_RazonInactivo], [idi_UsuarioCrea], [idi_FechaCrea], [idi_UsuarioModifica], [idi_FechaModifica]) VALUES (3, N'Franceses', 1, NULL, 2, CAST(N'2019-11-18T09:56:29.497' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbJornadas] ([jor_Id], [jor_Descripcion], [jor_Estado], [jor_RazonInactivo], [jor_UsuarioCrea], [jor_FechaCrea], [jor_UsuarioModifica], [jor_FechaModifica]) VALUES (1, N'Vespertina- Editado', 1, NULL, 1, CAST(N'2019-11-13T09:50:41.520' AS DateTime), 1, CAST(N'2019-11-18T00:00:00.000' AS DateTime))
INSERT [rrhh].[tbJornadas] ([jor_Id], [jor_Descripcion], [jor_Estado], [jor_RazonInactivo], [jor_UsuarioCrea], [jor_FechaCrea], [jor_UsuarioModifica], [jor_FechaModifica]) VALUES (2, N'Matituina', 1, NULL, 1, CAST(N'2019-11-18T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbJornadas] ([jor_Id], [jor_Descripcion], [jor_Estado], [jor_RazonInactivo], [jor_UsuarioCrea], [jor_FechaCrea], [jor_UsuarioModifica], [jor_FechaModifica]) VALUES (3, N'Nocturna', 1, NULL, 2, CAST(N'2019-11-18T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbJornadas] ([jor_Id], [jor_Descripcion], [jor_Estado], [jor_RazonInactivo], [jor_UsuarioCrea], [jor_FechaCrea], [jor_UsuarioModifica], [jor_FechaModifica]) VALUES (4, N'Noche', 0, N'No exite esta Jornada', 2, CAST(N'2019-11-18T00:00:00.000' AS DateTime), 1, CAST(N'2019-11-18T00:00:00.000' AS DateTime))
INSERT [rrhh].[tbJornadas] ([jor_Id], [jor_Descripcion], [jor_Estado], [jor_RazonInactivo], [jor_UsuarioCrea], [jor_FechaCrea], [jor_UsuarioModifica], [jor_FechaModifica]) VALUES (5, N'Diurna', 1, NULL, 1, CAST(N'2015-12-17T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbNacionalidades] ([nac_Id], [nac_Descripcion], [nac_Estado], [nac_RazonInactivo], [nac_UsuarioCrea], [nac_FechaCrea], [nac_UsuarioModifica], [nac_FechaModifica]) VALUES (1, N'Hondureñaaa', 1, NULL, 1, CAST(N'2019-11-13T09:50:41.520' AS DateTime), 1, CAST(N'2019-11-18T00:00:00.000' AS DateTime))
INSERT [rrhh].[tbNacionalidades] ([nac_Id], [nac_Descripcion], [nac_Estado], [nac_RazonInactivo], [nac_UsuarioCrea], [nac_FechaCrea], [nac_UsuarioModifica], [nac_FechaModifica]) VALUES (2, N'Nicaraguense', 1, NULL, 2, CAST(N'2019-11-15T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbNacionalidades] ([nac_Id], [nac_Descripcion], [nac_Estado], [nac_RazonInactivo], [nac_UsuarioCrea], [nac_FechaCrea], [nac_UsuarioModifica], [nac_FechaModifica]) VALUES (3, N'Guatemalteco', 0, N'Observación', 3, CAST(N'2019-11-15T00:00:00.000' AS DateTime), 0, NULL)
INSERT [rrhh].[tbNacionalidades] ([nac_Id], [nac_Descripcion], [nac_Estado], [nac_RazonInactivo], [nac_UsuarioCrea], [nac_FechaCrea], [nac_UsuarioModifica], [nac_FechaModifica]) VALUES (4, N'Mexicana', 1, NULL, 3, CAST(N'2019-11-15T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbNacionalidades] ([nac_Id], [nac_Descripcion], [nac_Estado], [nac_RazonInactivo], [nac_UsuarioCrea], [nac_FechaCrea], [nac_UsuarioModifica], [nac_FechaModifica]) VALUES (5, N'Salvadoreñaaaa', 1, NULL, 3, CAST(N'2019-11-15T00:00:00.000' AS DateTime), 0, NULL)
INSERT [rrhh].[tbNacionalidades] ([nac_Id], [nac_Descripcion], [nac_Estado], [nac_RazonInactivo], [nac_UsuarioCrea], [nac_FechaCrea], [nac_UsuarioModifica], [nac_FechaModifica]) VALUES (6, N'Estadounidense', 1, NULL, 3, CAST(N'2019-11-15T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbNacionalidades] ([nac_Id], [nac_Descripcion], [nac_Estado], [nac_RazonInactivo], [nac_UsuarioCrea], [nac_FechaCrea], [nac_UsuarioModifica], [nac_FechaModifica]) VALUES (7, N'Panameña', 0, N'Observación', 3, CAST(N'2019-11-15T00:00:00.000' AS DateTime), 3, CAST(N'2019-11-15T00:00:00.000' AS DateTime))
INSERT [rrhh].[tbNacionalidades] ([nac_Id], [nac_Descripcion], [nac_Estado], [nac_RazonInactivo], [nac_UsuarioCrea], [nac_FechaCrea], [nac_UsuarioModifica], [nac_FechaModifica]) VALUES (8, N'Costarricense', 0, N'Observación', 7, CAST(N'2019-11-15T00:00:00.000' AS DateTime), 3, CAST(N'2019-11-15T00:00:00.000' AS DateTime))
INSERT [rrhh].[tbNacionalidades] ([nac_Id], [nac_Descripcion], [nac_Estado], [nac_RazonInactivo], [nac_UsuarioCrea], [nac_FechaCrea], [nac_UsuarioModifica], [nac_FechaModifica]) VALUES (9, N'Árabe', 1, NULL, 3, CAST(N'2019-11-15T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbNacionalidades] ([nac_Id], [nac_Descripcion], [nac_Estado], [nac_RazonInactivo], [nac_UsuarioCrea], [nac_FechaCrea], [nac_UsuarioModifica], [nac_FechaModifica]) VALUES (10, N'Hindú', 1, NULL, 3, CAST(N'2019-11-18T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbNacionalidades] ([nac_Id], [nac_Descripcion], [nac_Estado], [nac_RazonInactivo], [nac_UsuarioCrea], [nac_FechaCrea], [nac_UsuarioModifica], [nac_FechaModifica]) VALUES (11, N'Pakistani', 0, N'Observación', 2, CAST(N'2019-11-18T00:00:00.000' AS DateTime), 3, CAST(N'2019-11-18T00:00:00.000' AS DateTime))
INSERT [rrhh].[tbNacionalidades] ([nac_Id], [nac_Descripcion], [nac_Estado], [nac_RazonInactivo], [nac_UsuarioCrea], [nac_FechaCrea], [nac_UsuarioModifica], [nac_FechaModifica]) VALUES (12, N'Italiana editado', 1, NULL, 1, CAST(N'2019-11-18T00:00:00.000' AS DateTime), 2, CAST(N'2019-11-18T00:00:00.000' AS DateTime))
INSERT [rrhh].[tbPersonas] ([per_Id], [per_Identidad], [per_Nombres], [per_Apellidos], [per_FechaNacimiento], [per_Sexo], [per_Edad], [nac_Id], [per_Direccion], [per_Telefono], [per_CorreoElectronico], [per_EstadoCivil], [per_TipoSangre], [per_Estado], [per_RazonInactivo], [per_UsuarioCrea], [per_FechaCrea], [per_UsuarioModifica], [per_FechaModifica]) VALUES (1, N'0501200008767', N'keneth', N'sanchez', CAST(N'2019-11-13' AS Date), N'm', 18, 1, N'cabanas', N'96309376', N'kjsm200022@gmail.com', N's', N'o+', 1, NULL, 1, CAST(N'2019-11-13T09:53:24.983' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbPersonas] ([per_Id], [per_Identidad], [per_Nombres], [per_Apellidos], [per_FechaNacimiento], [per_Sexo], [per_Edad], [nac_Id], [per_Direccion], [per_Telefono], [per_CorreoElectronico], [per_EstadoCivil], [per_TipoSangre], [per_Estado], [per_RazonInactivo], [per_UsuarioCrea], [per_FechaCrea], [per_UsuarioModifica], [per_FechaModifica]) VALUES (2, N'0501500008767', N'A', N'sanchez', CAST(N'2019-11-13' AS Date), N'm', 18, 1, N'cabanas', N'96309376', N'a@gmail.com', N's', N'o+', 1, NULL, 1, CAST(N'2019-11-13T09:53:24.983' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbPersonas] ([per_Id], [per_Identidad], [per_Nombres], [per_Apellidos], [per_FechaNacimiento], [per_Sexo], [per_Edad], [nac_Id], [per_Direccion], [per_Telefono], [per_CorreoElectronico], [per_EstadoCivil], [per_TipoSangre], [per_Estado], [per_RazonInactivo], [per_UsuarioCrea], [per_FechaCrea], [per_UsuarioModifica], [per_FechaModifica]) VALUES (3, N'0501200808767', N'B', N'sanchez', CAST(N'2019-11-13' AS Date), N'm', 18, 1, N'cabanas', N'96309376', N'b@gmail.com', N's', N'o+', 1, NULL, 1, CAST(N'2019-11-13T09:53:24.983' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbPersonas] ([per_Id], [per_Identidad], [per_Nombres], [per_Apellidos], [per_FechaNacimiento], [per_Sexo], [per_Edad], [nac_Id], [per_Direccion], [per_Telefono], [per_CorreoElectronico], [per_EstadoCivil], [per_TipoSangre], [per_Estado], [per_RazonInactivo], [per_UsuarioCrea], [per_FechaCrea], [per_UsuarioModifica], [per_FechaModifica]) VALUES (4, N'0501209008767', N'C', N'sanchez', CAST(N'2019-11-13' AS Date), N'm', 18, 1, N'cabanas', N'96309376', N'c@gmail.com', N's', N'o+', 1, NULL, 1, CAST(N'2019-11-13T09:53:24.983' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbPersonas] ([per_Id], [per_Identidad], [per_Nombres], [per_Apellidos], [per_FechaNacimiento], [per_Sexo], [per_Edad], [nac_Id], [per_Direccion], [per_Telefono], [per_CorreoElectronico], [per_EstadoCivil], [per_TipoSangre], [per_Estado], [per_RazonInactivo], [per_UsuarioCrea], [per_FechaCrea], [per_UsuarioModifica], [per_FechaModifica]) VALUES (5, N'0501200009767', N'D', N'sanchez', CAST(N'2019-11-13' AS Date), N'm', 18, 1, N'cabanas', N'96309376', N'd@gmail.com', N's', N'o+', 1, NULL, 1, CAST(N'2019-11-13T09:53:24.983' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbPersonas] ([per_Id], [per_Identidad], [per_Nombres], [per_Apellidos], [per_FechaNacimiento], [per_Sexo], [per_Edad], [nac_Id], [per_Direccion], [per_Telefono], [per_CorreoElectronico], [per_EstadoCivil], [per_TipoSangre], [per_Estado], [per_RazonInactivo], [per_UsuarioCrea], [per_FechaCrea], [per_UsuarioModifica], [per_FechaModifica]) VALUES (6, N'0591200008767', N'E', N'sanchez', CAST(N'2019-11-13' AS Date), N'm', 18, 1, N'cabanas', N'96309376', N'e@gmail.com', N's', N'o+', 1, NULL, 1, CAST(N'2019-11-13T09:53:24.983' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbRazonSalidas] ([rsal_Id], [rsal_Descripcion], [rsal_Estado], [rsal_RazonInactivo], [rsal_UsuarioCrea], [rsal_FechaCrea], [rsal_UsuarioModifica], [rsal_FechaModifica]) VALUES (1, N'Despido', 1, NULL, 1, CAST(N'2019-11-18T17:28:09.903' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbSucursales] ([suc_Id], [empr_Id], [mun_Codigo], [bod_Id], [pemi_Id], [suc_Descripcion], [suc_Correo], [suc_Direccion], [suc_Telefono], [suc_Estado], [suc_RazonInactivo], [suc_UsuarioCrea], [suc_FechaCrea], [suc_UsuarioModifica], [suc_FechaModifica]) VALUES (1, 1, N'1   ', 1, 1, N'sucursal1', N'sucursal1@gmail.com', N'segundacalesps', N'99887711', 1, N'1', 1, CAST(N'2019-11-13T09:50:31.273' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbSueldos] ([sue_Id], [emp_Id], [tmon_Id], [sue_Cantidad], [sue_SueldoAnterior], [sue_Estado], [sue_RazonInactivo], [sue_UsuarioCrea], [sue_FechaCrea], [ue_UsuarioModifica], [sue_FechaModifica]) VALUES (1, 2, 1, CAST(1000.0000 AS Decimal(8, 4)), NULL, 1, NULL, 1, CAST(N'2019-11-11T00:00:00.000' AS DateTime), 1, CAST(N'2019-11-11T00:00:00.000' AS DateTime))
INSERT [rrhh].[tbSueldos] ([sue_Id], [emp_Id], [tmon_Id], [sue_Cantidad], [sue_SueldoAnterior], [sue_Estado], [sue_RazonInactivo], [sue_UsuarioCrea], [sue_FechaCrea], [ue_UsuarioModifica], [sue_FechaModifica]) VALUES (2, 3, 1, CAST(5000.0000 AS Decimal(8, 4)), NULL, 1, NULL, 1, CAST(N'2019-11-11T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbSueldos] ([sue_Id], [emp_Id], [tmon_Id], [sue_Cantidad], [sue_SueldoAnterior], [sue_Estado], [sue_RazonInactivo], [sue_UsuarioCrea], [sue_FechaCrea], [ue_UsuarioModifica], [sue_FechaModifica]) VALUES (3, 4, 1, CAST(9000.0000 AS Decimal(8, 4)), NULL, 1, NULL, 1, CAST(N'2019-11-11T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbTipoAmonestaciones] ([tamo_Id], [tamo_Descripcion], [tamo_Estado], [tamo_RazonInactivo], [tamo_UsuarioCrea], [tamo_FechaCrea], [tamo_UsuarioModifica], [tamo_FechaModifica]) VALUES (1, N'Verbal- Escrito', 0, NULL, 1, CAST(N'2019-11-14T00:00:00.000' AS DateTime), 0, CAST(N'2019-11-15T07:49:45.000' AS DateTime))
INSERT [rrhh].[tbTipoAmonestaciones] ([tamo_Id], [tamo_Descripcion], [tamo_Estado], [tamo_RazonInactivo], [tamo_UsuarioCrea], [tamo_FechaCrea], [tamo_UsuarioModifica], [tamo_FechaModifica]) VALUES (2, N'Escritos', 0, NULL, 2, CAST(N'2019-11-14T00:00:00.000' AS DateTime), 0, CAST(N'2019-11-15T09:56:45.000' AS DateTime))
INSERT [rrhh].[tbTipoAmonestaciones] ([tamo_Id], [tamo_Descripcion], [tamo_Estado], [tamo_RazonInactivo], [tamo_UsuarioCrea], [tamo_FechaCrea], [tamo_UsuarioModifica], [tamo_FechaModifica]) VALUES (3, N'Verbal', 0, NULL, 7, CAST(N'2019-11-18T00:00:00.000' AS DateTime), 1, CAST(N'2019-11-18T07:49:45.000' AS DateTime))
INSERT [rrhh].[tbTipoAmonestaciones] ([tamo_Id], [tamo_Descripcion], [tamo_Estado], [tamo_RazonInactivo], [tamo_UsuarioCrea], [tamo_FechaCrea], [tamo_UsuarioModifica], [tamo_FechaModifica]) VALUES (4, N'Escrito', 1, NULL, 1, CAST(N'2019-11-18T10:19:39.033' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbTipoAmonestaciones] ([tamo_Id], [tamo_Descripcion], [tamo_Estado], [tamo_RazonInactivo], [tamo_UsuarioCrea], [tamo_FechaCrea], [tamo_UsuarioModifica], [tamo_FechaModifica]) VALUES (5, N'Es', 1, NULL, 1, CAST(N'2019-11-18T10:20:47.570' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbTipoHoras] ([tiho_Id], [tiho_Descripcion], [tiho_Recargo], [tiho_Estado], [tiho_RazonInactivo], [tiho_UsuarioCrea], [tiho_FechaCrea], [tiho_UsuarioModifica], [tiho_FechaModifica]) VALUES (1, N'Horario Matutino', 50, 0, N'no es viable ', 1, CAST(N'2019-11-18T10:07:46.753' AS DateTime), 1, CAST(N'2019-11-18T10:33:10.207' AS DateTime))
INSERT [rrhh].[tbTipoHoras] ([tiho_Id], [tiho_Descripcion], [tiho_Recargo], [tiho_Estado], [tiho_RazonInactivo], [tiho_UsuarioCrea], [tiho_FechaCrea], [tiho_UsuarioModifica], [tiho_FechaModifica]) VALUES (2, N'Horario Noc', 90, 0, N'no me guto', 1, CAST(N'2019-11-18T10:16:15.133' AS DateTime), 1, CAST(N'2019-11-18T17:35:32.997' AS DateTime))
INSERT [rrhh].[tbTipoHoras] ([tiho_Id], [tiho_Descripcion], [tiho_Recargo], [tiho_Estado], [tiho_RazonInactivo], [tiho_UsuarioCrea], [tiho_FechaCrea], [tiho_UsuarioModifica], [tiho_FechaModifica]) VALUES (3, N'Horario Vesp', 30, 1, NULL, 1, CAST(N'2019-11-18T17:35:48.027' AS DateTime), 1, CAST(N'2019-11-19T07:33:27.287' AS DateTime))
INSERT [rrhh].[tbTipoHoras] ([tiho_Id], [tiho_Descripcion], [tiho_Recargo], [tiho_Estado], [tiho_RazonInactivo], [tiho_UsuarioCrea], [tiho_FechaCrea], [tiho_UsuarioModifica], [tiho_FechaModifica]) VALUES (4, N'dddd', 24, 0, N'no me guto ', 1, CAST(N'2019-11-18T18:15:23.107' AS DateTime), 1, CAST(N'2019-11-19T07:30:55.360' AS DateTime))
INSERT [rrhh].[tbTipoHoras] ([tiho_Id], [tiho_Descripcion], [tiho_Recargo], [tiho_Estado], [tiho_RazonInactivo], [tiho_UsuarioCrea], [tiho_FechaCrea], [tiho_UsuarioModifica], [tiho_FechaModifica]) VALUES (5, N'Horario Nocturno-Mixto', 59, 0, N'no me guto', 1, CAST(N'2019-11-19T07:31:21.340' AS DateTime), 1, CAST(N'2019-11-19T07:33:06.293' AS DateTime))
INSERT [rrhh].[tbTipoHoras] ([tiho_Id], [tiho_Descripcion], [tiho_Recargo], [tiho_Estado], [tiho_RazonInactivo], [tiho_UsuarioCrea], [tiho_FechaCrea], [tiho_UsuarioModifica], [tiho_FechaModifica]) VALUES (6, N'Horario', 40, 1, NULL, 1, CAST(N'2019-11-19T07:32:40.240' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbTipoIncapacidades] ([ticn_Id], [ticn_Descripcion], [ticn_Estado], [ticn_RazonInactivo], [ticn_UsuarioCrea], [ticn_FechaCrea], [ticn_UsuarioModifica], [ticn_FechaModifica]) VALUES (1, N'Incapacidad Temporal', 1, NULL, 1, CAST(N'2019-11-15T14:16:22.343' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbTipoMonedas] ([tmon_Id], [tmon_Descripcion], [tmon_Estado], [tmon_RazonInactivo], [tmon_UsuarioCrea], [tmon_FechaCrea], [tmon_UsuarioModifica], [tmon_FechaModifica]) VALUES (1, N'Lempiras', 1, NULL, 1, CAST(N'2019-11-11T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbTipoMonedas] ([tmon_Id], [tmon_Descripcion], [tmon_Estado], [tmon_RazonInactivo], [tmon_UsuarioCrea], [tmon_FechaCrea], [tmon_UsuarioModifica], [tmon_FechaModifica]) VALUES (2, N'Dolares', 1, NULL, 1, CAST(N'2019-11-11T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbTipoSalidas] ([tsal_Id], [tsal_Descripcion], [tsal_Estado], [tsal_RazonInactivo], [tsal_UsuarioCrea], [tsal_FechaCrea], [tsal_UsuarioModifica], [tsal_FechaModifica]) VALUES (1, N'excilio editado', 0, N'POR QUE SI', 1, CAST(N'2019-11-18T14:21:55.707' AS DateTime), 1, CAST(N'2019-11-18T14:21:55.000' AS DateTime))
INSERT [rrhh].[tbTipoSalidas] ([tsal_Id], [tsal_Descripcion], [tsal_Estado], [tsal_RazonInactivo], [tsal_UsuarioCrea], [tsal_FechaCrea], [tsal_UsuarioModifica], [tsal_FechaModifica]) VALUES (2, N'Tipo A', 1, NULL, 1, CAST(N'2019-11-18T14:21:55.707' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbTitulos] ([titu_Id], [titu_Descripcion], [titu_Estado], [titu_RazonInactivo], [titu_UsuarioCrea], [titu_FechaCrea], [titu_UsuarioModifica], [titu_FechaModifica]) VALUES (1, N'BTP INFORMATICA', 1, NULL, 1, CAST(N'2019-11-15T14:12:38.620' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbTitulos] ([titu_Id], [titu_Descripcion], [titu_Estado], [titu_RazonInactivo], [titu_UsuarioCrea], [titu_FechaCrea], [titu_UsuarioModifica], [titu_FechaModifica]) VALUES (2, N'Lic Informatica', 1, NULL, 7, CAST(N'2019-11-15T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [rrhh].[tbTitulos] ([titu_Id], [titu_Descripcion], [titu_Estado], [titu_RazonInactivo], [titu_UsuarioCrea], [titu_FechaCrea], [titu_UsuarioModifica], [titu_FechaModifica]) VALUES (3, N'Ing.Sistemas', 1, NULL, 7, CAST(N'2019-11-15T00:00:00.000' AS DateTime), NULL, NULL)
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Plani_tbDecimoTercerMes_dtm_CodigoPago]    Script Date: 19/11/2019 8:12:43 ******/
ALTER TABLE [Plani].[tbDecimoTercerMes] ADD  CONSTRAINT [UQ_Plani_tbDecimoTercerMes_dtm_CodigoPago] UNIQUE NONCLUSTERED 
(
	[dtm_CodigoPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_rrhh_tbAreas_suc_Id_area_Descripcion]    Script Date: 19/11/2019 8:12:43 ******/
ALTER TABLE [rrhh].[tbAreas] ADD  CONSTRAINT [UQ_rrhh_tbAreas_suc_Id_area_Descripcion] UNIQUE NONCLUSTERED 
(
	[suc_Id] ASC,
	[area_Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_rrhh_tbCargos_car_Descripcion]    Script Date: 19/11/2019 8:12:43 ******/
ALTER TABLE [rrhh].[tbCargos] ADD  CONSTRAINT [UQ_rrhh_tbCargos_car_Descripcion] UNIQUE NONCLUSTERED 
(
	[car_Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_RRHH_tbCompetencias_comp_Descripcion]    Script Date: 19/11/2019 8:12:43 ******/
ALTER TABLE [rrhh].[tbCompetencias] ADD  CONSTRAINT [UQ_RRHH_tbCompetencias_comp_Descripcion] UNIQUE NONCLUSTERED 
(
	[comp_Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ_RRHH_tbcompetenciasPersona_per_Id_comp_Id]    Script Date: 19/11/2019 8:12:43 ******/
ALTER TABLE [rrhh].[tbCompetenciasPersona] ADD  CONSTRAINT [UQ_RRHH_tbcompetenciasPersona_per_Id_comp_Id] UNIQUE NONCLUSTERED 
(
	[per_Id] ASC,
	[comp_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ_RRHH_tbCompetenciasRequisicion_comp_Id_req_Id]    Script Date: 19/11/2019 8:12:43 ******/
ALTER TABLE [rrhh].[tbCompetenciasRequisicion] ADD  CONSTRAINT [UQ_RRHH_tbCompetenciasRequisicion_comp_Id_req_Id] UNIQUE NONCLUSTERED 
(
	[req_Id] ASC,
	[comp_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_RRHH_tbDepartamentos_area_Id_depto_Descripcion]    Script Date: 19/11/2019 8:12:43 ******/
ALTER TABLE [rrhh].[tbDepartamentos] ADD  CONSTRAINT [UQ_RRHH_tbDepartamentos_area_Id_depto_Descripcion] UNIQUE NONCLUSTERED 
(
	[area_Id] ASC,
	[depto_Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ_rrhh_tbEmpleados_per_Id]    Script Date: 19/11/2019 8:12:43 ******/
ALTER TABLE [rrhh].[tbEmpleados] ADD  CONSTRAINT [UQ_rrhh_tbEmpleados_per_Id] UNIQUE NONCLUSTERED 
(
	[per_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_rrhh_tbEquipoTrabajo_eqtra_Descripcion]    Script Date: 19/11/2019 8:12:43 ******/
ALTER TABLE [rrhh].[tbEquipoTrabajo] ADD  CONSTRAINT [UQ_rrhh_tbEquipoTrabajo_eqtra_Descripcion] UNIQUE NONCLUSTERED 
(
	[eqtra_Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_rrhh_tbFasesReclutamiento_fare_Descripcion]    Script Date: 19/11/2019 8:12:43 ******/
ALTER TABLE [rrhh].[tbFasesReclutamiento] ADD  CONSTRAINT [UQ_rrhh_tbFasesReclutamiento_fare_Descripcion] UNIQUE NONCLUSTERED 
(
	[fare_Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_rrhh_tbHabilidades_habi_Descripcion]    Script Date: 19/11/2019 8:12:43 ******/
ALTER TABLE [rrhh].[tbHabilidades] ADD  CONSTRAINT [UQ_rrhh_tbHabilidades_habi_Descripcion] UNIQUE NONCLUSTERED 
(
	[habi_Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_rrhh_tbHorarios_hor_Descripcion]    Script Date: 19/11/2019 8:12:43 ******/
ALTER TABLE [rrhh].[tbHorarios] ADD  CONSTRAINT [UQ_rrhh_tbHorarios_hor_Descripcion] UNIQUE NONCLUSTERED 
(
	[hor_Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_rrhh_tbIdiomas_idi_Descripcion]    Script Date: 19/11/2019 8:12:43 ******/
ALTER TABLE [rrhh].[tbIdiomas] ADD  CONSTRAINT [UQ_rrhh_tbIdiomas_idi_Descripcion] UNIQUE NONCLUSTERED 
(
	[idi_Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_rrhh_tbJornadas_jor_Descripcion]    Script Date: 19/11/2019 8:12:43 ******/
ALTER TABLE [rrhh].[tbJornadas] ADD  CONSTRAINT [UQ_rrhh_tbJornadas_jor_Descripcion] UNIQUE NONCLUSTERED 
(
	[jor_Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_rrhh_tbNacionalidades_nac_Descripcion]    Script Date: 19/11/2019 8:12:43 ******/
ALTER TABLE [rrhh].[tbNacionalidades] ADD  CONSTRAINT [UQ_rrhh_tbNacionalidades_nac_Descripcion] UNIQUE NONCLUSTERED 
(
	[nac_Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Personas_per_Identidad]    Script Date: 19/11/2019 8:12:43 ******/
ALTER TABLE [rrhh].[tbPersonas] ADD  CONSTRAINT [UQ_Personas_per_Identidad] UNIQUE NONCLUSTERED 
(
	[per_Identidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_rrhh_tbSucursales_empr_Id_suc_Descripcion]    Script Date: 19/11/2019 8:12:43 ******/
ALTER TABLE [rrhh].[tbSucursales] ADD  CONSTRAINT [UQ_rrhh_tbSucursales_empr_Id_suc_Descripcion] UNIQUE NONCLUSTERED 
(
	[empr_Id] ASC,
	[suc_Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_rrhh_tbTipoAmonestaciones_tamo_Descripcion]    Script Date: 19/11/2019 8:12:43 ******/
ALTER TABLE [rrhh].[tbTipoAmonestaciones] ADD  CONSTRAINT [UQ_rrhh_tbTipoAmonestaciones_tamo_Descripcion] UNIQUE NONCLUSTERED 
(
	[tamo_Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_rrhh_tbTipoHoras_tiho_Descripcion]    Script Date: 19/11/2019 8:12:43 ******/
ALTER TABLE [rrhh].[tbTipoHoras] ADD  CONSTRAINT [UQ_rrhh_tbTipoHoras_tiho_Descripcion] UNIQUE NONCLUSTERED 
(
	[tiho_Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_rrhh_tbTipoIncapacidades_ticn_Descripcion]    Script Date: 19/11/2019 8:12:43 ******/
ALTER TABLE [rrhh].[tbTipoIncapacidades] ADD  CONSTRAINT [UQ_rrhh_tbTipoIncapacidades_ticn_Descripcion] UNIQUE NONCLUSTERED 
(
	[ticn_Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_rrhh_tbTipoMonedas_tmon_Descripcion]    Script Date: 19/11/2019 8:12:43 ******/
ALTER TABLE [rrhh].[tbTipoMonedas] ADD  CONSTRAINT [UQ_rrhh_tbTipoMonedas_tmon_Descripcion] UNIQUE NONCLUSTERED 
(
	[tmon_Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_rrhh_tbTipoPermisos_tper_Descripcion]    Script Date: 19/11/2019 8:12:43 ******/
ALTER TABLE [rrhh].[tbTipoPermisos] ADD  CONSTRAINT [UQ_rrhh_tbTipoPermisos_tper_Descripcion] UNIQUE NONCLUSTERED 
(
	[tper_Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_rrhh_tbTipoSalidas_tsal_Descripcion]    Script Date: 19/11/2019 8:12:43 ******/
ALTER TABLE [rrhh].[tbTipoSalidas] ADD  CONSTRAINT [UQ_rrhh_tbTipoSalidas_tsal_Descripcion] UNIQUE NONCLUSTERED 
(
	[tsal_Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_rrhh_tbTitulos_titu_Descripcion]    Script Date: 19/11/2019 8:12:43 ******/
ALTER TABLE [rrhh].[tbTitulos] ADD  CONSTRAINT [UQ_rrhh_tbTitulos_titu_Descripcion] UNIQUE NONCLUSTERED 
(
	[titu_Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [rrhh].[tbAreas] ADD  CONSTRAINT [DF_tbAreas_area_Estado]  DEFAULT ((1)) FOR [area_Estado]
GO
ALTER TABLE [rrhh].[tbCargos] ADD  CONSTRAINT [DF_tbCargos_car_Estado]  DEFAULT ((1)) FOR [car_Estado]
GO
ALTER TABLE [rrhh].[tbCompetencias] ADD  CONSTRAINT [DF_tbCompetencias_comp_Estado]  DEFAULT ((1)) FOR [comp_Estado]
GO
ALTER TABLE [rrhh].[tbCompetenciasPersona] ADD  CONSTRAINT [DF_tbCompetenciasPersona_cope_Estado]  DEFAULT ((1)) FOR [cope_Estado]
GO
ALTER TABLE [rrhh].[tbCompetenciasRequisicion] ADD  CONSTRAINT [DF_tbCompetenciasRequisicion_creq_Estado]  DEFAULT ((1)) FOR [creq_Estado]
GO
ALTER TABLE [rrhh].[tbDepartamentos] ADD  CONSTRAINT [DF_tbDepartamentos_depto_RazonInactivo]  DEFAULT ((1)) FOR [depto_RazonInactivo]
GO
ALTER TABLE [rrhh].[tbEmpleados] ADD  CONSTRAINT [DF_tbEmpleados_emp_Estado]  DEFAULT ((1)) FOR [emp_Estado]
GO
ALTER TABLE [rrhh].[tbEmpresas] ADD  CONSTRAINT [DF_tbEmpresas_empr_Estado]  DEFAULT ((1)) FOR [empr_Estado]
GO
ALTER TABLE [rrhh].[tbEquipoEmpleados] ADD  CONSTRAINT [DF_tbEquipoEmpleados_eqem_Estado]  DEFAULT ((1)) FOR [eqem_Estado]
GO
ALTER TABLE [rrhh].[tbEquipoTrabajo] ADD  CONSTRAINT [DF_tbEquipoTrabajo_eqtra_Estado]  DEFAULT ((1)) FOR [eqtra_Estado]
GO
ALTER TABLE [rrhh].[tbFaseSeleccion] ADD  CONSTRAINT [DF_tbFaseSeleccion_fsel_Estado]  DEFAULT ((1)) FOR [fsel_Estado]
GO
ALTER TABLE [rrhh].[tbFasesReclutamiento] ADD  CONSTRAINT [DF_tbFasesReclutamiento_fare_Estado]  DEFAULT ((1)) FOR [fare_Estado]
GO
ALTER TABLE [rrhh].[tbHabilidades] ADD  CONSTRAINT [DF_tbHabilidades_habi_Estado]  DEFAULT ((1)) FOR [habi_Estado]
GO
ALTER TABLE [rrhh].[tbHabilidadesPersona] ADD  CONSTRAINT [DF_tbHabilidadesPersona_hape_Estado]  DEFAULT ((1)) FOR [hape_Estado]
GO
ALTER TABLE [rrhh].[tbHabilidadesRequisicion] ADD  CONSTRAINT [DF_tbHabilidadesRequisicion_hreq_Estado]  DEFAULT ((1)) FOR [hreq_Estado]
GO
ALTER TABLE [rrhh].[tbHistorialAmonestaciones] ADD  CONSTRAINT [DF_tbHistorialAmonestaciones_hamo_Estado]  DEFAULT ((1)) FOR [hamo_Estado]
GO
ALTER TABLE [rrhh].[tbHistorialAudienciaDescargo] ADD  CONSTRAINT [DF_tbHistorialAudienciaDescargo_aude_Estado]  DEFAULT ((1)) FOR [aude_Estado]
GO
ALTER TABLE [rrhh].[tbHistorialCargos] ADD  CONSTRAINT [DF_tbHistorialCargos_hcar_Estado]  DEFAULT ((1)) FOR [hcar_Estado]
GO
ALTER TABLE [rrhh].[tbHistorialContrataciones] ADD  CONSTRAINT [DF_tbHistorialContrataciones_hcon_Estado]  DEFAULT ((1)) FOR [hcon_Estado]
GO
ALTER TABLE [rrhh].[tbHistorialHorasTrabajadas] ADD  CONSTRAINT [DF_tbHistorialHorasTrabajadas_htra_Estado]  DEFAULT ((1)) FOR [htra_Estado]
GO
ALTER TABLE [rrhh].[tbHistorialLiquidaciones] ADD  CONSTRAINT [DF_tbHistorialLiquidaciones_hliq_Estado]  DEFAULT ((1)) FOR [hliq_Estado]
GO
ALTER TABLE [rrhh].[tbHistorialPermisos] ADD  CONSTRAINT [DF_tbHistorialPermisos_hper_Estado]  DEFAULT ((1)) FOR [hper_Estado]
GO
ALTER TABLE [rrhh].[tbHistorialRefrendamientos] ADD  CONSTRAINT [DF_tbHistorialRefrendamientos_href_Estado]  DEFAULT ((1)) FOR [href_Estado]
GO
ALTER TABLE [rrhh].[tbHistorialSalidas] ADD  CONSTRAINT [DF_tbHistorialSalidas_hsal_Estado]  DEFAULT ((1)) FOR [hsal_Estado]
GO
ALTER TABLE [rrhh].[tbHistorialVacaciones] ADD  CONSTRAINT [DF_tbHistorialVacaciones_hvac_Estado]  DEFAULT ((1)) FOR [hvac_Estado]
GO
ALTER TABLE [rrhh].[tbHorarios] ADD  CONSTRAINT [DF_tbHorarios_hor_Estado]  DEFAULT ((1)) FOR [hor_Estado]
GO
ALTER TABLE [rrhh].[tbIdiomaPersona] ADD  CONSTRAINT [DF_tbIdiomaPersona_idpe_Estado]  DEFAULT ((1)) FOR [idpe_Estado]
GO
ALTER TABLE [rrhh].[tbIdiomas] ADD  CONSTRAINT [DF_tbIdiomas_idi_Estado]  DEFAULT ((1)) FOR [idi_Estado]
GO
ALTER TABLE [rrhh].[tbIdiomasRequisicion] ADD  CONSTRAINT [DF_tbIdiomasRequisicion_ireq_Estado]  DEFAULT ((1)) FOR [ireq_Estado]
GO
ALTER TABLE [rrhh].[tbJornadas] ADD  CONSTRAINT [DF_tbJornadas_jor_Estado]  DEFAULT ((1)) FOR [jor_Estado]
GO
ALTER TABLE [rrhh].[tbNacionalidades] ADD  CONSTRAINT [DF_tbNacionalidades_nac_Estado]  DEFAULT ((1)) FOR [nac_Estado]
GO
ALTER TABLE [rrhh].[tbPersonas] ADD  CONSTRAINT [DF_tbPersonas_per_Estado]  DEFAULT ((1)) FOR [per_Estado]
GO
ALTER TABLE [rrhh].[tbPrestaciones] ADD  CONSTRAINT [DF_tbPrestaciones_pres_Estado]  DEFAULT ((1)) FOR [pres_Estado]
GO
ALTER TABLE [rrhh].[tbRazonSalidas] ADD  CONSTRAINT [DF_tbRazonSalidas_rsal_Estado]  DEFAULT ((1)) FOR [rsal_Estado]
GO
ALTER TABLE [rrhh].[tbRequisiciones] ADD  CONSTRAINT [DF_tbRequisiciones_req_Estado]  DEFAULT ((1)) FOR [req_Estado]
GO
ALTER TABLE [rrhh].[tbSeleccionCandidatos] ADD  CONSTRAINT [DF_tbSeleccionCandidatos_scan_Estado]  DEFAULT ((1)) FOR [scan_Estado]
GO
ALTER TABLE [rrhh].[tbSucursales] ADD  CONSTRAINT [DF_tbSucursales_suc_RazonInactivo]  DEFAULT ((1)) FOR [suc_RazonInactivo]
GO
ALTER TABLE [rrhh].[tbSueldos] ADD  CONSTRAINT [DF_tbSueldos_hsue_Estado]  DEFAULT ((1)) FOR [sue_Estado]
GO
ALTER TABLE [rrhh].[tbTipoAmonestaciones] ADD  CONSTRAINT [DF_tbTipoAmonestaciones_tamo_Estado]  DEFAULT ((1)) FOR [tamo_Estado]
GO
ALTER TABLE [rrhh].[tbTipoHoras] ADD  CONSTRAINT [DF_tbTipoHoras_tiho_Estado]  DEFAULT ((1)) FOR [tiho_Estado]
GO
ALTER TABLE [rrhh].[tbTipoIncapacidades] ADD  CONSTRAINT [DF_tbTipoIncapacidades_ticn_Estado]  DEFAULT ((1)) FOR [ticn_Estado]
GO
ALTER TABLE [rrhh].[tbTipoMonedas] ADD  CONSTRAINT [DF_tbTipoMonedas_tmon_estado]  DEFAULT ((1)) FOR [tmon_Estado]
GO
ALTER TABLE [rrhh].[tbTipoPermisos] ADD  CONSTRAINT [DF_tbTipoPermisos_tper_Estado]  DEFAULT ((1)) FOR [tper_Estado]
GO
ALTER TABLE [rrhh].[tbTipoSalidas] ADD  CONSTRAINT [DF_tbTipoSalidas_tsal_Estado]  DEFAULT ((1)) FOR [tsal_Estado]
GO
ALTER TABLE [rrhh].[tbTitulos] ADD  CONSTRAINT [DF_tbTitulos_titu_Estado]  DEFAULT ((1)) FOR [titu_Estado]
GO
ALTER TABLE [rrhh].[tbTitulosPersona] ADD  CONSTRAINT [DF_tbTitulosPersona_tipe_Estado]  DEFAULT ((1)) FOR [tipe_Estado]
GO
ALTER TABLE [rrhh].[tbTitulosRequisicion] ADD  CONSTRAINT [DF_tbTitulosRequisicion_treq_Estado]  DEFAULT ((1)) FOR [treq_Estado]
GO
ALTER TABLE [rrhh].[tbVacaciones] ADD  CONSTRAINT [DF_tbVacaciones_vaca_Estado]  DEFAULT ((1)) FOR [vaca_Estado]
GO
ALTER TABLE [Acce].[tbAccesoRol]  WITH CHECK ADD  CONSTRAINT [FK_ Acce _ tbUsuario_ tbAccesoRol _acrol_UsuarioCrea] FOREIGN KEY([acrol_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Acce].[tbAccesoRol] CHECK CONSTRAINT [FK_ Acce _ tbUsuario_ tbAccesoRol _acrol_UsuarioCrea]
GO
ALTER TABLE [Acce].[tbAccesoRol]  WITH CHECK ADD  CONSTRAINT [FK_ Acce _tbObjeto_ tbAccesoRol _obj_Id] FOREIGN KEY([obj_Id])
REFERENCES [Acce].[tbObjeto] ([obj_Id])
GO
ALTER TABLE [Acce].[tbAccesoRol] CHECK CONSTRAINT [FK_ Acce _tbObjeto_ tbAccesoRol _obj_Id]
GO
ALTER TABLE [Acce].[tbAccesoRol]  WITH CHECK ADD  CONSTRAINT [FK_ Acce _tbUsuario_ tbAccesoRol _acrol_UsuarioModifica] FOREIGN KEY([acrol_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Acce].[tbAccesoRol] CHECK CONSTRAINT [FK_ Acce _tbUsuario_ tbAccesoRol _acrol_UsuarioModifica]
GO
ALTER TABLE [Acce].[tbAccesoRol]  WITH CHECK ADD  CONSTRAINT [FK_ Acce_tbRol_ tbAccesoRol _rol_Id] FOREIGN KEY([rol_Id])
REFERENCES [Acce].[tbRol] ([rol_Id])
GO
ALTER TABLE [Acce].[tbAccesoRol] CHECK CONSTRAINT [FK_ Acce_tbRol_ tbAccesoRol _rol_Id]
GO
ALTER TABLE [Acce].[tbObjeto]  WITH CHECK ADD  CONSTRAINT [FK_ Acce _ tbUsuario_ tbObjeto _obj_UsuarioCrea] FOREIGN KEY([obj_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Acce].[tbObjeto] CHECK CONSTRAINT [FK_ Acce _ tbUsuario_ tbObjeto _obj_UsuarioCrea]
GO
ALTER TABLE [Acce].[tbObjeto]  WITH CHECK ADD  CONSTRAINT [FK_ Acce _tbUsuario_ tbObjeto _obj_UsuarioModifica] FOREIGN KEY([obj_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Acce].[tbObjeto] CHECK CONSTRAINT [FK_ Acce _tbUsuario_ tbObjeto _obj_UsuarioModifica]
GO
ALTER TABLE [Acce].[tbRol]  WITH CHECK ADD  CONSTRAINT [FK_ Acce _tbUsuario_ tbRol _rol_UsuarioCrea] FOREIGN KEY([rol_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Acce].[tbRol] CHECK CONSTRAINT [FK_ Acce _tbUsuario_ tbRol _rol_UsuarioCrea]
GO
ALTER TABLE [Acce].[tbRol]  WITH CHECK ADD  CONSTRAINT [FK_ Acce _tbUsuario_ tbRol _rol_UsuarioModifica] FOREIGN KEY([rol_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Acce].[tbRol] CHECK CONSTRAINT [FK_ Acce _tbUsuario_ tbRol _rol_UsuarioModifica]
GO
ALTER TABLE [Acce].[tbRolesUsuario]  WITH CHECK ADD  CONSTRAINT [FK_ Acce _tbRol_ tbRolesUsuario_rol_Id] FOREIGN KEY([rol_Id])
REFERENCES [Acce].[tbRol] ([rol_Id])
GO
ALTER TABLE [Acce].[tbRolesUsuario] CHECK CONSTRAINT [FK_ Acce _tbRol_ tbRolesUsuario_rol_Id]
GO
ALTER TABLE [Acce].[tbRolesUsuario]  WITH CHECK ADD  CONSTRAINT [FK_ Acce _tbUsuario_ tbRolesUsuario _rolu_UsuarioCrea] FOREIGN KEY([rolu_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Acce].[tbRolesUsuario] CHECK CONSTRAINT [FK_ Acce _tbUsuario_ tbRolesUsuario _rolu_UsuarioCrea]
GO
ALTER TABLE [Acce].[tbRolesUsuario]  WITH CHECK ADD  CONSTRAINT [FK_ Acce _tbUsuario_ tbRolesUsuario _rolu_UsuarioModifica] FOREIGN KEY([rolu_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Acce].[tbRolesUsuario] CHECK CONSTRAINT [FK_ Acce _tbUsuario_ tbRolesUsuario _rolu_UsuarioModifica]
GO
ALTER TABLE [Acce].[tbRolesUsuario]  WITH CHECK ADD  CONSTRAINT [FK_ Acce _tbUsuario_ tbRolesUsuario _usu_Id] FOREIGN KEY([usu_Id])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Acce].[tbRolesUsuario] CHECK CONSTRAINT [FK_ Acce _tbUsuario_ tbRolesUsuario _usu_Id]
GO
ALTER TABLE [Plani].[tbAdelantoSueldo]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbAdelantoSueldo_adsu_UsuarioCrea] FOREIGN KEY([adsu_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbAdelantoSueldo] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbAdelantoSueldo_adsu_UsuarioCrea]
GO
ALTER TABLE [Plani].[tbAdelantoSueldo]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbAdelantoSueldo_adsu_UsuarioModifica] FOREIGN KEY([adsu_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbAdelantoSueldo] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbAdelantoSueldo_adsu_UsuarioModifica]
GO
ALTER TABLE [Plani].[tbAdelantoSueldo]  WITH CHECK ADD  CONSTRAINT ['FK_Plani_tbCatalogoDeDeducciones_cde_IdDeducciones_Plani_tbAdelantoSueldo_cde_IdDeducciones] FOREIGN KEY([cde_IdDeducciones])
REFERENCES [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones])
GO
ALTER TABLE [Plani].[tbAdelantoSueldo] CHECK CONSTRAINT ['FK_Plani_tbCatalogoDeDeducciones_cde_IdDeducciones_Plani_tbAdelantoSueldo_cde_IdDeducciones]
GO
ALTER TABLE [Plani].[tbAdelantoSueldo]  WITH CHECK ADD  CONSTRAINT ['FK_Plani_tbPeriodos_peri_IdPeriodo_Plani_tbAdelantoSueldo_peri_IdPeriodo] FOREIGN KEY([peri_IdPeriodo])
REFERENCES [Plani].[tbPeriodos] ([peri_IdPeriodo])
GO
ALTER TABLE [Plani].[tbAdelantoSueldo] CHECK CONSTRAINT ['FK_Plani_tbPeriodos_peri_IdPeriodo_Plani_tbAdelantoSueldo_peri_IdPeriodo]
GO
ALTER TABLE [Plani].[tbAdelantoSueldo]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbEmpleados_emp_Id_Plani_tbAdelantoSueldo_emp_Id] FOREIGN KEY([emp_Id])
REFERENCES [rrhh].[tbEmpleados] ([emp_Id])
GO
ALTER TABLE [Plani].[tbAdelantoSueldo] CHECK CONSTRAINT ['FK_rrhh_tbEmpleados_emp_Id_Plani_tbAdelantoSueldo_emp_Id]
GO
ALTER TABLE [Plani].[tbAuxilioDeCesantias]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbAuxilioDeCesantias_aces_UsuarioCrea] FOREIGN KEY([aces_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbAuxilioDeCesantias] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbAuxilioDeCesantias_aces_UsuarioCrea]
GO
ALTER TABLE [Plani].[tbAuxilioDeCesantias]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbAuxilioDeCesantias_aces_UsuarioModifica] FOREIGN KEY([aces_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbAuxilioDeCesantias] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbAuxilioDeCesantias_aces_UsuarioModifica]
GO
ALTER TABLE [Plani].[tbCatalogoDeDeducciones]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbCatalogoDeDeducciones_cde_UsuarioCrea] FOREIGN KEY([cde_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbCatalogoDeDeducciones] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbCatalogoDeDeducciones_cde_UsuarioCrea]
GO
ALTER TABLE [Plani].[tbCatalogoDeDeducciones]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbCatalogoDeDeducciones_cde_UsuarioModifica] FOREIGN KEY([cde_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbCatalogoDeDeducciones] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbCatalogoDeDeducciones_cde_UsuarioModifica]
GO
ALTER TABLE [Plani].[tbCatalogoDeDeducciones]  WITH CHECK ADD  CONSTRAINT ['FK_Plani_tbTipoDeduccion_tde_IdTipoDedu_Plani_tbCatalogoDeDeducciones_tde_IdTipoDedu] FOREIGN KEY([tde_IdTipoDedu])
REFERENCES [Plani].[tbTipoDeduccion] ([tde_IdTipoDedu])
GO
ALTER TABLE [Plani].[tbCatalogoDeDeducciones] CHECK CONSTRAINT ['FK_Plani_tbTipoDeduccion_tde_IdTipoDedu_Plani_tbCatalogoDeDeducciones_tde_IdTipoDedu]
GO
ALTER TABLE [Plani].[tbCatalogoDeIngresos]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbCatalogoDeIngresos_cin_UsuarioCrea] FOREIGN KEY([cin_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbCatalogoDeIngresos] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbCatalogoDeIngresos_cin_UsuarioCrea]
GO
ALTER TABLE [Plani].[tbCatalogoDeIngresos]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbCatalogoDeIngresos_cin_UsuarioModifica] FOREIGN KEY([cin_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbCatalogoDeIngresos] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbCatalogoDeIngresos_cin_UsuarioModifica]
GO
ALTER TABLE [Plani].[tbCatalogoDePlanillas]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbCatalogoDePlanillas_cpla_UsuarioCrea] FOREIGN KEY([cpla_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbCatalogoDePlanillas] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbCatalogoDePlanillas_cpla_UsuarioCrea]
GO
ALTER TABLE [Plani].[tbCatalogoDePlanillas]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbCatalogoDePlanillas_cpla_UsuarioModifica] FOREIGN KEY([cpla_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbCatalogoDePlanillas] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbCatalogoDePlanillas_cpla_UsuarioModifica]
GO
ALTER TABLE [Plani].[tbDecimoCuartoMes]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbDecimoCuartoMes_dcm_UsuarioCrea] FOREIGN KEY([dcm_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbDecimoCuartoMes] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbDecimoCuartoMes_dcm_UsuarioCrea]
GO
ALTER TABLE [Plani].[tbDecimoCuartoMes]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbDecimoCuartoMes_dcm_UsuarioModifica] FOREIGN KEY([dcm_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbDecimoCuartoMes] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbDecimoCuartoMes_dcm_UsuarioModifica]
GO
ALTER TABLE [Plani].[tbDecimoCuartoMes]  WITH CHECK ADD  CONSTRAINT ['FK_Plani_tbHistorialDePago_hipa_IdHistorialDePago_Plani_tbDecimoCuartoMes_hipa_IdHistorialDePago] FOREIGN KEY([hipa_IdHistorialDePago])
REFERENCES [Plani].[tbHistorialDePago] ([hipa_IdHistorialDePago])
GO
ALTER TABLE [Plani].[tbDecimoCuartoMes] CHECK CONSTRAINT ['FK_Plani_tbHistorialDePago_hipa_IdHistorialDePago_Plani_tbDecimoCuartoMes_hipa_IdHistorialDePago]
GO
ALTER TABLE [Plani].[tbDecimoTercerMes]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbDecimoTercerMes_dtm_UsuarioCrea] FOREIGN KEY([dtm_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbDecimoTercerMes] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbDecimoTercerMes_dtm_UsuarioCrea]
GO
ALTER TABLE [Plani].[tbDecimoTercerMes]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbDecimoTercerMes_dtm_UsuarioModifica] FOREIGN KEY([dtm_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbDecimoTercerMes] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbDecimoTercerMes_dtm_UsuarioModifica]
GO
ALTER TABLE [Plani].[tbDecimoTercerMes]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbEmpleados_emp_Id_Plani_tbDecimoTercerMes_emp_Id] FOREIGN KEY([emp_Id])
REFERENCES [rrhh].[tbEmpleados] ([emp_Id])
GO
ALTER TABLE [Plani].[tbDecimoTercerMes] CHECK CONSTRAINT ['FK_rrhh_tbEmpleados_emp_Id_Plani_tbDecimoTercerMes_emp_Id]
GO
ALTER TABLE [Plani].[tbDeduccionesExtraordinarias]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbDeduccionesExtraordinarias_dex_UsuarioCrea] FOREIGN KEY([dex_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbDeduccionesExtraordinarias] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbDeduccionesExtraordinarias_dex_UsuarioCrea]
GO
ALTER TABLE [Plani].[tbDeduccionesExtraordinarias]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbDeduccionesExtraordinarias_dex_UsuarioModifica] FOREIGN KEY([dex_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbDeduccionesExtraordinarias] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbDeduccionesExtraordinarias_dex_UsuarioModifica]
GO
ALTER TABLE [Plani].[tbDeduccionesExtraordinarias]  WITH CHECK ADD  CONSTRAINT ['FK_Plani_tbCatalogoDeDeducciones_cde_IdDeducciones_Plani_tbDeduccionesExtraordinarias_cde_IdDeducciones] FOREIGN KEY([cde_IdDeducciones])
REFERENCES [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones])
GO
ALTER TABLE [Plani].[tbDeduccionesExtraordinarias] CHECK CONSTRAINT ['FK_Plani_tbCatalogoDeDeducciones_cde_IdDeducciones_Plani_tbDeduccionesExtraordinarias_cde_IdDeducciones]
GO
ALTER TABLE [Plani].[tbDeduccionesExtraordinarias]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbEquipoEmpleados_eqem_Id_Plani_tbDeduccionesExtraordinarias_eqem_Id] FOREIGN KEY([eqem_Id])
REFERENCES [rrhh].[tbEquipoEmpleados] ([eqem_Id])
GO
ALTER TABLE [Plani].[tbDeduccionesExtraordinarias] CHECK CONSTRAINT ['FK_rrhh_tbEquipoEmpleados_eqem_Id_Plani_tbDeduccionesExtraordinarias_eqem_Id]
GO
ALTER TABLE [Plani].[tbDeduccionInstitucionFinanciera]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbDeduccionInstitucionFinanciera_deif_UsuarioCrea] FOREIGN KEY([deif_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbDeduccionInstitucionFinanciera] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbDeduccionInstitucionFinanciera_deif_UsuarioCrea]
GO
ALTER TABLE [Plani].[tbDeduccionInstitucionFinanciera]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbDeduccionInstitucionFinanciera_deif_UsuarioModifica] FOREIGN KEY([deif_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbDeduccionInstitucionFinanciera] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbDeduccionInstitucionFinanciera_deif_UsuarioModifica]
GO
ALTER TABLE [Plani].[tbDeduccionInstitucionFinanciera]  WITH CHECK ADD  CONSTRAINT ['FK_Plani_tbCatalogoDeDeducciones_cde_IdDeducciones_Plani_tbDeduccionInstitucionFinanciera_cde_IdDeducciones] FOREIGN KEY([cde_IdDeducciones])
REFERENCES [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones])
GO
ALTER TABLE [Plani].[tbDeduccionInstitucionFinanciera] CHECK CONSTRAINT ['FK_Plani_tbCatalogoDeDeducciones_cde_IdDeducciones_Plani_tbDeduccionInstitucionFinanciera_cde_IdDeducciones]
GO
ALTER TABLE [Plani].[tbDeduccionInstitucionFinanciera]  WITH CHECK ADD  CONSTRAINT ['FK_Plani_tbInstitucionesFinancieras_insf_IdInstitucionFinanciera_Plani_tbDeduccionInstitucionFinanciera_insf_IdInstitucionFinan] FOREIGN KEY([insf_IdInstitucionFinanciera])
REFERENCES [Plani].[tbInstitucionesFinancieras] ([insf_IdInstitucionFinanciera])
GO
ALTER TABLE [Plani].[tbDeduccionInstitucionFinanciera] CHECK CONSTRAINT ['FK_Plani_tbInstitucionesFinancieras_insf_IdInstitucionFinanciera_Plani_tbDeduccionInstitucionFinanciera_insf_IdInstitucionFinan]
GO
ALTER TABLE [Plani].[tbDeduccionInstitucionFinanciera]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbEmpleados_emp_Id_Plani_tbDeduccionInstitucionFinanciera_emp_Id] FOREIGN KEY([emp_Id])
REFERENCES [rrhh].[tbEmpleados] ([emp_Id])
GO
ALTER TABLE [Plani].[tbDeduccionInstitucionFinanciera] CHECK CONSTRAINT ['FK_rrhh_tbEmpleados_emp_Id_Plani_tbDeduccionInstitucionFinanciera_emp_Id]
GO
ALTER TABLE [Plani].[tbEmpleadoBonos]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbEmpleadoBonos_cb_UsuarioCrea] FOREIGN KEY([cb_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbEmpleadoBonos] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbEmpleadoBonos_cb_UsuarioCrea]
GO
ALTER TABLE [Plani].[tbEmpleadoBonos]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbEmpleadoBonos_cb_UsuarioModifica] FOREIGN KEY([cb_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbEmpleadoBonos] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbEmpleadoBonos_cb_UsuarioModifica]
GO
ALTER TABLE [Plani].[tbEmpleadoBonos]  WITH CHECK ADD  CONSTRAINT ['FK_Plani_tbCatalogoDeIngresos_cin_IdIngreso_Plani_tbEmpleadoBonos_cin_IdIngreso] FOREIGN KEY([cin_IdIngreso])
REFERENCES [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso])
GO
ALTER TABLE [Plani].[tbEmpleadoBonos] CHECK CONSTRAINT ['FK_Plani_tbCatalogoDeIngresos_cin_IdIngreso_Plani_tbEmpleadoBonos_cin_IdIngreso]
GO
ALTER TABLE [Plani].[tbEmpleadoBonos]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbEmpleados_emp_Id_Plani_tbEmpleadoBonos_emp_Id] FOREIGN KEY([emp_Id])
REFERENCES [rrhh].[tbEmpleados] ([emp_Id])
GO
ALTER TABLE [Plani].[tbEmpleadoBonos] CHECK CONSTRAINT ['FK_rrhh_tbEmpleados_emp_Id_Plani_tbEmpleadoBonos_emp_Id]
GO
ALTER TABLE [Plani].[tbEmpleadoComisiones]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbEmpleadoComisiones_cc_UsuarioCrea] FOREIGN KEY([cc_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbEmpleadoComisiones] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbEmpleadoComisiones_cc_UsuarioCrea]
GO
ALTER TABLE [Plani].[tbEmpleadoComisiones]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbEmpleadoComisiones_cc_UsuarioModifica] FOREIGN KEY([cc_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbEmpleadoComisiones] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbEmpleadoComisiones_cc_UsuarioModifica]
GO
ALTER TABLE [Plani].[tbEmpleadoComisiones]  WITH CHECK ADD  CONSTRAINT ['FK_Plani_tbCatalogoDeIngresos_cin_IdIngreso_Plani_tbEmpleadoComisiones_cin_IdIngreso] FOREIGN KEY([cin_IdIngreso])
REFERENCES [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso])
GO
ALTER TABLE [Plani].[tbEmpleadoComisiones] CHECK CONSTRAINT ['FK_Plani_tbCatalogoDeIngresos_cin_IdIngreso_Plani_tbEmpleadoComisiones_cin_IdIngreso]
GO
ALTER TABLE [Plani].[tbEmpleadoComisiones]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbEmpleados_emp_Id_Plani_tbEmpleadoComisiones_emp_Id] FOREIGN KEY([emp_Id])
REFERENCES [rrhh].[tbEmpleados] ([emp_Id])
GO
ALTER TABLE [Plani].[tbEmpleadoComisiones] CHECK CONSTRAINT ['FK_rrhh_tbEmpleados_emp_Id_Plani_tbEmpleadoComisiones_emp_Id]
GO
ALTER TABLE [Plani].[tbFormaPago]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbFormaPago_fpa_UsuarioCrea] FOREIGN KEY([fpa_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbFormaPago] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbFormaPago_fpa_UsuarioCrea]
GO
ALTER TABLE [Plani].[tbFormaPago]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbFormaPago_fpa_UsuarioModifica] FOREIGN KEY([fpa_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbFormaPago] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbFormaPago_fpa_UsuarioModifica]
GO
ALTER TABLE [Plani].[tbHistorialDeduccionPago]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbHistorialDeduccionPago_hidp_UsuarioCrea] FOREIGN KEY([hidp_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbHistorialDeduccionPago] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbHistorialDeduccionPago_hidp_UsuarioCrea]
GO
ALTER TABLE [Plani].[tbHistorialDeduccionPago]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbHistorialDeduccionPago_hidp_UsuarioModifica] FOREIGN KEY([hidp_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbHistorialDeduccionPago] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbHistorialDeduccionPago_hidp_UsuarioModifica]
GO
ALTER TABLE [Plani].[tbHistorialDeduccionPago]  WITH CHECK ADD  CONSTRAINT ['FK_Plani_tbHistorialDePago_hipa_IdHistorialDePago_Plani_tbHistorialDeduccionPago_hipa_IdHistorialDePago] FOREIGN KEY([hipa_IdHistorialDePago])
REFERENCES [Plani].[tbHistorialDePago] ([hipa_IdHistorialDePago])
GO
ALTER TABLE [Plani].[tbHistorialDeduccionPago] CHECK CONSTRAINT ['FK_Plani_tbHistorialDePago_hipa_IdHistorialDePago_Plani_tbHistorialDeduccionPago_hipa_IdHistorialDePago]
GO
ALTER TABLE [Plani].[tbHistorialDeduccionPago]  WITH CHECK ADD  CONSTRAINT ['FK_Plani_tbTipoPlanillaDetalleDeduccion_tpdd_IdPlanillaDetDeduccion_Plani_tbHistorialDeduccionPago_tpdd_IdPlanillaDetDeduccion] FOREIGN KEY([tpdd_IdPlanillaDetDeduccion])
REFERENCES [Plani].[tbTipoPlanillaDetalleDeduccion] ([tpdd_IdPlanillaDetDeduccion])
GO
ALTER TABLE [Plani].[tbHistorialDeduccionPago] CHECK CONSTRAINT ['FK_Plani_tbTipoPlanillaDetalleDeduccion_tpdd_IdPlanillaDetDeduccion_Plani_tbHistorialDeduccionPago_tpdd_IdPlanillaDetDeduccion]
GO
ALTER TABLE [Plani].[tbHistorialDeIngresosPago]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbHistorialDeIngresosPago_hip_UsuarioCrea] FOREIGN KEY([hip_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbHistorialDeIngresosPago] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbHistorialDeIngresosPago_hip_UsuarioCrea]
GO
ALTER TABLE [Plani].[tbHistorialDeIngresosPago]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbHistorialDeIngresosPago_hip_UsuarioModifica] FOREIGN KEY([hip_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbHistorialDeIngresosPago] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbHistorialDeIngresosPago_hip_UsuarioModifica]
GO
ALTER TABLE [Plani].[tbHistorialDeIngresosPago]  WITH CHECK ADD  CONSTRAINT ['FK_Plani_tbHistorialDePago_hipa_IdHistorialDePago_Plani_tbHistorialDeIngresosPago_hipa_IdHistorialDePago] FOREIGN KEY([hipa_IdHistorialDePago])
REFERENCES [Plani].[tbHistorialDePago] ([hipa_IdHistorialDePago])
GO
ALTER TABLE [Plani].[tbHistorialDeIngresosPago] CHECK CONSTRAINT ['FK_Plani_tbHistorialDePago_hipa_IdHistorialDePago_Plani_tbHistorialDeIngresosPago_hipa_IdHistorialDePago]
GO
ALTER TABLE [Plani].[tbHistorialDeIngresosPago]  WITH CHECK ADD  CONSTRAINT ['FK_Plani_tbTipoPlanillaDetalleIngreso_tpdi_IdDetallePlanillaIngreso_Plani_tbHistorialDeIngresosPago_tpdi_IdDetallePlanillaIngre] FOREIGN KEY([tpdi_IdDetallePlanillaIngreso])
REFERENCES [Plani].[tbTipoPlanillaDetalleIngreso] ([tpdi_IdDetallePlanillaIngreso])
GO
ALTER TABLE [Plani].[tbHistorialDeIngresosPago] CHECK CONSTRAINT ['FK_Plani_tbTipoPlanillaDetalleIngreso_tpdi_IdDetallePlanillaIngreso_Plani_tbHistorialDeIngresosPago_tpdi_IdDetallePlanillaIngre]
GO
ALTER TABLE [Plani].[tbHistorialDePago]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbHistorialDePago_hipa_UsuarioCrea] FOREIGN KEY([hipa_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbHistorialDePago] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbHistorialDePago_hipa_UsuarioCrea]
GO
ALTER TABLE [Plani].[tbHistorialDePago]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbHistorialDePago_hipa_UsuarioModifica] FOREIGN KEY([hipa_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbHistorialDePago] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbHistorialDePago_hipa_UsuarioModifica]
GO
ALTER TABLE [Plani].[tbHistorialDePago]  WITH CHECK ADD  CONSTRAINT ['FK_Plani_tbPeriodos_peri_IdPeriodo_Plani_tbHistorialDePago_peri_IdPeriodo] FOREIGN KEY([peri_IdPeriodo])
REFERENCES [Plani].[tbPeriodos] ([peri_IdPeriodo])
GO
ALTER TABLE [Plani].[tbHistorialDePago] CHECK CONSTRAINT ['FK_Plani_tbPeriodos_peri_IdPeriodo_Plani_tbHistorialDePago_peri_IdPeriodo]
GO
ALTER TABLE [Plani].[tbHistorialDePago]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbEmpleados_emp_Id_Plani_tbHistorialDePago_emp_Id] FOREIGN KEY([emp_Id])
REFERENCES [rrhh].[tbEmpleados] ([emp_Id])
GO
ALTER TABLE [Plani].[tbHistorialDePago] CHECK CONSTRAINT ['FK_rrhh_tbEmpleados_emp_Id_Plani_tbHistorialDePago_emp_Id]
GO
ALTER TABLE [Plani].[tbInstitucionesFinancieras]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbInstitucionesFinancieras_insf_UsuarioCrea] FOREIGN KEY([insf_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbInstitucionesFinancieras] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbInstitucionesFinancieras_insf_UsuarioCrea]
GO
ALTER TABLE [Plani].[tbInstitucionesFinancieras]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbInstitucionesFinancieras_insf_UsuarioModifica] FOREIGN KEY([insf_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbInstitucionesFinancieras] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbInstitucionesFinancieras_insf_UsuarioModifica]
GO
ALTER TABLE [Plani].[tbLiquidaciones]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbLiquidaciones_liqu_UsuarioCrea] FOREIGN KEY([liqu_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbLiquidaciones] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbLiquidaciones_liqu_UsuarioCrea]
GO
ALTER TABLE [Plani].[tbLiquidaciones]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbLiquidaciones_liqu_UsuarioModifica] FOREIGN KEY([liqu_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbLiquidaciones] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbLiquidaciones_liqu_UsuarioModifica]
GO
ALTER TABLE [Plani].[tbLiquidaciones]  WITH CHECK ADD  CONSTRAINT ['FK_Plani_tbAuxilioDeCesantias_aces_IdAuxilioCesantia_Plani_tbLiquidaciones_aces_IdAuxilioCesantia] FOREIGN KEY([aces_IdAuxilioCesantia])
REFERENCES [Plani].[tbAuxilioDeCesantias] ([aces_IdAuxilioCesantia])
GO
ALTER TABLE [Plani].[tbLiquidaciones] CHECK CONSTRAINT ['FK_Plani_tbAuxilioDeCesantias_aces_IdAuxilioCesantia_Plani_tbLiquidaciones_aces_IdAuxilioCesantia]
GO
ALTER TABLE [Plani].[tbLiquidaciones]  WITH CHECK ADD  CONSTRAINT ['FK_Plani_tbLiquidacionVacaciones_pvac_IdPagoVacaciones_Plani_tbLiquidaciones_pvac_IdPagoVacaciones] FOREIGN KEY([pvac_IdPagoVacaciones])
REFERENCES [Plani].[tbLiquidacionVacaciones] ([pvac_IdPagoVacaciones])
GO
ALTER TABLE [Plani].[tbLiquidaciones] CHECK CONSTRAINT ['FK_Plani_tbLiquidacionVacaciones_pvac_IdPagoVacaciones_Plani_tbLiquidaciones_pvac_IdPagoVacaciones]
GO
ALTER TABLE [Plani].[tbLiquidaciones]  WITH CHECK ADD  CONSTRAINT ['FK_Plani_tbMotivoLiquidaciones_mliq_IdMotivoLiquidacion_Plani_tbLiquidaciones_mliq_IdMotivoLiquidacion] FOREIGN KEY([mliq_IdMotivoLiquidacion])
REFERENCES [Plani].[tbMotivoLiquidaciones] ([mliq_IdMotivoLiquidacion])
GO
ALTER TABLE [Plani].[tbLiquidaciones] CHECK CONSTRAINT ['FK_Plani_tbMotivoLiquidaciones_mliq_IdMotivoLiquidacion_Plani_tbLiquidaciones_mliq_IdMotivoLiquidacion]
GO
ALTER TABLE [Plani].[tbLiquidaciones]  WITH CHECK ADD  CONSTRAINT ['FK_Plani_tbPreaviso_prea_IdPreaviso_Plani_tbLiquidaciones_prea_IdPreaviso] FOREIGN KEY([prea_IdPreaviso])
REFERENCES [Plani].[tbPreaviso] ([prea_IdPreaviso])
GO
ALTER TABLE [Plani].[tbLiquidaciones] CHECK CONSTRAINT ['FK_Plani_tbPreaviso_prea_IdPreaviso_Plani_tbLiquidaciones_prea_IdPreaviso]
GO
ALTER TABLE [Plani].[tbLiquidaciones]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbEmpleados_emp_Id_Plani_tbLiquidaciones_emp_Id] FOREIGN KEY([emp_Id])
REFERENCES [rrhh].[tbEmpleados] ([emp_Id])
GO
ALTER TABLE [Plani].[tbLiquidaciones] CHECK CONSTRAINT ['FK_rrhh_tbEmpleados_emp_Id_Plani_tbLiquidaciones_emp_Id]
GO
ALTER TABLE [Plani].[tbLiquidacionVacaciones]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbLiquidacionVacaciones_pvac_UsuarioCrea] FOREIGN KEY([pvac_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbLiquidacionVacaciones] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbLiquidacionVacaciones_pvac_UsuarioCrea]
GO
ALTER TABLE [Plani].[tbLiquidacionVacaciones]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbLiquidacionVacaciones_pvac_UsuarioModifica] FOREIGN KEY([pvac_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbLiquidacionVacaciones] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbLiquidacionVacaciones_pvac_UsuarioModifica]
GO
ALTER TABLE [Plani].[tbMotivoLiquidaciones]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbMotivoLiquidaciones_mliq_UsuarioCrea] FOREIGN KEY([mliq_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbMotivoLiquidaciones] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbMotivoLiquidaciones_mliq_UsuarioCrea]
GO
ALTER TABLE [Plani].[tbMotivoLiquidaciones]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbMotivoLiquidaciones_mliq_UsuarioModifica] FOREIGN KEY([mliq_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbMotivoLiquidaciones] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbMotivoLiquidaciones_mliq_UsuarioModifica]
GO
ALTER TABLE [Plani].[tbPeriodos]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbPeriodos_peri_UsuarioCrea] FOREIGN KEY([peri_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbPeriodos] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbPeriodos_peri_UsuarioCrea]
GO
ALTER TABLE [Plani].[tbPeriodos]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbPeriodos_peri_UsuarioModifica] FOREIGN KEY([peri_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbPeriodos] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbPeriodos_peri_UsuarioModifica]
GO
ALTER TABLE [Plani].[tbPreaviso]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbPreaviso_prea_UsuarioCrea] FOREIGN KEY([prea_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbPreaviso] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbPreaviso_prea_UsuarioCrea]
GO
ALTER TABLE [Plani].[tbPreaviso]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbPreaviso_prea_UsuarioModifica] FOREIGN KEY([prea_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbPreaviso] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbPreaviso_prea_UsuarioModifica]
GO
ALTER TABLE [Plani].[tbRamaActividad]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbRamaActividad_rama_UsuarioCrea] FOREIGN KEY([rama_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbRamaActividad] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbRamaActividad_rama_UsuarioCrea]
GO
ALTER TABLE [Plani].[tbRamaActividad]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbRamaActividad_rama_UsuarioModifica] FOREIGN KEY([rama_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbRamaActividad] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbRamaActividad_rama_UsuarioModifica]
GO
ALTER TABLE [Plani].[tbSalarioPorHora]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbSalarioPorHora_saph_UsuarioCrea] FOREIGN KEY([saph_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbSalarioPorHora] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbSalarioPorHora_saph_UsuarioCrea]
GO
ALTER TABLE [Plani].[tbSalarioPorHora]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbSalarioPorHora_saph_UsuarioModifica] FOREIGN KEY([saph_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbSalarioPorHora] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbSalarioPorHora_saph_UsuarioModifica]
GO
ALTER TABLE [Plani].[tbSalarioPorHora]  WITH CHECK ADD  CONSTRAINT ['FK_Plani_tbRamaActividad_rama_Id_Plani_tbSalarioPorHora_rama_Id] FOREIGN KEY([rama_Id])
REFERENCES [Plani].[tbRamaActividad] ([rama_Id])
GO
ALTER TABLE [Plani].[tbSalarioPorHora] CHECK CONSTRAINT ['FK_Plani_tbRamaActividad_rama_Id_Plani_tbSalarioPorHora_rama_Id]
GO
ALTER TABLE [Plani].[tbSalarioPorHora]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbJornadas_jor_Id_Plani_tbSalarioPorHora_jor_Id] FOREIGN KEY([jor_Id])
REFERENCES [rrhh].[tbJornadas] ([jor_Id])
GO
ALTER TABLE [Plani].[tbSalarioPorHora] CHECK CONSTRAINT ['FK_rrhh_tbJornadas_jor_Id_Plani_tbSalarioPorHora_jor_Id]
GO
ALTER TABLE [Plani].[tbTechosDeducciones]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbTechosDeducciones_tede_UsuarioCrea] FOREIGN KEY([tede_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbTechosDeducciones] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbTechosDeducciones_tede_UsuarioCrea]
GO
ALTER TABLE [Plani].[tbTechosDeducciones]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbTechosDeducciones_tede_UsuarioModifica] FOREIGN KEY([tede_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbTechosDeducciones] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbTechosDeducciones_tede_UsuarioModifica]
GO
ALTER TABLE [Plani].[tbTechosDeducciones]  WITH CHECK ADD  CONSTRAINT ['FK_Plani_tbCatalogoDeDeducciones_cde_IdDeducciones_Plani_tbTechosDeducciones_cde_IdDeducciones] FOREIGN KEY([cde_IdDeducciones])
REFERENCES [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones])
GO
ALTER TABLE [Plani].[tbTechosDeducciones] CHECK CONSTRAINT ['FK_Plani_tbCatalogoDeDeducciones_cde_IdDeducciones_Plani_tbTechosDeducciones_cde_IdDeducciones]
GO
ALTER TABLE [Plani].[tbTipoDeduccion]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbTipoDeduccion_tde_UsuarioCrea] FOREIGN KEY([tde_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbTipoDeduccion] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbTipoDeduccion_tde_UsuarioCrea]
GO
ALTER TABLE [Plani].[tbTipoDeduccion]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbTipoDeduccion_tde_UsuarioModifica] FOREIGN KEY([tde_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbTipoDeduccion] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbTipoDeduccion_tde_UsuarioModifica]
GO
ALTER TABLE [Plani].[tbTipoPlanillaDetalleDeduccion]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbTipoPlanillaDetalleDeduccion_tpdd_UsuarioCrea] FOREIGN KEY([tpdd_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbTipoPlanillaDetalleDeduccion] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbTipoPlanillaDetalleDeduccion_tpdd_UsuarioCrea]
GO
ALTER TABLE [Plani].[tbTipoPlanillaDetalleDeduccion]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbTipoPlanillaDetalleDeduccion_tpdd_UsuarioModifica] FOREIGN KEY([tpdd_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbTipoPlanillaDetalleDeduccion] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbTipoPlanillaDetalleDeduccion_tpdd_UsuarioModifica]
GO
ALTER TABLE [Plani].[tbTipoPlanillaDetalleDeduccion]  WITH CHECK ADD  CONSTRAINT ['FK_Plani_tbCatalogoDeDeducciones_cde_IdDeducciones_Plani_tbTipoPlanillaDetalleDeduccion_cde_IdDeducciones] FOREIGN KEY([cde_IdDeducciones])
REFERENCES [Plani].[tbCatalogoDeDeducciones] ([cde_IdDeducciones])
GO
ALTER TABLE [Plani].[tbTipoPlanillaDetalleDeduccion] CHECK CONSTRAINT ['FK_Plani_tbCatalogoDeDeducciones_cde_IdDeducciones_Plani_tbTipoPlanillaDetalleDeduccion_cde_IdDeducciones]
GO
ALTER TABLE [Plani].[tbTipoPlanillaDetalleDeduccion]  WITH CHECK ADD  CONSTRAINT ['FK_Plani_tbCatalogoDePlanillas_cpla_IdPlanilla_Plani_tbTipoPlanillaDetalleDeduccion_cpla_IdPlanilla] FOREIGN KEY([cpla_IdPlanilla])
REFERENCES [Plani].[tbCatalogoDePlanillas] ([cpla_IdPlanilla])
GO
ALTER TABLE [Plani].[tbTipoPlanillaDetalleDeduccion] CHECK CONSTRAINT ['FK_Plani_tbCatalogoDePlanillas_cpla_IdPlanilla_Plani_tbTipoPlanillaDetalleDeduccion_cpla_IdPlanilla]
GO
ALTER TABLE [Plani].[tbTipoPlanillaDetalleIngreso]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbTipoPlanillaDetalleIngreso_tpdi_UsuarioCrea] FOREIGN KEY([tpdi_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbTipoPlanillaDetalleIngreso] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbTipoPlanillaDetalleIngreso_tpdi_UsuarioCrea]
GO
ALTER TABLE [Plani].[tbTipoPlanillaDetalleIngreso]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbTipoPlanillaDetalleIngreso_tpdi_UsuarioModifica] FOREIGN KEY([tpdi_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [Plani].[tbTipoPlanillaDetalleIngreso] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_Plani_tbTipoPlanillaDetalleIngreso_tpdi_UsuarioModifica]
GO
ALTER TABLE [Plani].[tbTipoPlanillaDetalleIngreso]  WITH CHECK ADD  CONSTRAINT ['FK_Plani_tbCatalogoDeIngresos_cin_IdIngreso_Plani_tbTipoPlanillaDetalleIngreso_cin_IdIngreso] FOREIGN KEY([cin_IdIngreso])
REFERENCES [Plani].[tbCatalogoDeIngresos] ([cin_IdIngreso])
GO
ALTER TABLE [Plani].[tbTipoPlanillaDetalleIngreso] CHECK CONSTRAINT ['FK_Plani_tbCatalogoDeIngresos_cin_IdIngreso_Plani_tbTipoPlanillaDetalleIngreso_cin_IdIngreso]
GO
ALTER TABLE [Plani].[tbTipoPlanillaDetalleIngreso]  WITH CHECK ADD  CONSTRAINT ['FK_Plani_tbCatalogoDePlanillas_cpla_IdPlanilla_Plani_tbTipoPlanillaDetalleIngreso_cpla_IdPlanilla] FOREIGN KEY([cpla_IdPlanilla])
REFERENCES [Plani].[tbCatalogoDePlanillas] ([cpla_IdPlanilla])
GO
ALTER TABLE [Plani].[tbTipoPlanillaDetalleIngreso] CHECK CONSTRAINT ['FK_Plani_tbCatalogoDePlanillas_cpla_IdPlanilla_Plani_tbTipoPlanillaDetalleIngreso_cpla_IdPlanilla]
GO
ALTER TABLE [rrhh].[tbAreas]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbAreas_area_Usuariocrea] FOREIGN KEY([area_Usuariocrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbAreas] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbAreas_area_Usuariocrea]
GO
ALTER TABLE [rrhh].[tbAreas]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbAreas_area_Usuariomodifica] FOREIGN KEY([area_Usuariomodifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbAreas] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbAreas_area_Usuariomodifica]
GO
ALTER TABLE [rrhh].[tbAreas]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbCargos_car_Id_rrhh_tbAreas_car_Id] FOREIGN KEY([car_Id])
REFERENCES [rrhh].[tbCargos] ([car_Id])
GO
ALTER TABLE [rrhh].[tbAreas] CHECK CONSTRAINT ['FK_rrhh_tbCargos_car_Id_rrhh_tbAreas_car_Id]
GO
ALTER TABLE [rrhh].[tbAreas]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbSucursales_suc_Id_rrhh_tbAreas_suc_Id] FOREIGN KEY([suc_Id])
REFERENCES [rrhh].[tbSucursales] ([suc_Id])
GO
ALTER TABLE [rrhh].[tbAreas] CHECK CONSTRAINT ['FK_rrhh_tbSucursales_suc_Id_rrhh_tbAreas_suc_Id]
GO
ALTER TABLE [rrhh].[tbCargos]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbCargos_car_UsuarioCrea] FOREIGN KEY([car_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbCargos] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbCargos_car_UsuarioCrea]
GO
ALTER TABLE [rrhh].[tbCargos]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbCargos_car_UsuarioModifica] FOREIGN KEY([car_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbCargos] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbCargos_car_UsuarioModifica]
GO
ALTER TABLE [rrhh].[tbCompetencias]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbCompetencias_comp_UsuarioCrea] FOREIGN KEY([comp_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbCompetencias] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbCompetencias_comp_UsuarioCrea]
GO
ALTER TABLE [rrhh].[tbCompetencias]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbCompetencias_comp_UsuarioModifica] FOREIGN KEY([comp_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbCompetencias] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbCompetencias_comp_UsuarioModifica]
GO
ALTER TABLE [rrhh].[tbCompetenciasPersona]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbCompetenciasPersona_cope_UsuarioCrea] FOREIGN KEY([cope_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbCompetenciasPersona] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbCompetenciasPersona_cope_UsuarioCrea]
GO
ALTER TABLE [rrhh].[tbCompetenciasPersona]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbCompetenciasPersona_cope_UsuarioModifica] FOREIGN KEY([cope_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbCompetenciasPersona] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbCompetenciasPersona_cope_UsuarioModifica]
GO
ALTER TABLE [rrhh].[tbCompetenciasPersona]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbPersonas_per_Id_rrhh_tbCompetenciasPersona_per_Id] FOREIGN KEY([per_Id])
REFERENCES [rrhh].[tbPersonas] ([per_Id])
GO
ALTER TABLE [rrhh].[tbCompetenciasPersona] CHECK CONSTRAINT ['FK_rrhh_tbPersonas_per_Id_rrhh_tbCompetenciasPersona_per_Id]
GO
ALTER TABLE [rrhh].[tbCompetenciasRequisicion]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbCompetenciasRequisicion_creq_UsuarioCrea] FOREIGN KEY([creq_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbCompetenciasRequisicion] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbCompetenciasRequisicion_creq_UsuarioCrea]
GO
ALTER TABLE [rrhh].[tbCompetenciasRequisicion]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbCompetenciasRequisicion_creq_UsuarioModifica] FOREIGN KEY([creq_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbCompetenciasRequisicion] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbCompetenciasRequisicion_creq_UsuarioModifica]
GO
ALTER TABLE [rrhh].[tbCompetenciasRequisicion]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbCompetencias_comp_Id_rrhh_tbCompetenciasRequisicion_comp_Id] FOREIGN KEY([comp_Id])
REFERENCES [rrhh].[tbCompetencias] ([comp_Id])
GO
ALTER TABLE [rrhh].[tbCompetenciasRequisicion] CHECK CONSTRAINT ['FK_rrhh_tbCompetencias_comp_Id_rrhh_tbCompetenciasRequisicion_comp_Id]
GO
ALTER TABLE [rrhh].[tbCompetenciasRequisicion]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbRequisiciones_req_Id_rrhh_tbCompetenciasRequisicion_req_Id] FOREIGN KEY([req_Id])
REFERENCES [rrhh].[tbRequisiciones] ([req_Id])
GO
ALTER TABLE [rrhh].[tbCompetenciasRequisicion] CHECK CONSTRAINT ['FK_rrhh_tbRequisiciones_req_Id_rrhh_tbCompetenciasRequisicion_req_Id]
GO
ALTER TABLE [rrhh].[tbDepartamentos]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbDepartamentos_depto_UsuarioCrea] FOREIGN KEY([depto_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbDepartamentos] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbDepartamentos_depto_UsuarioCrea]
GO
ALTER TABLE [rrhh].[tbDepartamentos]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbDepartamentos_depto_UsuarioModifica] FOREIGN KEY([depto_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbDepartamentos] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbDepartamentos_depto_UsuarioModifica]
GO
ALTER TABLE [rrhh].[tbDepartamentos]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbAreas_area_Id_rrhh_tbDepartamentos_area_Id] FOREIGN KEY([area_Id])
REFERENCES [rrhh].[tbAreas] ([area_Id])
GO
ALTER TABLE [rrhh].[tbDepartamentos] CHECK CONSTRAINT ['FK_rrhh_tbAreas_area_Id_rrhh_tbDepartamentos_area_Id]
GO
ALTER TABLE [rrhh].[tbDepartamentos]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbCargos_car_Id_rrhh_tbDepartamentos_car_Id] FOREIGN KEY([car_Id])
REFERENCES [rrhh].[tbCargos] ([car_Id])
GO
ALTER TABLE [rrhh].[tbDepartamentos] CHECK CONSTRAINT ['FK_rrhh_tbCargos_car_Id_rrhh_tbDepartamentos_car_Id]
GO
ALTER TABLE [rrhh].[tbEmpleados]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbEmpleados_emp_UsuarioCrea] FOREIGN KEY([emp_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbEmpleados] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbEmpleados_emp_UsuarioCrea]
GO
ALTER TABLE [rrhh].[tbEmpleados]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbEmpleados_emp_UsuarioModifica] FOREIGN KEY([emp_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbEmpleados] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbEmpleados_emp_UsuarioModifica]
GO
ALTER TABLE [rrhh].[tbEmpleados]  WITH CHECK ADD  CONSTRAINT ['FK_Plani_tbCatalogoDePlanillas_cpla_IdPlanilla_rrhh_tbEmpleados_cpla_IdPlanilla] FOREIGN KEY([cpla_IdPlanilla])
REFERENCES [Plani].[tbCatalogoDePlanillas] ([cpla_IdPlanilla])
GO
ALTER TABLE [rrhh].[tbEmpleados] CHECK CONSTRAINT ['FK_Plani_tbCatalogoDePlanillas_cpla_IdPlanilla_rrhh_tbEmpleados_cpla_IdPlanilla]
GO
ALTER TABLE [rrhh].[tbEmpleados]  WITH CHECK ADD  CONSTRAINT ['FK_Plani_tbFormaPago_fpa_IdFormaPago_rrhh_tbEmpleados_fpa_IdFormaPago] FOREIGN KEY([fpa_IdFormaPago])
REFERENCES [Plani].[tbFormaPago] ([fpa_IdFormaPago])
GO
ALTER TABLE [rrhh].[tbEmpleados] CHECK CONSTRAINT ['FK_Plani_tbFormaPago_fpa_IdFormaPago_rrhh_tbEmpleados_fpa_IdFormaPago]
GO
ALTER TABLE [rrhh].[tbEmpleados]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbAreas_area_Id_rrhh_tbEmpleados_area_Id] FOREIGN KEY([area_Id])
REFERENCES [rrhh].[tbAreas] ([area_Id])
GO
ALTER TABLE [rrhh].[tbEmpleados] CHECK CONSTRAINT ['FK_rrhh_tbAreas_area_Id_rrhh_tbEmpleados_area_Id]
GO
ALTER TABLE [rrhh].[tbEmpleados]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbCargos_car_Id_rrhh_tbEmpleados_car_Id] FOREIGN KEY([car_Id])
REFERENCES [rrhh].[tbCargos] ([car_Id])
GO
ALTER TABLE [rrhh].[tbEmpleados] CHECK CONSTRAINT ['FK_rrhh_tbCargos_car_Id_rrhh_tbEmpleados_car_Id]
GO
ALTER TABLE [rrhh].[tbEmpleados]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbDepartamentos_depto_Id_rrhh_tbEmpleados_depto_Id] FOREIGN KEY([depto_Id])
REFERENCES [rrhh].[tbDepartamentos] ([depto_Id])
GO
ALTER TABLE [rrhh].[tbEmpleados] CHECK CONSTRAINT ['FK_rrhh_tbDepartamentos_depto_Id_rrhh_tbEmpleados_depto_Id]
GO
ALTER TABLE [rrhh].[tbEmpleados]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbJornadas_jor_Id_rrhh_tbEmpleados_jor_Id] FOREIGN KEY([jor_Id])
REFERENCES [rrhh].[tbJornadas] ([jor_Id])
GO
ALTER TABLE [rrhh].[tbEmpleados] CHECK CONSTRAINT ['FK_rrhh_tbJornadas_jor_Id_rrhh_tbEmpleados_jor_Id]
GO
ALTER TABLE [rrhh].[tbEmpleados]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbPersonas_per_Id_rrhh_tbEmpleados_per_Id] FOREIGN KEY([per_Id])
REFERENCES [rrhh].[tbPersonas] ([per_Id])
GO
ALTER TABLE [rrhh].[tbEmpleados] CHECK CONSTRAINT ['FK_rrhh_tbPersonas_per_Id_rrhh_tbEmpleados_per_Id]
GO
ALTER TABLE [rrhh].[tbEmpresas]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbEmpresas_empr_UsuarioCrea] FOREIGN KEY([empr_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbEmpresas] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbEmpresas_empr_UsuarioCrea]
GO
ALTER TABLE [rrhh].[tbEmpresas]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbEmpresas_empr_UsuarioModifica] FOREIGN KEY([empr_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbEmpresas] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbEmpresas_empr_UsuarioModifica]
GO
ALTER TABLE [rrhh].[tbEquipoEmpleados]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbEquipoEmpleados_eqem_UsuarioCrea] FOREIGN KEY([eqem_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbEquipoEmpleados] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbEquipoEmpleados_eqem_UsuarioCrea]
GO
ALTER TABLE [rrhh].[tbEquipoEmpleados]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbEquipoEmpleados_eqem_UsuarioModifica] FOREIGN KEY([eqem_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbEquipoEmpleados] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbEquipoEmpleados_eqem_UsuarioModifica]
GO
ALTER TABLE [rrhh].[tbEquipoEmpleados]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbEmpleados_emp_Id_rrhh_tbEquipoEmpleados_emp_Id] FOREIGN KEY([emp_Id])
REFERENCES [rrhh].[tbEmpleados] ([emp_Id])
GO
ALTER TABLE [rrhh].[tbEquipoEmpleados] CHECK CONSTRAINT ['FK_rrhh_tbEmpleados_emp_Id_rrhh_tbEquipoEmpleados_emp_Id]
GO
ALTER TABLE [rrhh].[tbEquipoEmpleados]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbEquipoTrabajo_eqtra_Id_rrhh_tbEquipoEmpleados_eqtra_Id] FOREIGN KEY([eqtra_Id])
REFERENCES [rrhh].[tbEquipoTrabajo] ([eqtra_Id])
GO
ALTER TABLE [rrhh].[tbEquipoEmpleados] CHECK CONSTRAINT ['FK_rrhh_tbEquipoTrabajo_eqtra_Id_rrhh_tbEquipoEmpleados_eqtra_Id]
GO
ALTER TABLE [rrhh].[tbEquipoTrabajo]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbEquipoTrabajo_eqtra_UsuarioCrea] FOREIGN KEY([eqtra_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbEquipoTrabajo] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbEquipoTrabajo_eqtra_UsuarioCrea]
GO
ALTER TABLE [rrhh].[tbEquipoTrabajo]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbEquipoTrabajo_eqtra_UsuarioModifica] FOREIGN KEY([eqtra_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbEquipoTrabajo] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbEquipoTrabajo_eqtra_UsuarioModifica]
GO
ALTER TABLE [rrhh].[tbFaseSeleccion]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbFaseSeleccion_fsel_UsuarioCrea] FOREIGN KEY([fsel_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbFaseSeleccion] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbFaseSeleccion_fsel_UsuarioCrea]
GO
ALTER TABLE [rrhh].[tbFaseSeleccion]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbFaseSeleccion_fsel_UsuarioModifica] FOREIGN KEY([fsel_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbFaseSeleccion] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbFaseSeleccion_fsel_UsuarioModifica]
GO
ALTER TABLE [rrhh].[tbFaseSeleccion]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbFasesReclutamiento_fare_Id_rrhh_tbFaseSeleccion_fare_Id] FOREIGN KEY([fare_Id])
REFERENCES [rrhh].[tbFasesReclutamiento] ([fare_Id])
GO
ALTER TABLE [rrhh].[tbFaseSeleccion] CHECK CONSTRAINT ['FK_rrhh_tbFasesReclutamiento_fare_Id_rrhh_tbFaseSeleccion_fare_Id]
GO
ALTER TABLE [rrhh].[tbFasesReclutamiento]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbFasesReclutamiento_fare_UsuarioCrea] FOREIGN KEY([fare_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbFasesReclutamiento] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbFasesReclutamiento_fare_UsuarioCrea]
GO
ALTER TABLE [rrhh].[tbFasesReclutamiento]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbFasesReclutamiento_fare_UsuarioModifica] FOREIGN KEY([fare_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbFasesReclutamiento] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbFasesReclutamiento_fare_UsuarioModifica]
GO
ALTER TABLE [rrhh].[tbHabilidades]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHabilidades_habi_UsuarioCrea] FOREIGN KEY([habi_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbHabilidades] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHabilidades_habi_UsuarioCrea]
GO
ALTER TABLE [rrhh].[tbHabilidades]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHabilidades_habi_UsuarioModifica] FOREIGN KEY([habi_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbHabilidades] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHabilidades_habi_UsuarioModifica]
GO
ALTER TABLE [rrhh].[tbHabilidadesPersona]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHabilidadesPersona_hape_UsuarioCrea] FOREIGN KEY([hape_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbHabilidadesPersona] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHabilidadesPersona_hape_UsuarioCrea]
GO
ALTER TABLE [rrhh].[tbHabilidadesPersona]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHabilidadesPersona_hape_UsuarioModifica] FOREIGN KEY([hape_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbHabilidadesPersona] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHabilidadesPersona_hape_UsuarioModifica]
GO
ALTER TABLE [rrhh].[tbHabilidadesPersona]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbHabilidades_habi_Id_rrhh_tbHabilidadesPersona_habi_Id] FOREIGN KEY([habi_Id])
REFERENCES [rrhh].[tbHabilidades] ([habi_Id])
GO
ALTER TABLE [rrhh].[tbHabilidadesPersona] CHECK CONSTRAINT ['FK_rrhh_tbHabilidades_habi_Id_rrhh_tbHabilidadesPersona_habi_Id]
GO
ALTER TABLE [rrhh].[tbHabilidadesPersona]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbPersonas_per_Id_rrhh_tbHabilidadesPersona_per_Id] FOREIGN KEY([per_Id])
REFERENCES [rrhh].[tbPersonas] ([per_Id])
GO
ALTER TABLE [rrhh].[tbHabilidadesPersona] CHECK CONSTRAINT ['FK_rrhh_tbPersonas_per_Id_rrhh_tbHabilidadesPersona_per_Id]
GO
ALTER TABLE [rrhh].[tbHabilidadesRequisicion]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHabilidadesRequisicion_hreq_UsuarioCrea] FOREIGN KEY([hreq_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbHabilidadesRequisicion] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHabilidadesRequisicion_hreq_UsuarioCrea]
GO
ALTER TABLE [rrhh].[tbHabilidadesRequisicion]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHabilidadesRequisicion_hreq_UsuarioModifica] FOREIGN KEY([hreq_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbHabilidadesRequisicion] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHabilidadesRequisicion_hreq_UsuarioModifica]
GO
ALTER TABLE [rrhh].[tbHabilidadesRequisicion]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbHabilidades_habi_Id_rrhh_tbHabilidadesRequisicion_habi_Id] FOREIGN KEY([habi_Id])
REFERENCES [rrhh].[tbHabilidades] ([habi_Id])
GO
ALTER TABLE [rrhh].[tbHabilidadesRequisicion] CHECK CONSTRAINT ['FK_rrhh_tbHabilidades_habi_Id_rrhh_tbHabilidadesRequisicion_habi_Id]
GO
ALTER TABLE [rrhh].[tbHabilidadesRequisicion]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbRequisiciones_req_Id_rrhh_tbHabilidadesRequisicion_req_Id] FOREIGN KEY([req_Id])
REFERENCES [rrhh].[tbRequisiciones] ([req_Id])
GO
ALTER TABLE [rrhh].[tbHabilidadesRequisicion] CHECK CONSTRAINT ['FK_rrhh_tbRequisiciones_req_Id_rrhh_tbHabilidadesRequisicion_req_Id]
GO
ALTER TABLE [rrhh].[tbHistorialAmonestaciones]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHistorialAmonestaciones_hamo_UsuarioCrea] FOREIGN KEY([hamo_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbHistorialAmonestaciones] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHistorialAmonestaciones_hamo_UsuarioCrea]
GO
ALTER TABLE [rrhh].[tbHistorialAmonestaciones]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHistorialAmonestaciones_hamo_UsuarioModifica] FOREIGN KEY([hamo_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbHistorialAmonestaciones] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHistorialAmonestaciones_hamo_UsuarioModifica]
GO
ALTER TABLE [rrhh].[tbHistorialAmonestaciones]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbEmpleados_emp_Id_rrhh_tbHistorialAmonestaciones_emp_Id] FOREIGN KEY([emp_Id])
REFERENCES [rrhh].[tbEmpleados] ([emp_Id])
GO
ALTER TABLE [rrhh].[tbHistorialAmonestaciones] CHECK CONSTRAINT ['FK_rrhh_tbEmpleados_emp_Id_rrhh_tbHistorialAmonestaciones_emp_Id]
GO
ALTER TABLE [rrhh].[tbHistorialAmonestaciones]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbHistorialAmonestaciones_hamo_Id_rrhh_tbHistorialAmonestaciones_hamo_AmonestacionAnterior] FOREIGN KEY([hamo_AmonestacionAnterior])
REFERENCES [rrhh].[tbHistorialAmonestaciones] ([hamo_Id])
GO
ALTER TABLE [rrhh].[tbHistorialAmonestaciones] CHECK CONSTRAINT ['FK_rrhh_tbHistorialAmonestaciones_hamo_Id_rrhh_tbHistorialAmonestaciones_hamo_AmonestacionAnterior]
GO
ALTER TABLE [rrhh].[tbHistorialAmonestaciones]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbTipoAmonestaciones_tamo_Id_rrhh_tbHistorialAmonestaciones_tamo_Id] FOREIGN KEY([tamo_Id])
REFERENCES [rrhh].[tbTipoAmonestaciones] ([tamo_Id])
GO
ALTER TABLE [rrhh].[tbHistorialAmonestaciones] CHECK CONSTRAINT ['FK_rrhh_tbTipoAmonestaciones_tamo_Id_rrhh_tbHistorialAmonestaciones_tamo_Id]
GO
ALTER TABLE [rrhh].[tbHistorialAudienciaDescargo]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHistorialAudienciaDescargo_aude_UsuarioCrea] FOREIGN KEY([aude_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbHistorialAudienciaDescargo] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHistorialAudienciaDescargo_aude_UsuarioCrea]
GO
ALTER TABLE [rrhh].[tbHistorialAudienciaDescargo]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHistorialAudienciaDescargo_aude_UsuarioModifica] FOREIGN KEY([aude_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbHistorialAudienciaDescargo] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHistorialAudienciaDescargo_aude_UsuarioModifica]
GO
ALTER TABLE [rrhh].[tbHistorialAudienciaDescargo]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbEmpleados_emp_Id_rrhh_tbHistorialAudienciaDescargo_emp_Id] FOREIGN KEY([emp_Id])
REFERENCES [rrhh].[tbEmpleados] ([emp_Id])
GO
ALTER TABLE [rrhh].[tbHistorialAudienciaDescargo] CHECK CONSTRAINT ['FK_rrhh_tbEmpleados_emp_Id_rrhh_tbHistorialAudienciaDescargo_emp_Id]
GO
ALTER TABLE [rrhh].[tbHistorialCargos]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHistorialCargos_hcar_UsuarioCrea] FOREIGN KEY([hcar_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbHistorialCargos] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHistorialCargos_hcar_UsuarioCrea]
GO
ALTER TABLE [rrhh].[tbHistorialCargos]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHistorialCargos_hcar_UsuarioModifica] FOREIGN KEY([hcar_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbHistorialCargos] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHistorialCargos_hcar_UsuarioModifica]
GO
ALTER TABLE [rrhh].[tbHistorialCargos]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbCargos_car_Id_rrhh_tbHistorialCargos_car_Id] FOREIGN KEY([car_Id])
REFERENCES [rrhh].[tbCargos] ([car_Id])
GO
ALTER TABLE [rrhh].[tbHistorialCargos] CHECK CONSTRAINT ['FK_rrhh_tbCargos_car_Id_rrhh_tbHistorialCargos_car_Id]
GO
ALTER TABLE [rrhh].[tbHistorialCargos]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbEmpleados_emp_Id_rrhh_tbHistorialCargos_emp_Id] FOREIGN KEY([emp_Id])
REFERENCES [rrhh].[tbEmpleados] ([emp_Id])
GO
ALTER TABLE [rrhh].[tbHistorialCargos] CHECK CONSTRAINT ['FK_rrhh_tbEmpleados_emp_Id_rrhh_tbHistorialCargos_emp_Id]
GO
ALTER TABLE [rrhh].[tbHistorialContrataciones]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHistorialContrataciones_hcon_UsuarioCrea] FOREIGN KEY([hcon_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbHistorialContrataciones] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHistorialContrataciones_hcon_UsuarioCrea]
GO
ALTER TABLE [rrhh].[tbHistorialContrataciones]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHistorialContrataciones_hcon_UsuarioModifica] FOREIGN KEY([hcon_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbHistorialContrataciones] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHistorialContrataciones_hcon_UsuarioModifica]
GO
ALTER TABLE [rrhh].[tbHistorialContrataciones]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbDepartamentos_depto_Id_rrhh_tbHistorialContrataciones_depto_Id] FOREIGN KEY([depto_Id])
REFERENCES [rrhh].[tbDepartamentos] ([depto_Id])
GO
ALTER TABLE [rrhh].[tbHistorialContrataciones] CHECK CONSTRAINT ['FK_rrhh_tbDepartamentos_depto_Id_rrhh_tbHistorialContrataciones_depto_Id]
GO
ALTER TABLE [rrhh].[tbHistorialContrataciones]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbSeleccionCandidatos_scan_Id_rrhh_tbHistorialContrataciones_scan_Id] FOREIGN KEY([scan_Id])
REFERENCES [rrhh].[tbSeleccionCandidatos] ([scan_Id])
GO
ALTER TABLE [rrhh].[tbHistorialContrataciones] CHECK CONSTRAINT ['FK_rrhh_tbSeleccionCandidatos_scan_Id_rrhh_tbHistorialContrataciones_scan_Id]
GO
ALTER TABLE [rrhh].[tbHistorialHorasTrabajadas]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHistorialHorasTrabajadas_htra_UsuarioCrea] FOREIGN KEY([htra_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbHistorialHorasTrabajadas] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHistorialHorasTrabajadas_htra_UsuarioCrea]
GO
ALTER TABLE [rrhh].[tbHistorialHorasTrabajadas]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHistorialHorasTrabajadas_htra_UsuarioModifica] FOREIGN KEY([htra_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbHistorialHorasTrabajadas] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHistorialHorasTrabajadas_htra_UsuarioModifica]
GO
ALTER TABLE [rrhh].[tbHistorialHorasTrabajadas]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbEmpleados_emp_Id_rrhh_tbHistorialHorasTrabajadas_emp_Id] FOREIGN KEY([emp_Id])
REFERENCES [rrhh].[tbEmpleados] ([emp_Id])
GO
ALTER TABLE [rrhh].[tbHistorialHorasTrabajadas] CHECK CONSTRAINT ['FK_rrhh_tbEmpleados_emp_Id_rrhh_tbHistorialHorasTrabajadas_emp_Id]
GO
ALTER TABLE [rrhh].[tbHistorialHorasTrabajadas]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbJornadas_jor_Id_rrhh_tbHistorialHorasTrabajadas_jor_Id] FOREIGN KEY([jor_Id])
REFERENCES [rrhh].[tbJornadas] ([jor_Id])
GO
ALTER TABLE [rrhh].[tbHistorialHorasTrabajadas] CHECK CONSTRAINT ['FK_rrhh_tbJornadas_jor_Id_rrhh_tbHistorialHorasTrabajadas_jor_Id]
GO
ALTER TABLE [rrhh].[tbHistorialHorasTrabajadas]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbTipoHoras_tiho_Id_rrhh_tbHistorialHorasTrabajadas_tiho_Id] FOREIGN KEY([tiho_Id])
REFERENCES [rrhh].[tbTipoHoras] ([tiho_Id])
GO
ALTER TABLE [rrhh].[tbHistorialHorasTrabajadas] CHECK CONSTRAINT ['FK_rrhh_tbTipoHoras_tiho_Id_rrhh_tbHistorialHorasTrabajadas_tiho_Id]
GO
ALTER TABLE [rrhh].[tbHistorialIncapacidades]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHistorialIncapacidades_hinc_UsuarioCrea] FOREIGN KEY([hinc_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbHistorialIncapacidades] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHistorialIncapacidades_hinc_UsuarioCrea]
GO
ALTER TABLE [rrhh].[tbHistorialIncapacidades]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHistorialIncapacidades_hinc_UsuarioModifica] FOREIGN KEY([hinc_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbHistorialIncapacidades] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHistorialIncapacidades_hinc_UsuarioModifica]
GO
ALTER TABLE [rrhh].[tbHistorialIncapacidades]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbEmpleados_emp_Id_rrhh_tbHistorialIncapacidades_Emp_Id] FOREIGN KEY([Emp_Id])
REFERENCES [rrhh].[tbEmpleados] ([emp_Id])
GO
ALTER TABLE [rrhh].[tbHistorialIncapacidades] CHECK CONSTRAINT ['FK_rrhh_tbEmpleados_emp_Id_rrhh_tbHistorialIncapacidades_Emp_Id]
GO
ALTER TABLE [rrhh].[tbHistorialIncapacidades]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbTipoIncapacidades_ticn_Id_rrhh_tbHistorialIncapacidades_ticn_Id] FOREIGN KEY([ticn_Id])
REFERENCES [rrhh].[tbTipoIncapacidades] ([ticn_Id])
GO
ALTER TABLE [rrhh].[tbHistorialIncapacidades] CHECK CONSTRAINT ['FK_rrhh_tbTipoIncapacidades_ticn_Id_rrhh_tbHistorialIncapacidades_ticn_Id]
GO
ALTER TABLE [rrhh].[tbHistorialLiquidaciones]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHistorialLiquidaciones_hliq_UsuarioCrea] FOREIGN KEY([hliq_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbHistorialLiquidaciones] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHistorialLiquidaciones_hliq_UsuarioCrea]
GO
ALTER TABLE [rrhh].[tbHistorialLiquidaciones]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHistorialLiquidaciones_hliq_UsuarioModifica] FOREIGN KEY([hliq_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbHistorialLiquidaciones] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHistorialLiquidaciones_hliq_UsuarioModifica]
GO
ALTER TABLE [rrhh].[tbHistorialLiquidaciones]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbEmpleados_emp_Id_rrhh_tbHistorialLiquidaciones_emp_Id] FOREIGN KEY([emp_Id])
REFERENCES [rrhh].[tbEmpleados] ([emp_Id])
GO
ALTER TABLE [rrhh].[tbHistorialLiquidaciones] CHECK CONSTRAINT ['FK_rrhh_tbEmpleados_emp_Id_rrhh_tbHistorialLiquidaciones_emp_Id]
GO
ALTER TABLE [rrhh].[tbHistorialPermisos]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHistorialPermisos_hper_UsuarioCrea] FOREIGN KEY([hper_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbHistorialPermisos] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHistorialPermisos_hper_UsuarioCrea]
GO
ALTER TABLE [rrhh].[tbHistorialPermisos]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHistorialPermisos_hper_UsuarioModifica] FOREIGN KEY([hper_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbHistorialPermisos] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHistorialPermisos_hper_UsuarioModifica]
GO
ALTER TABLE [rrhh].[tbHistorialPermisos]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbEmpleados_emp_Id_rrhh_tbHistorialPermisos_emp_Id] FOREIGN KEY([emp_Id])
REFERENCES [rrhh].[tbEmpleados] ([emp_Id])
GO
ALTER TABLE [rrhh].[tbHistorialPermisos] CHECK CONSTRAINT ['FK_rrhh_tbEmpleados_emp_Id_rrhh_tbHistorialPermisos_emp_Id]
GO
ALTER TABLE [rrhh].[tbHistorialPermisos]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbTipoPermisos_tper_Id_rrhh_tbHistorialPermisos_tper_Id] FOREIGN KEY([tper_Id])
REFERENCES [rrhh].[tbTipoPermisos] ([tper_Id])
GO
ALTER TABLE [rrhh].[tbHistorialPermisos] CHECK CONSTRAINT ['FK_rrhh_tbTipoPermisos_tper_Id_rrhh_tbHistorialPermisos_tper_Id]
GO
ALTER TABLE [rrhh].[tbHistorialRefrendamientos]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHistorialRefrendamientos_href_UsuarioCrea] FOREIGN KEY([href_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbHistorialRefrendamientos] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHistorialRefrendamientos_href_UsuarioCrea]
GO
ALTER TABLE [rrhh].[tbHistorialRefrendamientos]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHistorialRefrendamientos_href_UsuarioModifica] FOREIGN KEY([href_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbHistorialRefrendamientos] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHistorialRefrendamientos_href_UsuarioModifica]
GO
ALTER TABLE [rrhh].[tbHistorialRefrendamientos]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbEmpleados_emp_Id_rrhh_tbHistorialRefrendamientos_emp_Id] FOREIGN KEY([emp_Id])
REFERENCES [rrhh].[tbEmpleados] ([emp_Id])
GO
ALTER TABLE [rrhh].[tbHistorialRefrendamientos] CHECK CONSTRAINT ['FK_rrhh_tbEmpleados_emp_Id_rrhh_tbHistorialRefrendamientos_emp_Id]
GO
ALTER TABLE [rrhh].[tbHistorialSalidas]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHistorialSalidas_hsal_UsuarioCrea] FOREIGN KEY([hsal_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbHistorialSalidas] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHistorialSalidas_hsal_UsuarioCrea]
GO
ALTER TABLE [rrhh].[tbHistorialSalidas]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHistorialSalidas_hsal_UsuarioModifica] FOREIGN KEY([hsal_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbHistorialSalidas] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHistorialSalidas_hsal_UsuarioModifica]
GO
ALTER TABLE [rrhh].[tbHistorialSalidas]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbEmpleados_emp_Id_rrhh_tbHistorialSalidas_emp_Id] FOREIGN KEY([emp_Id])
REFERENCES [rrhh].[tbEmpleados] ([emp_Id])
GO
ALTER TABLE [rrhh].[tbHistorialSalidas] CHECK CONSTRAINT ['FK_rrhh_tbEmpleados_emp_Id_rrhh_tbHistorialSalidas_emp_Id]
GO
ALTER TABLE [rrhh].[tbHistorialSalidas]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbPrestaciones_pres_Id_rrhh_tbHistorialSalidas_pres_Id] FOREIGN KEY([pres_Id])
REFERENCES [rrhh].[tbPrestaciones] ([pres_Id])
GO
ALTER TABLE [rrhh].[tbHistorialSalidas] CHECK CONSTRAINT ['FK_rrhh_tbPrestaciones_pres_Id_rrhh_tbHistorialSalidas_pres_Id]
GO
ALTER TABLE [rrhh].[tbHistorialSalidas]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbRazonSalidas_rsal_Id_rrhh_tbHistorialSalidas_rsal_Id] FOREIGN KEY([rsal_Id])
REFERENCES [rrhh].[tbRazonSalidas] ([rsal_Id])
GO
ALTER TABLE [rrhh].[tbHistorialSalidas] CHECK CONSTRAINT ['FK_rrhh_tbRazonSalidas_rsal_Id_rrhh_tbHistorialSalidas_rsal_Id]
GO
ALTER TABLE [rrhh].[tbHistorialSalidas]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbTipoSalidas_tsal_Id_rrhh_tbHistorialSalidas_tsal_Id] FOREIGN KEY([tsal_Id])
REFERENCES [rrhh].[tbTipoSalidas] ([tsal_Id])
GO
ALTER TABLE [rrhh].[tbHistorialSalidas] CHECK CONSTRAINT ['FK_rrhh_tbTipoSalidas_tsal_Id_rrhh_tbHistorialSalidas_tsal_Id]
GO
ALTER TABLE [rrhh].[tbHistorialVacaciones]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHistorialVacaciones_hvac_UsuarioCrea] FOREIGN KEY([hvac_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbHistorialVacaciones] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHistorialVacaciones_hvac_UsuarioCrea]
GO
ALTER TABLE [rrhh].[tbHistorialVacaciones]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHistorialVacaciones_hvac_UsuarioModifica] FOREIGN KEY([hvac_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbHistorialVacaciones] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHistorialVacaciones_hvac_UsuarioModifica]
GO
ALTER TABLE [rrhh].[tbHistorialVacaciones]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbEmpleados_emp_Id_rrhh_tbHistorialVacaciones_emp_Id] FOREIGN KEY([emp_Id])
REFERENCES [rrhh].[tbEmpleados] ([emp_Id])
GO
ALTER TABLE [rrhh].[tbHistorialVacaciones] CHECK CONSTRAINT ['FK_rrhh_tbEmpleados_emp_Id_rrhh_tbHistorialVacaciones_emp_Id]
GO
ALTER TABLE [rrhh].[tbHorarios]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHorarios_hor_UsuarioCrea] FOREIGN KEY([hor_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbHorarios] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHorarios_hor_UsuarioCrea]
GO
ALTER TABLE [rrhh].[tbHorarios]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHorarios_hor_UsuarioModifica] FOREIGN KEY([hor_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbHorarios] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbHorarios_hor_UsuarioModifica]
GO
ALTER TABLE [rrhh].[tbHorarios]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbJornadas_jor_Id_rrhh_tbHorarios_jor_Id] FOREIGN KEY([jor_Id])
REFERENCES [rrhh].[tbJornadas] ([jor_Id])
GO
ALTER TABLE [rrhh].[tbHorarios] CHECK CONSTRAINT ['FK_rrhh_tbJornadas_jor_Id_rrhh_tbHorarios_jor_Id]
GO
ALTER TABLE [rrhh].[tbIdiomaPersona]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbIdiomaPersona_idpe_UsuarioCrea] FOREIGN KEY([idpe_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbIdiomaPersona] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbIdiomaPersona_idpe_UsuarioCrea]
GO
ALTER TABLE [rrhh].[tbIdiomaPersona]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbIdiomaPersona_idpe_UsuarioModifica] FOREIGN KEY([idpe_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbIdiomaPersona] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbIdiomaPersona_idpe_UsuarioModifica]
GO
ALTER TABLE [rrhh].[tbIdiomaPersona]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbIdiomas_idi_Id_rrhh_tbIdiomaPersona_idi_Id] FOREIGN KEY([idi_Id])
REFERENCES [rrhh].[tbIdiomas] ([idi_Id])
GO
ALTER TABLE [rrhh].[tbIdiomaPersona] CHECK CONSTRAINT ['FK_rrhh_tbIdiomas_idi_Id_rrhh_tbIdiomaPersona_idi_Id]
GO
ALTER TABLE [rrhh].[tbIdiomaPersona]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbPersonas_per_Id_rrhh_tbIdiomaPersona_per_Id] FOREIGN KEY([per_Id])
REFERENCES [rrhh].[tbPersonas] ([per_Id])
GO
ALTER TABLE [rrhh].[tbIdiomaPersona] CHECK CONSTRAINT ['FK_rrhh_tbPersonas_per_Id_rrhh_tbIdiomaPersona_per_Id]
GO
ALTER TABLE [rrhh].[tbIdiomas]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbIdiomas_idi_UsuarioCrea] FOREIGN KEY([idi_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbIdiomas] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbIdiomas_idi_UsuarioCrea]
GO
ALTER TABLE [rrhh].[tbIdiomas]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbIdiomas_idi_UsuarioModifica] FOREIGN KEY([idi_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbIdiomas] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbIdiomas_idi_UsuarioModifica]
GO
ALTER TABLE [rrhh].[tbIdiomasRequisicion]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbIdiomasRequisicion_ireq_UsuarioCrea] FOREIGN KEY([ireq_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbIdiomasRequisicion] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbIdiomasRequisicion_ireq_UsuarioCrea]
GO
ALTER TABLE [rrhh].[tbIdiomasRequisicion]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbIdiomasRequisicion_ireq_UsuarioModifica] FOREIGN KEY([ireq_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbIdiomasRequisicion] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbIdiomasRequisicion_ireq_UsuarioModifica]
GO
ALTER TABLE [rrhh].[tbIdiomasRequisicion]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbIdiomas_idi_Id_rrhh_tbIdiomasRequisicion_idi_Id] FOREIGN KEY([idi_Id])
REFERENCES [rrhh].[tbIdiomas] ([idi_Id])
GO
ALTER TABLE [rrhh].[tbIdiomasRequisicion] CHECK CONSTRAINT ['FK_rrhh_tbIdiomas_idi_Id_rrhh_tbIdiomasRequisicion_idi_Id]
GO
ALTER TABLE [rrhh].[tbIdiomasRequisicion]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbRequisiciones_req_Id_rrhh_tbIdiomasRequisicion_req_Id] FOREIGN KEY([req_Id])
REFERENCES [rrhh].[tbRequisiciones] ([req_Id])
GO
ALTER TABLE [rrhh].[tbIdiomasRequisicion] CHECK CONSTRAINT ['FK_rrhh_tbRequisiciones_req_Id_rrhh_tbIdiomasRequisicion_req_Id]
GO
ALTER TABLE [rrhh].[tbJornadas]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbJornadas_jor_UsuarioCrea] FOREIGN KEY([jor_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbJornadas] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbJornadas_jor_UsuarioCrea]
GO
ALTER TABLE [rrhh].[tbJornadas]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbJornadas_jor_UsuarioModifica] FOREIGN KEY([jor_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbJornadas] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbJornadas_jor_UsuarioModifica]
GO
ALTER TABLE [rrhh].[tbNacionalidades]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbNacionalidades_nac_UsuarioCrea] FOREIGN KEY([nac_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbNacionalidades] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbNacionalidades_nac_UsuarioCrea]
GO
ALTER TABLE [rrhh].[tbNacionalidades]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbNacionalidades_nac_UsuarioModifica] FOREIGN KEY([nac_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbNacionalidades] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbNacionalidades_nac_UsuarioModifica]
GO
ALTER TABLE [rrhh].[tbPersonas]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbPersonas_per_UsuarioCrea] FOREIGN KEY([per_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbPersonas] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbPersonas_per_UsuarioCrea]
GO
ALTER TABLE [rrhh].[tbPersonas]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbPersonas_per_UsuarioModifica] FOREIGN KEY([per_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbPersonas] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbPersonas_per_UsuarioModifica]
GO
ALTER TABLE [rrhh].[tbPersonas]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbNacionalidades_nac_Id_rrhh_tbPersonas_nac_Id] FOREIGN KEY([nac_Id])
REFERENCES [rrhh].[tbNacionalidades] ([nac_Id])
GO
ALTER TABLE [rrhh].[tbPersonas] CHECK CONSTRAINT ['FK_rrhh_tbNacionalidades_nac_Id_rrhh_tbPersonas_nac_Id]
GO
ALTER TABLE [rrhh].[tbPrestaciones]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbPrestaciones_pres_UsuarioCrea] FOREIGN KEY([pres_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbPrestaciones] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbPrestaciones_pres_UsuarioCrea]
GO
ALTER TABLE [rrhh].[tbPrestaciones]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbPrestaciones_pres_UsuarioModifica] FOREIGN KEY([pres_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbPrestaciones] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbPrestaciones_pres_UsuarioModifica]
GO
ALTER TABLE [rrhh].[tbRazonSalidas]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbRazonSalidas_rsal_UsuarioCrea] FOREIGN KEY([rsal_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbRazonSalidas] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbRazonSalidas_rsal_UsuarioCrea]
GO
ALTER TABLE [rrhh].[tbRazonSalidas]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbRazonSalidas_rsal_UsuarioModifica] FOREIGN KEY([rsal_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbRazonSalidas] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbRazonSalidas_rsal_UsuarioModifica]
GO
ALTER TABLE [rrhh].[tbRequisiciones]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbRequisiciones_req_UsuarioCrea] FOREIGN KEY([req_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbRequisiciones] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbRequisiciones_req_UsuarioCrea]
GO
ALTER TABLE [rrhh].[tbRequisiciones]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbRequisiciones_req_UsuarioModifica] FOREIGN KEY([req_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbRequisiciones] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbRequisiciones_req_UsuarioModifica]
GO
ALTER TABLE [rrhh].[tbSeleccionCandidatos]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbSeleccionCandidatos_scan_UsuarioCrea] FOREIGN KEY([scan_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbSeleccionCandidatos] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbSeleccionCandidatos_scan_UsuarioCrea]
GO
ALTER TABLE [rrhh].[tbSeleccionCandidatos]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbSeleccionCandidatos_scan_UsuarioModifica] FOREIGN KEY([scan_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbSeleccionCandidatos] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbSeleccionCandidatos_scan_UsuarioModifica]
GO
ALTER TABLE [rrhh].[tbSeleccionCandidatos]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbFaseSeleccion_fsel_Id_rrhh_tbSeleccionCandidatos_fare_Id] FOREIGN KEY([fare_Id])
REFERENCES [rrhh].[tbFaseSeleccion] ([fsel_Id])
GO
ALTER TABLE [rrhh].[tbSeleccionCandidatos] CHECK CONSTRAINT ['FK_rrhh_tbFaseSeleccion_fsel_Id_rrhh_tbSeleccionCandidatos_fare_Id]
GO
ALTER TABLE [rrhh].[tbSeleccionCandidatos]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbPersonas_per_Id_rrhh_tbSeleccionCandidatos_per_Id] FOREIGN KEY([per_Id])
REFERENCES [rrhh].[tbPersonas] ([per_Id])
GO
ALTER TABLE [rrhh].[tbSeleccionCandidatos] CHECK CONSTRAINT ['FK_rrhh_tbPersonas_per_Id_rrhh_tbSeleccionCandidatos_per_Id]
GO
ALTER TABLE [rrhh].[tbSeleccionCandidatos]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbRequisiciones_req_Id_rrhh_tbSeleccionCandidatos_rper_Id] FOREIGN KEY([rper_Id])
REFERENCES [rrhh].[tbRequisiciones] ([req_Id])
GO
ALTER TABLE [rrhh].[tbSeleccionCandidatos] CHECK CONSTRAINT ['FK_rrhh_tbRequisiciones_req_Id_rrhh_tbSeleccionCandidatos_rper_Id]
GO
ALTER TABLE [rrhh].[tbSucursales]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbSucursales_suc_UsuarioCrea] FOREIGN KEY([suc_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbSucursales] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbSucursales_suc_UsuarioCrea]
GO
ALTER TABLE [rrhh].[tbSucursales]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbSucursales_suc_UsuarioModifica] FOREIGN KEY([suc_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbSucursales] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbSucursales_suc_UsuarioModifica]
GO
ALTER TABLE [rrhh].[tbSucursales]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbEmpresas_empr_Id_rrhh_tbSucursales_empr_Id] FOREIGN KEY([empr_Id])
REFERENCES [rrhh].[tbEmpresas] ([empr_Id])
GO
ALTER TABLE [rrhh].[tbSucursales] CHECK CONSTRAINT ['FK_rrhh_tbEmpresas_empr_Id_rrhh_tbSucursales_empr_Id]
GO
ALTER TABLE [rrhh].[tbSueldos]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbSueldos_sue_UsuarioCrea] FOREIGN KEY([sue_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbSueldos] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbSueldos_sue_UsuarioCrea]
GO
ALTER TABLE [rrhh].[tbSueldos]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbSueldos_ue_UsuarioModifica] FOREIGN KEY([ue_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbSueldos] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbSueldos_ue_UsuarioModifica]
GO
ALTER TABLE [rrhh].[tbSueldos]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbEmpleados_emp_Id_rrhh_tbSueldos_emp_Id] FOREIGN KEY([emp_Id])
REFERENCES [rrhh].[tbEmpleados] ([emp_Id])
GO
ALTER TABLE [rrhh].[tbSueldos] CHECK CONSTRAINT ['FK_rrhh_tbEmpleados_emp_Id_rrhh_tbSueldos_emp_Id]
GO
ALTER TABLE [rrhh].[tbSueldos]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbSueldos_sue_Id_rrhh_tbSueldos_sue_SueldoAnterior] FOREIGN KEY([sue_SueldoAnterior])
REFERENCES [rrhh].[tbSueldos] ([sue_Id])
GO
ALTER TABLE [rrhh].[tbSueldos] CHECK CONSTRAINT ['FK_rrhh_tbSueldos_sue_Id_rrhh_tbSueldos_sue_SueldoAnterior]
GO
ALTER TABLE [rrhh].[tbSueldos]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbTipoMonedas_tmon_Id_rrhh_tbSueldos_tmon_Id] FOREIGN KEY([tmon_Id])
REFERENCES [rrhh].[tbTipoMonedas] ([tmon_Id])
GO
ALTER TABLE [rrhh].[tbSueldos] CHECK CONSTRAINT ['FK_rrhh_tbTipoMonedas_tmon_Id_rrhh_tbSueldos_tmon_Id]
GO
ALTER TABLE [rrhh].[tbTipoAmonestaciones]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbTipoAmonestaciones_tamo_UsuarioCrea] FOREIGN KEY([tamo_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbTipoAmonestaciones] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbTipoAmonestaciones_tamo_UsuarioCrea]
GO
ALTER TABLE [rrhh].[tbTipoAmonestaciones]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbTipoAmonestaciones_tamo_UsuarioModifica] FOREIGN KEY([tamo_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbTipoAmonestaciones] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbTipoAmonestaciones_tamo_UsuarioModifica]
GO
ALTER TABLE [rrhh].[tbTipoHoras]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbTipoHoras_tiho_UsuarioCrea] FOREIGN KEY([tiho_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbTipoHoras] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbTipoHoras_tiho_UsuarioCrea]
GO
ALTER TABLE [rrhh].[tbTipoHoras]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbTipoHoras_tiho_UsuarioModifica] FOREIGN KEY([tiho_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbTipoHoras] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbTipoHoras_tiho_UsuarioModifica]
GO
ALTER TABLE [rrhh].[tbTipoIncapacidades]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbTipoIncapacidades_ticn_UsuarioCrea] FOREIGN KEY([ticn_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbTipoIncapacidades] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbTipoIncapacidades_ticn_UsuarioCrea]
GO
ALTER TABLE [rrhh].[tbTipoIncapacidades]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbTipoIncapacidades_ticn_UsuarioModifica] FOREIGN KEY([ticn_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbTipoIncapacidades] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbTipoIncapacidades_ticn_UsuarioModifica]
GO
ALTER TABLE [rrhh].[tbTipoMonedas]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbTipoMonedas_tmon_UsuarioCrea] FOREIGN KEY([tmon_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbTipoMonedas] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbTipoMonedas_tmon_UsuarioCrea]
GO
ALTER TABLE [rrhh].[tbTipoMonedas]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbTipoMonedas_tmon_UsuarioModifica] FOREIGN KEY([tmon_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbTipoMonedas] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbTipoMonedas_tmon_UsuarioModifica]
GO
ALTER TABLE [rrhh].[tbTipoPermisos]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbTipoPermisos_tper_UsuarioCrea] FOREIGN KEY([tper_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbTipoPermisos] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbTipoPermisos_tper_UsuarioCrea]
GO
ALTER TABLE [rrhh].[tbTipoPermisos]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbTipoPermisos_tper_UsuarioModifica] FOREIGN KEY([tper_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbTipoPermisos] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbTipoPermisos_tper_UsuarioModifica]
GO
ALTER TABLE [rrhh].[tbTipoSalidas]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbTipoSalidas_tsal_UsuarioCrea] FOREIGN KEY([tsal_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbTipoSalidas] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbTipoSalidas_tsal_UsuarioCrea]
GO
ALTER TABLE [rrhh].[tbTipoSalidas]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbTipoSalidas_tsal_UsuarioModifica] FOREIGN KEY([tsal_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbTipoSalidas] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbTipoSalidas_tsal_UsuarioModifica]
GO
ALTER TABLE [rrhh].[tbTitulos]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbTitulos_titu_UsuarioCrea] FOREIGN KEY([titu_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbTitulos] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbTitulos_titu_UsuarioCrea]
GO
ALTER TABLE [rrhh].[tbTitulos]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbTitulos_titu_UsuarioModifica] FOREIGN KEY([titu_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbTitulos] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbTitulos_titu_UsuarioModifica]
GO
ALTER TABLE [rrhh].[tbTitulosPersona]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbTitulosPersona_tipe_UsuarioCrea] FOREIGN KEY([tipe_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbTitulosPersona] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbTitulosPersona_tipe_UsuarioCrea]
GO
ALTER TABLE [rrhh].[tbTitulosPersona]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbTitulosPersona_tipe_UsuarioModifica] FOREIGN KEY([tipe_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbTitulosPersona] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbTitulosPersona_tipe_UsuarioModifica]
GO
ALTER TABLE [rrhh].[tbTitulosPersona]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbPersonas_per_Id_rrhh_tbTitulosPersona_per_Id] FOREIGN KEY([per_Id])
REFERENCES [rrhh].[tbPersonas] ([per_Id])
GO
ALTER TABLE [rrhh].[tbTitulosPersona] CHECK CONSTRAINT ['FK_rrhh_tbPersonas_per_Id_rrhh_tbTitulosPersona_per_Id]
GO
ALTER TABLE [rrhh].[tbTitulosPersona]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbTitulos_titu_Id_rrhh_tbTitulosPersona_titu_Id] FOREIGN KEY([titu_Id])
REFERENCES [rrhh].[tbTitulos] ([titu_Id])
GO
ALTER TABLE [rrhh].[tbTitulosPersona] CHECK CONSTRAINT ['FK_rrhh_tbTitulos_titu_Id_rrhh_tbTitulosPersona_titu_Id]
GO
ALTER TABLE [rrhh].[tbTitulosRequisicion]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbTitulosRequisicion_treq_UsuarioCrea] FOREIGN KEY([treq_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbTitulosRequisicion] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbTitulosRequisicion_treq_UsuarioCrea]
GO
ALTER TABLE [rrhh].[tbTitulosRequisicion]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbTitulosRequisicion_treq_UsuarioModifica] FOREIGN KEY([treq_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbTitulosRequisicion] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbTitulosRequisicion_treq_UsuarioModifica]
GO
ALTER TABLE [rrhh].[tbTitulosRequisicion]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbRequisiciones_req_Id_rrhh_tbTitulosRequisicion_req_Id] FOREIGN KEY([req_Id])
REFERENCES [rrhh].[tbRequisiciones] ([req_Id])
GO
ALTER TABLE [rrhh].[tbTitulosRequisicion] CHECK CONSTRAINT ['FK_rrhh_tbRequisiciones_req_Id_rrhh_tbTitulosRequisicion_req_Id]
GO
ALTER TABLE [rrhh].[tbTitulosRequisicion]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbTitulos_titu_Id_rrhh_tbTitulosRequisicion_titu_Id] FOREIGN KEY([titu_Id])
REFERENCES [rrhh].[tbTitulos] ([titu_Id])
GO
ALTER TABLE [rrhh].[tbTitulosRequisicion] CHECK CONSTRAINT ['FK_rrhh_tbTitulos_titu_Id_rrhh_tbTitulosRequisicion_titu_Id]
GO
ALTER TABLE [rrhh].[tbVacaciones]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbVacaciones_vaca_UsuarioCrea] FOREIGN KEY([vaca_UsuarioCrea])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbVacaciones] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbVacaciones_vaca_UsuarioCrea]
GO
ALTER TABLE [rrhh].[tbVacaciones]  WITH CHECK ADD  CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbVacaciones_vaca_UsuarioModifica] FOREIGN KEY([vaca_UsuarioModifica])
REFERENCES [Acce].[tbUsuario] ([usu_Id])
GO
ALTER TABLE [rrhh].[tbVacaciones] CHECK CONSTRAINT ['FK_Acce_tbUsuario_usu_Id_rrhh_tbVacaciones_vaca_UsuarioModifica]
GO
ALTER TABLE [rrhh].[tbVacaciones]  WITH CHECK ADD  CONSTRAINT ['FK_rrhh_tbEmpleados_emp_Id_rrhh_tbVacaciones_emp_Id] FOREIGN KEY([emp_Id])
REFERENCES [rrhh].[tbEmpleados] ([emp_Id])
GO
ALTER TABLE [rrhh].[tbVacaciones] CHECK CONSTRAINT ['FK_rrhh_tbEmpleados_emp_Id_rrhh_tbVacaciones_emp_Id]
GO
ALTER TABLE [rrhh].[tbHistorialVacaciones]  WITH CHECK ADD  CONSTRAINT [CK_tbHistorialVacaciones_hvac_MesVacaciones] CHECK  (([hvac_MesVacaciones]>=(1) AND [hvac_MesVacaciones]<=(12)))
GO
ALTER TABLE [rrhh].[tbHistorialVacaciones] CHECK CONSTRAINT [CK_tbHistorialVacaciones_hvac_MesVacaciones]
GO
ALTER TABLE [rrhh].[tbPersonas]  WITH CHECK ADD  CONSTRAINT [CK_tbPersonas_per_CorreoElectronico] CHECK  (([per_CorreoElectronico] like '%@%'))
GO
ALTER TABLE [rrhh].[tbPersonas] CHECK CONSTRAINT [CK_tbPersonas_per_CorreoElectronico]
GO
ALTER TABLE [rrhh].[tbPersonas]  WITH CHECK ADD  CONSTRAINT [CK_tbPersonas_per_Edad] CHECK  (([per_Edad]>=(18)))
GO
ALTER TABLE [rrhh].[tbPersonas] CHECK CONSTRAINT [CK_tbPersonas_per_Edad]
GO
ALTER TABLE [rrhh].[tbPersonas]  WITH CHECK ADD  CONSTRAINT [CK_tbPersonas_per_EstadoCivil] CHECK  (([per_EstadoCivil] like '%S%' OR [per_EstadoCivil] like '%C%' OR [per_EstadoCivil] like '%D%' OR [per_EstadoCivil] like '%U%' OR [per_EstadoCivil] like '%V%'))
GO
ALTER TABLE [rrhh].[tbPersonas] CHECK CONSTRAINT [CK_tbPersonas_per_EstadoCivil]
GO
ALTER TABLE [rrhh].[tbPersonas]  WITH CHECK ADD  CONSTRAINT [CK_tbPersonas_per_Sexo] CHECK  (([per_Sexo]='M' OR [per_Sexo]='F'))
GO
ALTER TABLE [rrhh].[tbPersonas] CHECK CONSTRAINT [CK_tbPersonas_per_Sexo]
GO
ALTER TABLE [rrhh].[tbPersonas]  WITH CHECK ADD  CONSTRAINT [CK_tbPersonas_per_TipoSangre] CHECK  (([per_TipoSangre] like '%A+%' OR [per_TipoSangre] like '%A-%' OR [per_TipoSangre] like '%B+%' OR [per_TipoSangre] like '%B-%' OR [per_TipoSangre] like '%AB+%' OR [per_TipoSangre] like '%AB-%' OR [per_TipoSangre] like '%O+%' OR [per_TipoSangre] like '%O-%'))
GO
ALTER TABLE [rrhh].[tbPersonas] CHECK CONSTRAINT [CK_tbPersonas_per_TipoSangre]
GO
ALTER TABLE [rrhh].[tbRequisiciones]  WITH CHECK ADD  CONSTRAINT [CK_tbRequisiciones_req_Edad] CHECK  (([req_Edad]>=(18)))
GO
ALTER TABLE [rrhh].[tbRequisiciones] CHECK CONSTRAINT [CK_tbRequisiciones_req_Edad]
GO
ALTER TABLE [rrhh].[tbRequisiciones]  WITH CHECK ADD  CONSTRAINT [CK_tbRequisiciones_req_Sexo] CHECK  (([req_Sexo]='M' OR [req_Sexo]='F'))
GO
ALTER TABLE [rrhh].[tbRequisiciones] CHECK CONSTRAINT [CK_tbRequisiciones_req_Sexo]
GO
/****** Object:  StoredProcedure [Plani].[UDP_Plani_CatalogoDeduccionesEdit_Select]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Plani].[UDP_Plani_CatalogoDeduccionesEdit_Select]
(
     -- Declarar los parametros que recibe el procedimiento almacenado
     @cpla_IdPlanilla INT
)
AS
    BEGIN
        SELECT ttpdd.cde_IdDeducciones, 
               tcdd.cde_DescripcionDeduccion, 
               1 AS 'checked'
        FROM Plani.tbTipoPlanillaDetalleDeduccion ttpdd
             LEFT JOIN Plani.tbCatalogoDeDeducciones tcdd ON ttpdd.cde_IdDeducciones = tcdd.cde_IdDeducciones
        WHERE ttpdd.cpla_IdPlanilla = @cpla_IdPlanilla
              AND tcdd.cde_Activo = 1
        UNION ALL
        SELECT tcdd.cde_IdDeducciones, 
               tcdd.cde_DescripcionDeduccion, 
               0 AS 'checked'
        FROM Plani.tbCatalogoDeDeducciones tcdd
        WHERE tcdd.cde_IdDeducciones NOT IN
        (
            SELECT ttpdd.cde_IdDeducciones
            FROM Plani.tbTipoPlanillaDetalleDeduccion ttpdd
            WHERE ttpdd.cpla_IdPlanilla = @cpla_IdPlanilla
                  AND ttpdd.tpdd_Activo = 1
        )
              AND tcdd.cde_Activo = 1
        ORDER BY 1;
    END;
GO
/****** Object:  StoredProcedure [Plani].[UDP_Plani_CatalogoDeIngresosEdit_Select]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Plani].[UDP_Plani_CatalogoDeIngresosEdit_Select]
(
     -- Declarar los parametros que recibe el procedimiento almacenado
     @cpla_IdPlanilla INT
)
AS
    BEGIN
        SELECT ttpdi.cin_IdIngreso, 
               tcdi.cin_DescripcionIngreso, 
               1 AS 'checked'
        FROM Plani.tbTipoPlanillaDetalleIngreso ttpdi
             LEFT JOIN Plani.tbCatalogoDeIngresos tcdi ON ttpdi.cin_IdIngreso = tcdi.cin_IdIngreso
        WHERE ttpdi.cpla_IdPlanilla = @cpla_IdPlanilla
              AND tcdi.cin_Activo = 1
        UNION ALL
        SELECT tcdi.cin_IdIngreso, 
               tcdi.cin_DescripcionIngreso, 
               0 AS 'checked'
        FROM Plani.tbCatalogoDeIngresos tcdi
        WHERE tcdi.cin_IdIngreso NOT IN
        (
            SELECT cin_IdIngreso
            FROM Plani.tbTipoPlanillaDetalleIngreso
            WHERE cpla_IdPlanilla = @cpla_IdPlanilla
                  AND cin_Activo = 1
        )
              AND tcdi.cin_Activo = 1
        ORDER BY 1;
    END;
GO
/****** Object:  StoredProcedure [Plani].[UDP_Plani_EmpleadoComisiones_Inactivar]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Plani].[UDP_Plani_EmpleadoComisiones_Inactivar]
	(
		-- LOS PARAMETROS QUE RECIBIRÁ EL PROCEDIMIENTO ALMACENADO
		@cc_Id INT,
		@cc_UsuarioModifica Int,
		@cc_FechaModifcia DateTime
	)
AS
BEGIN
    BEGIN TRAN
       DECLARE @msj nvarchar(100); 
        BEGIN TRY
           UPDATE [Plani].[tbEmpleadoComisiones]
			SET [cc_Activo] = 0,
			[cc_UsuarioModifica] = @cc_UsuarioModifica,
			[cc_FechaModifica] =  @cc_FechaModifcia
			WHERE [cc_Id]       = @cc_Id

		   SELECT CAST(@cc_Id AS varchar) AS MensajeError
          COMMIT TRAN
          SET  @msj  = @cc_Id
		 SELECT @msj as MensajeError
    END TRY
    BEGIN CATCH
    ROLLBACK TRAN
             SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError;
    END CATCH
END
GO
/****** Object:  StoredProcedure [Plani].[UDP_Plani_EmpleadoComisiones_Insert]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Plani].[UDP_Plani_EmpleadoComisiones_Insert]
(
-- LOS PARAMETROS QUE RECIBIRÁ EL PROCEDIMIENTO ALMACENADO
    @emp_Id INT,
	@cin_IdIngreso INT ,
	@cc_Monto Decimal(10, 2),
	@cc_FechaRegistro DATETIME,
	@cc_Pagado BIT ,
	@cc_UsuarioCrea INT ,
	@cc_FechaCrea DATETIME
)
AS
BEGIN
    BEGIN TRAN
        DECLARE @msj nvarchar(100)
            BEGIN TRY
            DECLARE @IdEmpleadoComisiones INT
            SET @IdEmpleadoComisiones = (SELECT ISNULL(MAX(cc_Id) + 1, 1) FROM[Plani].[tbEmpleadoComisiones]);
                INSERT INTO [Plani].[tbEmpleadoComisiones]
			(
				cc_Id, 
				emp_Id, 
				cin_IdIngreso, 
				cc_Monto, 
				cc_FechaRegistro, 
				cc_Pagado, 
				cc_UsuarioCrea, 
				cc_FechaCrea,
				cc_Activo
			)
			VALUES
				(
			    @IdEmpleadoComisiones,
				@emp_Id,
				@cin_IdIngreso,
				@cc_Monto,
				@cc_FechaRegistro,
				@cc_Pagado,
				@cc_UsuarioCrea,
				@cc_FechaCrea,
				1
		    )
                COMMIT TRAN
                SET @msj = @IdEmpleadoComisiones
			SELECT @msj as MensajeError
    END TRY
    BEGIN CATCH
    ROLLBACK TRAN
             SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError;
    END CATCH
END
GO
/****** Object:  StoredProcedure [Plani].[UDP_Plani_EmpleadoComisiones_Update]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Plani].[UDP_Plani_EmpleadoComisiones_Update]
	(
		-- LOS PARAMETROS QUE RECIBIRÁ EL PROCEDIMIENTO ALMACENADO
		@cc_Id INT,
		@emp_Id INT,
		@cin_IdIngreso INT ,
		@cc_Monto Decimal(10, 2),
		@cc_FechaRegistro DATETIME,
		@cc_Pagado BIT ,
        @cc_UsuarioModifica  INT,
        @cc_FechaModifica DATETIME
	)
AS
BEGIN
    BEGIN TRAN
       DECLARE @msj nvarchar(100)  
        BEGIN TRY
             UPDATE   [Plani].[tbEmpleadoComisiones]
			SET [cc_Id]               =@cc_Id,
				[emp_Id]         	  =@emp_Id,
				[cin_IdIngreso]	      =@cin_IdIngreso,
				[cc_Monto]   	      =@cc_Monto,
				[cc_FechaRegistro]    =@cc_FechaRegistro,
				[cc_Pagado]	          =@cc_Pagado ,
				[cc_UsuarioModifica]  =@cc_UsuarioModifica,
				[cc_FechaModifica]    =@cc_FechaModifica
				WHERE [cc_Id]       = @cc_Id
		   SELECT CAST(@cc_Id AS varchar) AS MensajeError
          COMMIT TRAN
          SET  @msj  = @cc_Id
		 SELECT @msj as MensajeError
    END TRY
    BEGIN CATCH
    ROLLBACK TRAN
             SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError;
    END CATCH
END
GO
/****** Object:  StoredProcedure [Plani].[UDP_Plani_tbCatalogoDeDeducciones_Inactivar]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Plani].[UDP_Plani_tbCatalogoDeDeducciones_Inactivar]
    (
		-- LOS PARAMETROS QUE RECIBIRÁ EL PROCEDIMIENTO ALMACENADO
		@cde_IdDeduccion INT,
		@cde_UsuarioModifica INT,
		@cde_FechaModifica DATETIME		
    )
AS
BEGIN
    BEGIN TRAN
       DECLARE @msj nvarchar(100)  
        BEGIN TRY
            UPDATE [Plani].[tbCatalogoDeDeducciones]
			SET
			cde_Activo = 0,
			cde_UsuarioModifica = @cde_UsuarioModifica,
			cde_FechaModifica = @cde_FechaModifica
			WHERE cde_IdDeducciones = @cde_IdDeduccion
          COMMIT TRAN
          SET  @msj  = @cde_IdDeduccion
          SELECT @msj AS MensajeError
    END TRY
    BEGIN CATCH
    ROLLBACK TRAN
             SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError;
    END CATCH
END
GO
/****** Object:  StoredProcedure [Plani].[UDP_Plani_tbCatalogoDeDeducciones_Insert]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Plani].[UDP_Plani_tbCatalogoDeDeducciones_Insert]
    (
		-- LOS PARAMETROS QUE RECIBIRÁ EL PROCEDIMIENTO ALMACENADO
		@cde_DescripcionDedu NVARCHAR(50),
		@tde_IdTipoDedu INT,
		@cde_PorcentajeColaborador DECIMAL(16,2),
		@cde_PorcentajeEmpresa DECIMAL(16,2),
		@cde_UsuarioCrea INT,
		@cde_FechaCrea DATETIME
    )
AS
BEGIN
    BEGIN TRAN
       DECLARE @msj nvarchar(100)  
        BEGIN TRY
			DECLARE @IdCatalogoDeDedu INT
            SET @IdCatalogoDeDedu = (SELECT ISNULL(MAX(cde_IdDeducciones) + 1, 1) FROM [Plani].[tbCatalogoDeDeducciones]);
            INSERT INTO [Plani].[tbCatalogoDeDeducciones]
            (
                cde_IdDeducciones, cde_DescripcionDeduccion, tde_IdTipoDedu, cde_PorcentajeColaborador, 
				cde_PorcentajeEmpresa, cde_UsuarioCrea, cde_FechaCrea, cde_Activo
            )
            VALUES
            (
                (SELECT ISNULL(MAX(cde_IdDeducciones) + 1, 1) FROM [Plani].[tbCatalogoDeDeducciones]),
                @cde_DescripcionDedu,
				@tde_IdTipoDedu,
				@cde_PorcentajeColaborador,
				@cde_PorcentajeEmpresa,
				@cde_UsuarioCrea,
				@cde_FechaCrea,
				1
             )
          COMMIT TRAN
          SET  @msj  = @IdCatalogoDeDedu
    END TRY
    BEGIN CATCH
    ROLLBACK TRAN
             SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError;
    END CATCH
    SELECT @msj AS	MensajeError
END
GO
/****** Object:  StoredProcedure [Plani].[UDP_Plani_tbCatalogoDeDeducciones_Update]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Plani].[UDP_Plani_tbCatalogoDeDeducciones_Update]
    (
        -- LOS PARAMETROS QUE RECIBIRÁ EL PROCEDIMIENTO ALMACENADO
        @cde_IdDeduccion INT,
		@cde_DescripcionDedu NVARCHAR(50),
		@tde_IdTipoDedu INT,
		@cde_PorcentajeColaborador DECIMAL(16,2),
		@cde_PorcentajeEmpresa DECIMAL(16,2),
		@cde_UsuarioModifica INT,
		@cde_FechaModifica DATETIME
    )
AS
BEGIN
    BEGIN TRAN
       DECLARE @msj nvarchar(100)
        BEGIN TRY
            UPDATE [Plani].[tbCatalogoDeDeducciones]
			SET
			cde_DescripcionDeduccion = @cde_DescripcionDedu,
			tde_IdTipoDedu = @tde_IdTipoDedu,
			cde_PorcentajeColaborador = @cde_PorcentajeColaborador,
			cde_PorcentajeEmpresa = @cde_PorcentajeEmpresa,
			cde_UsuarioModifica = @cde_UsuarioModifica,
			cde_FechaModifica = @cde_FechaModifica
			WHERE cde_IdDeducciones = @cde_IdDeduccion     
          COMMIT TRAN
          SET  @msj  = @cde_IdDeduccion
          SELECT @msj AS MensajeError
    END TRY
    BEGIN CATCH
    ROLLBACK TRAN
             SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError;
    END CATCH
END
GO
/****** Object:  StoredProcedure [Plani].[UDP_Plani_tbCatalogoDeIngresos_Inactivar]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Plani].[UDP_Plani_tbCatalogoDeIngresos_Inactivar]
	(
		-- LOS PARAMETROS QUE RECIBIRÁ EL PROCEDIMIENTO ALMACENADO
		@cin_IdIngreso          INT,
		@cin_UsuarioModifica    INT,
		@cin_FechaModifica      DATETIME
	)
AS
BEGIN
    BEGIN TRAN
       DECLARE @msj nvarchar(100)  
        BEGIN TRY
            UPDATE [Plani].[tbCatalogoDeIngresos]
			SET 
             [cin_Activo] = 0,
             [cin_UsuarioModifica]= @cin_UsuarioModifica,
             [cin_FechaModifica]= @cin_FechaModifica

			WHERE cin_IdIngreso  = @cin_IdIngreso
          COMMIT TRAN
          SET  @msj  = @cin_IdIngreso
		   SELECT @msj as MensajeError
    END TRY
    BEGIN CATCH
    ROLLBACK TRAN
             SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError;
    END CATCH
END
GO
/****** Object:  StoredProcedure [Plani].[UDP_Plani_tbCatalogoDeIngresos_Insert]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Plani].[UDP_Plani_tbCatalogoDeIngresos_Insert]
	(
		-- LOS PARAMETROS QUE RECIBIRÁ EL PROCEDIMIENTO ALMACENADO
		@cin_DescripcionIngreso NVARCHAR(50), 
		@cin_UsuarioCrea        INT,
		@cin_FechaCrea          DATETIME
	)
AS
BEGIN
    BEGIN TRAN
       DECLARE @msj nvarchar(100)  
        BEGIN TRY
		DECLARE @cin_IdIngreso INT
            SET @cin_IdIngreso = (SELECT ISNULL(MAX(cin_IdIngreso) + 1, 1) 
			FROM [Plani].[tbCatalogoDeIngresos]);
            INSERT INTO [Plani].[tbCatalogoDeIngresos]
			(
				cin_IdIngreso, 
				cin_DescripcionIngreso, 
				cin_UsuarioCrea, 
				cin_FechaCrea,
				cin_Activo
			)
			VALUES
			(
			    @cin_IdIngreso,
				@cin_DescripcionIngreso,
				@cin_UsuarioCrea       ,
			    @cin_FechaCrea  ,
				1         
			)	
          COMMIT TRAN
          SET  @msj  = @cin_IdIngreso
		   SELECT @msj as MensajeError
    END TRY
    BEGIN CATCH
    ROLLBACK TRAN
             SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError;
    END CATCH
END
GO
/****** Object:  StoredProcedure [Plani].[UDP_Plani_tbCatalogoDeIngresos_Update]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Plani].[UDP_Plani_tbCatalogoDeIngresos_Update]
	(
		-- LOS PARAMETROS QUE RECIBIRÁ EL PROCEDIMIENTO ALMACENADO
		@cin_IdIngreso          INT,
		@cin_DescripcionIngreso NVARCHAR(50), 
		@cin_UsuarioModifica    INT,
		@cin_FechaModifica      DATETIME
	)
AS
BEGIN
    BEGIN TRAN
       DECLARE @msj nvarchar(100)  
        BEGIN TRY
		
            UPDATE [Plani].[tbCatalogoDeIngresos]
			SET 
			    cin_DescripcionIngreso = @cin_DescripcionIngreso ,
			    cin_UsuarioModifica	   = @cin_UsuarioModifica,
			    cin_FechaModifica	   = @cin_FechaModifica
			WHERE cin_IdIngreso          = @cin_IdIngreso
		   
          COMMIT TRAN
          SET  @msj  = @cin_IdIngreso
		   SELECT @msj as MensajeError
    END TRY
    BEGIN CATCH
    ROLLBACK TRAN
             SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError;
    END CATCH
END
GO
/****** Object:  StoredProcedure [Plani].[UDP_Plani_tbCatalogoDePlanillas_Inactivar]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Plani].[UDP_Plani_tbCatalogoDePlanillas_Inactivar]
(
     -- Declarar los parametros que recibe el procedimiento almacenado
     @cpla_IdPlanilla INT
)
AS
    BEGIN
        -- Inicio del try
        BEGIN TRY
            --INICIO TRANSACCION
            BEGIN TRAN;
            -- Declarar la variable @msj, es la que retornara el procedimiento como MensajeError
            DECLARE @msj NVARCHAR(100);

            -- Inicio del Update de la tabla [Plani].[tbCatalogoDePlanillas]
            UPDATE [Plani].[tbCatalogoDePlanillas]
              SET 
                  [cpla_Activo] = 0
            WHERE cpla_IdPlanilla = @cpla_IdPlanilla;

            -- @cpla_IdPlanilla, era el Id a retornar por el procedimiento almacenado
            SET @msj = @cpla_IdPlanilla;
            COMMIT TRAN;
        END TRY
        -- Inicio del catch
        BEGIN CATCH
            ROLLBACK TRAN;
            -- Retornar -1 para detectar que hubo un error al guardar el registro, y que lo vuelva a intentar
            SET @msj = '-1' + ERROR_MESSAGE();
        END CATCH;
        SELECT @msj AS MensajeError;
    END;
GO
/****** Object:  StoredProcedure [Plani].[UDP_Plani_tbCatalogoDePlanillas_Insert]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Plani].[UDP_Plani_tbCatalogoDePlanillas_Insert]
(
     -- Declarar los parametros que recibe el procedimiento almacenado
     @cpla_DescripcionPlanilla NVARCHAR(50)
   , @cpla_FrecuenciaEnDias    INT
   , @cpla_UsuarioCrea         INT
   , @cpla_FechaCrea           DATETIME
)
AS
    BEGIN
        -- Inicio del try
        BEGIN TRY
            --INICIO TRANSACCION
            BEGIN TRAN;
            -- Declarar la variable @cpla_IdPlanilla, es la que retornara el procedimiento como MensajeError
            DECLARE @cpla_IdPlanilla INT;
            SET @cpla_IdPlanilla =
            (
                SELECT ISNULL(MAX([cpla_IdPlanilla]) + 1, 1)
                FROM [Plani].[tbCatalogoDePlanillas]
            );

            -- Inicio del Insert de la tabla [Plani].[tbCatalogoDePlanillas]
            INSERT INTO [Plani].[tbCatalogoDePlanillas]
            (
			[cpla_IdPlanilla], 
             [cpla_DescripcionPlanilla], 
             [cpla_FrecuenciaEnDias], 
             [cpla_UsuarioCrea], 
             [cpla_FechaCrea], 
             [cpla_Activo]
            )
            VALUES
            (
			 @cpla_IdPlanilla, 
             @cpla_DescripcionPlanilla, 
             @cpla_FrecuenciaEnDias, 
             @cpla_UsuarioCrea, 
             @cpla_FechaCrea, 
             1
            );

            -- @cpla_IdPlanilla, era el Id a retornar por el procedimiento almacenado
            SELECT CAST(@cpla_IdPlanilla AS VARCHAR) AS MensajeError;
            COMMIT TRAN;
        END TRY
        -- Inicio del catch
        BEGIN CATCH
            ROLLBACK TRAN;
            -- Retornar -1 para detectar que hubo un error al guardar el registro, y que lo vuelva a intentar
            SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError;
        END CATCH;
    END;
GO
/****** Object:  StoredProcedure [Plani].[UDP_Plani_tbCatalogoDePlanillas_Update]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Plani].[UDP_Plani_tbCatalogoDePlanillas_Update]
(
     -- Declarar los parametros que recibe el procedimiento almacenado
     @cpla_IdPlanilla          INT
   , @cpla_DescripcionPlanilla NVARCHAR(50)
   , @cpla_FrecuenciaEnDias    INT
   , @cpla_UsuarioModifica     INT
   , @cpla_FechaModifica       DATETIME
)
AS
    BEGIN
        -- Inicio del try
        BEGIN TRY
            --INICIO TRANSACCION
            BEGIN TRAN;
            -- Declarar la variable @msj, es la que retornara el procedimiento como MensajeError
            DECLARE @msj NVARCHAR(100);

            -- Inicio del Update de la tabla [Plani].[tbCatalogoDePlanillas]
            UPDATE [Plani].[tbCatalogoDePlanillas]
              SET 
                  [cpla_DescripcionPlanilla] = @cpla_DescripcionPlanilla, 
                  [cpla_FrecuenciaEnDias] = @cpla_FrecuenciaEnDias, 
                  [cpla_UsuarioModifica] = @cpla_UsuarioModifica, 
                  [cpla_FechaModifica] = @cpla_FechaModifica
            WHERE cpla_IdPlanilla = @cpla_IdPlanilla;

            -- @cpla_IdPlanilla, era el Id a retornar por el procedimiento almacenado
            SELECT CAST(@cpla_IdPlanilla AS VARCHAR) AS MensajeError;
            COMMIT TRAN;
        END TRY
        -- Inicio del catch
        BEGIN CATCH
            ROLLBACK TRAN;
            -- Retornar -1 para detectar que hubo un error al guardar el registro, y que lo vuelva a intentar
            SET @msj = '-1' + ERROR_MESSAGE();
            SELECT @msj AS MensajeError;
        END CATCH;
    END;
GO
/****** Object:  StoredProcedure [Plani].[UDP_Plani_tbDecimoTercerMes_Insert]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Plani].[UDP_Plani_tbDecimoTercerMes_Insert]
    (
		@emp_Id int,
		@dtm_DecimoTercer decimal(18,3)
    )
AS
BEGIN
    BEGIN TRAN
       DECLARE @msj nvarchar(100)
        BEGIN TRY

            DECLARE @dtm_IdDecimoTercerMes INT
            SET @dtm_IdDecimoTercerMes = (SELECT ISNULL(MAX(@dtm_IdDecimoTercerMes) + 1, 1) FROM Plani.tbDecimoTercerMes);

			INSERT INTO [Plani].[tbDecimoTercerMes]
			           ([dtm_FechaPago]
			           ,[dtm_UsuarioCrea]
			           ,[dtm_FechaCrea]			           
			           ,[emp_Id]
			           ,[dtm_Monto]
					   ,[dtm_CodigoPago]
					   )
			     VALUES
			           (GETDATE(),1,GETDATE(),@emp_Id,@dtm_DecimoTercer,CONCAT(YEAR(GETDATE()),@emp_Id))


          COMMIT TRAN
          SET  @msj  = @dtm_IdDecimoTercerMes
          SELECT @msj as MensajeError
    END TRY
    BEGIN CATCH
    ROLLBACK TRAN
             SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError;
    END CATCH
END
GO
/****** Object:  StoredProcedure [Plani].[UDP_Plani_tbDeduccionesExtraordinarias_Inactivar]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Plani].[UDP_Plani_tbDeduccionesExtraordinarias_Inactivar]
(
	@dex_IdDeduccionesExtra INT,
	@dex_UsuarioModifica INT,
	@dex_FechaModifica DATETIME
)
AS
BEGIN
    BEGIN TRAN
        DECLARE @msj nvarchar(100)
            BEGIN TRY
                UPDATE [Plani].[tbDeduccionesExtraordinarias]
				SET dex_Activo = 0,
					dex_UsuarioModifica = @dex_UsuarioModifica,
					dex_FechaModifica = @dex_FechaModifica
					WHERE dex_IdDeduccionesExtra = @dex_IdDeduccionesExtra
                COMMIT TRAN
                SET @msj = '1'
            END TRY
            BEGIN CATCH
				ROLLBACK TRAN
				SET @msj = '-1' + ERROR_MESSAGE()
            END CATCH
				SELECT @msj AS MensajeError
END
GO
/****** Object:  StoredProcedure [Plani].[UDP_Plani_tbDeduccionesExtraordinarias_Insert]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Plani].[UDP_Plani_tbDeduccionesExtraordinarias_Insert]
(
	@eqem_Id INT,
	@dex_MontoInicial DECIMAL(10,2),
	@dex_MontoRestante DECIMAL(10,2),
	@dex_ObservacionesComentarios NVARCHAR(100),
	@cde_IdDeducciones INT,
	@dex_Cuota DECIMAL(16,2),
	@dex_UsuarioCrea INT,
	@dex_FechaCrea DATETIME
)
AS
BEGIN
    BEGIN TRAN
        DECLARE @msj nvarchar(100)
            BEGIN TRY
				DECLARE @dex_IdDeduccionesExtra INT
				SET @dex_IdDeduccionesExtra = (SELECT ISNULL(MAX(dex_IdDeduccionesExtra) + 1, 1) FROM [Plani].[tbDeduccionesExtraordinarias]);
                INSERT INTO [Plani].[tbDeduccionesExtraordinarias]
                (
                    dex_IdDeduccionesExtra, 
					eqem_Id, 
					dex_MontoInicial, 
					dex_MontoRestante, 
					dex_ObservacionesComentarios, 
					cde_IdDeducciones, 
					dex_Cuota, 
					dex_UsuarioCrea, 
					dex_FechaCrea, 
					dex_Activo
                )
                VALUES
                (	
					@dex_IdDeduccionesExtra,
                    @eqem_Id,
					@dex_MontoInicial,
					@dex_MontoRestante,
					@dex_ObservacionesComentarios,
					@cde_IdDeducciones,
					@dex_Cuota,
					@dex_UsuarioCrea,
					@dex_FechaCrea,
					1
                )
                COMMIT TRAN
                SET @msj = @dex_IdDeduccionesExtra
            END TRY
            BEGIN CATCH
				ROLLBACK TRAN
				SET @msj = '-1' + ERROR_MESSAGE()
            END CATCH
				SELECT @msj AS MensajeError
END
GO
/****** Object:  StoredProcedure [Plani].[UDP_Plani_tbDeduccionesExtraordinarias_Update]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Plani].[UDP_Plani_tbDeduccionesExtraordinarias_Update]
(
	@dex_IdDeduccionesExtra INT,
	@eqem_Id INT,
	@dex_MontoInicial DECIMAL(10,2),
	@dex_MontoRestante DECIMAL(10,2),
	@dex_ObservacionesComentarios NVARCHAR(100),
	@cde_IdDeducciones INT,
	@dex_Cuota DECIMAL(16,2),
	@dex_UsuarioModifica INT,
	@dex_FechaModifica DATETIME
)
AS
BEGIN
    BEGIN TRAN
        DECLARE @msj nvarchar(100)
            BEGIN TRY
                UPDATE [Plani].[tbDeduccionesExtraordinarias]
				SET eqem_Id = @eqem_Id, 
					dex_MontoInicial = @dex_MontoInicial,
					dex_MontoRestante = @dex_MontoRestante,
					dex_ObservacionesComentarios = @dex_ObservacionesComentarios,
					cde_IdDeducciones = @cde_IdDeducciones,
					dex_Cuota = @dex_Cuota,
					dex_UsuarioModifica = @dex_UsuarioModifica,
					dex_FechaModifica = @dex_FechaModifica
					WHERE dex_IdDeduccionesExtra = @dex_IdDeduccionesExtra
					SELECT CAST(@dex_IdDeduccionesExtra AS VARCHAR) AS MensajeError
                COMMIT TRAN
                SET @msj = '1'
            END TRY
            BEGIN CATCH
				ROLLBACK TRAN
				SET @msj = '-1' + ERROR_MESSAGE()
            END CATCH
				SELECT @msj AS MensajeError
END
GO
/****** Object:  StoredProcedure [Plani].[UDP_Plani_tbEmpleadoBonos_Inactivar]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Plani].[UDP_Plani_tbEmpleadoBonos_Inactivar]
(
	@cb_Id int,	
	@cb_UsuarioModifica int,
	@cb_FechaModifica datetime
)
AS
BEGIN
	BEGIN TRAN
	DECLARE @msj nvarchar(100)
		BEGIN TRY
			UPDATE [Plani].[tbEmpleadoBonos] 
				SET
				cb_Activo = 0,
				cb_UsuarioModifica = @cb_UsuarioModifica,
				cb_FechaModifica = @cb_FechaModifica
			WHERE cb_Id = @cb_Id

			COMMIT TRAN
			SET @msj = @cb_Id
			SELECT @msj AS MensajeError
		END TRY
		BEGIN CATCH
			ROLLBACK TRAN
				SELECT '-1' + ERROR_MESSAGE() AS MensajeError
		END CATCH
END
GO
/****** Object:  StoredProcedure [Plani].[UDP_Plani_tbEmpleadoBonos_Insert]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Plani].[UDP_Plani_tbEmpleadoBonos_Insert]
(
	@emp_Id int,
	@cin_IdIngreso int,
	@cb_Monto decimal(10,2),
	@cb_FechaRegistro datetime,
	@cb_Pagado bit,
	@cb_UsuarioCrea int,
	@cb_FechaCrea datetime
	
)
AS
BEGIN
	BEGIN TRAN
	DECLARE @msj nvarchar(100)
		BEGIN TRY
			DECLARE @cb_Id INT
            SET @cb_Id = (SELECT ISNULL(MAX(cb_Id) + 1, 1) FROM [Plani].[tbEmpleadoBonos])

			INSERT INTO [Plani].[tbEmpleadoBonos]
			(cb_Id, emp_Id, cin_IdIngreso, cb_Monto, cb_FechaRegistro, cb_Pagado, cb_UsuarioCrea, cb_FechaCrea, cb_Activo)
			VALUES
			(
			@cb_Id,
			@emp_Id,
			@cin_IdIngreso,
			@cb_Monto,
			@cb_FechaRegistro,
			@cb_Pagado,
			@cb_UsuarioCrea,
			@cb_FechaCrea,
			1
			)

			COMMIT TRAN
			SET @msj = @cb_Id
			SELECT @msj AS MensajeError
		END TRY
		BEGIN CATCH
			ROLLBACK TRAN
				SELECT '-1' + ERROR_MESSAGE() AS MensajeError
		END CATCH
END
GO
/****** Object:  StoredProcedure [Plani].[UDP_Plani_tbEmpleadoBonos_Update]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Plani].[UDP_Plani_tbEmpleadoBonos_Update]
(
	@cb_Id int,
	@emp_Id int, --depende si se va a dejar la opcion de modificar el empleado que recibe el bono
	@cin_IdIngreso int,
	@cb_Monto decimal(10,2),
	@cb_FechaRegistro datetime,
	@cb_Pagado bit,
	@cb_UsuarioModifica int,
	@cb_FechaModifica datetime
)
AS
BEGIN
	 BEGIN TRAN
	 DECLARE @msj nvarchar(100)
		BEGIN TRY
			
			UPDATE [Plani].[tbEmpleadoBonos] 
				SET
				emp_Id				= @emp_Id,
				cin_IdIngreso		= @cin_IdIngreso,
				cb_Monto			= @cb_Monto,
				cb_FechaRegistro	= @cb_FechaRegistro,
				cb_Pagado			= @cb_Pagado,
				cb_UsuarioModifica	= @cb_UsuarioModifica,
				cb_FechaModifica	= @cb_FechaModifica
			WHERE cb_Id = @cb_Id

			COMMIT TRAN
			SET @msj = @cb_Id
			SELECT @msj AS MensajeError
		END TRY
		BEGIN CATCH
			ROLLBACK TRAN
				SELECT '-1' + ERROR_MESSAGE() AS MensajeError
		END CATCH
END
GO
/****** Object:  StoredProcedure [Plani].[UDP_Plani_tbFormaPago_Inactivar]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Plani].[UDP_Plani_tbFormaPago_Inactivar] 
(
@fpa_IdFormaPago int
)
AS
BEGIN
    BEGIN TRAN
        DECLARE @msj nvarchar(100)
            BEGIN TRY           
                UPDATE [Plani].[tbFormaPago]
               SET 			    
			   fpa_Activo = 0
			   WHERE fpa_IdFormaPago = @fpa_IdFormaPago
                COMMIT TRAN
                SET @msj = @fpa_IdFormaPago
				SELECT @msj AS MensajeError
            END TRY
            BEGIN CATCH
            ROLLBACK TRAN
                SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
            END CATCH
      END
GO
/****** Object:  StoredProcedure [Plani].[UDP_Plani_tbInstitucionesFinancieras_Insert]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Plani].[UDP_Plani_tbInstitucionesFinancieras_Insert]
    (
        @insf_DescInstitucionFinanc NVARCHAR(50),
		@insf_Contacto NVARCHAR(50),
		@insf_Telefono NVARCHAR(50),
		@insf_Correo NVARCHAR(50),
		@insf_UsuarioCrea INT,
		@insf_FechaCrea DATETIME,
		@insf_Activo BIT)
AS
BEGIN
    BEGIN TRAN
       DECLARE @msj nvarchar(100)
        BEGIN TRY
            DECLARE @insf_IdInstitucionFinanciera INT
            SET @insf_IdInstitucionFinanciera = (SELECT ISNULL(MAX(insf_IdInstitucionFinanciera) + 1, 1) FROM [Plani].[tbInstitucionesFinancieras]);
           INSERT INTO [Plani].[tbInstitucionesFinancieras]
           ([insf_IdInstitucionFinanciera],[insf_DescInstitucionFinanc],[insf_Contacto],[insf_Telefono],[insf_Correo],
		   [insf_UsuarioCrea],[insf_FechaCrea],[insf_Activo])
	    VALUES(
           @insf_IdInstitucionFinanciera,
		   @insf_DescInstitucionFinanc,
		   @insf_Contacto,
		   @insf_Telefono,
		   @insf_Correo ,
		   @insf_UsuarioCrea ,
		   @insf_FechaCrea ,
		   @insf_Activo)
          COMMIT TRAN
          SET  @msj  = @insf_IdInstitucionFinanciera
          SELECT @msj as MensajeError
    END TRY
    BEGIN CATCH
    ROLLBACK TRAN
             SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError;
    END CATCH
END
 


GO
/****** Object:  StoredProcedure [Plani].[UDP_Plani_tbInstitucionesFinancieras_Update]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [Plani].[UDP_Plani_tbInstitucionesFinancieras_Update]
    (
	    @insf_IdInstitucionFinanciera INT,
        @insf_DescInstitucionFinanc NVARCHAR(50),
		@insf_Contacto NVARCHAR(50),
		@insf_Telefono NVARCHAR(50),
		@insf_Correo NVARCHAR(50),
		@insf_UsuarioModifica INT,
		@insf_FechaModifica DATETIME,
		@insf_Activo BIT)
AS
BEGIN
    BEGIN TRAN
       DECLARE @msj nvarchar(100)
        BEGIN TRY
            --DECLARE @insf_IdInstitucionFinanciera INT
            --SET @insf_IdInstitucionFinanciera = (SELECT ISNULL(MAX(insf_IdInstitucionFinanciera) + 1, 1) FROM [Plani].[tbInstitucionesFinancieras]);
     		UPDATE [Plani].[tbInstitucionesFinancieras]
			   SET [insf_DescInstitucionFinanc] = @insf_DescInstitucionFinanc,
				   [insf_Contacto] = @insf_Contacto,
				   [insf_Telefono] = @insf_Telefono,
				   [insf_Correo] = @insf_Correo,
				   [insf_UsuarioModifica] = @insf_UsuarioModifica,
				   [insf_FechaModifica] = @insf_FechaModifica,
				   [insf_Activo] = @insf_Activo
			 WHERE  [insf_IdInstitucionFinanciera] = @insf_IdInstitucionFinanciera
			
          COMMIT TRAN
          SET  @msj  = @insf_IdInstitucionFinanciera
          SELECT @msj as MensajeError
    END TRY
    BEGIN CATCH
    ROLLBACK TRAN
             SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError;
    END CATCH
END
GO
/****** Object:  StoredProcedure [Plani].[UDP_Plani_tbTechosDeducciones_Inactivar]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Plani].[UDP_Plani_tbTechosDeducciones_Inactivar] 
(
@tede_Id int,
@tede_UsuarioModifica int,
@tede_FechaModifica datetime
)
AS
BEGIN
    BEGIN TRAN
        DECLARE @msj nvarchar(100)
            BEGIN TRY           
                UPDATE [Plani].[tbTechosDeducciones]
               SET 			    
			   tede_Activo = 0,
			   tede_UsuarioModifica = @tede_UsuarioModifica,
			   tede_FechaModifica = @tede_FechaModifica
			   WHERE tede_Id = @tede_Id
                COMMIT TRAN
                SET @msj = @tede_Id
				SELECT @msj AS MensajeError
            END TRY
            BEGIN CATCH
            ROLLBACK TRAN
                SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
            END CATCH
        END
GO
/****** Object:  StoredProcedure [Plani].[UDP_Plani_tbTechosDeducciones_Insert]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Plani].[UDP_Plani_tbTechosDeducciones_Insert]
(
@tede_RangoInicial decimal (10,2),
@tede_RangoFinal decimal (10,2),
@tede_Porcentaje int,
@cde_IdDeduccion int,
@tede_UsuarioCrea int,
@tede_FechaCrea DATETIME
)
AS
BEGIN
    BEGIN TRAN
        DECLARE @msj nvarchar(100)
            BEGIN TRY
            DECLARE @IdTechosDeducciones INT
            SET @IdTechosDeducciones = (SELECT ISNULL(MAX(tede_Id) + 1, 1) FROM [Plani].[tbTechosDeducciones]);
                INSERT INTO [Plani].[tbTechosDeducciones]
                (
                    tede_Id, tede_RangoInicial, tede_RangoFinal, tede_Porcentaje, cde_IdDeducciones, tede_UsuarioCrea, tede_FechaCrea, tede_Activo
                )
                VALUES
                (
                    @IdTechosDeducciones,
                    @tede_RangoInicial,
                    @tede_RangoFinal,
                    @tede_Porcentaje,
                    @cde_IdDeduccion,
                    @tede_UsuarioCrea,
                    @tede_FechaCrea,
					1
                )
                COMMIT TRAN
                SET @msj = @IdTechosDeducciones
				SELECT @msj AS MensajeError
            END TRY
            BEGIN CATCH
            ROLLBACK TRAN
                SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
            END CATCH
        END

GO
/****** Object:  StoredProcedure [Plani].[UDP_Plani_tbTechosDeducciones_Update]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [Plani].[UDP_Plani_tbTechosDeducciones_Update] 
(
@tede_Id int,
@tede_RangoInicial decimal (10,2),
@tede_RangoFinal decimal (10,2),
@tede_Porcentaje int,
@cde_IdDeduccion int,
@tede_UsuarioModifica int,
@tede_FechaModifica DATETIME
)
AS
BEGIN
    BEGIN TRAN
        DECLARE @msj nvarchar(100)
            BEGIN TRY           
                UPDATE [Plani].[tbTechosDeducciones]
               SET 			    
			   tede_RangoInicial = @tede_RangoInicial, 
			   tede_RangoFinal = @tede_RangoFinal, 
			   tede_Porcentaje = @tede_Porcentaje, 
			   cde_IdDeducciones = @cde_IdDeduccion, 
			   tede_UsuarioModifica = @tede_UsuarioModifica, 
			   tede_FechaModifica = @tede_FechaModifica
			   WHERE tede_Id = @tede_Id
                COMMIT TRAN
                SET @msj = @tede_Id
				SELECT @msj AS MensajeError
            END TRY
            BEGIN CATCH
            ROLLBACK TRAN                
				SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
            END CATCH
        END

GO
/****** Object:  StoredProcedure [Plani].[UDP_Plani_tbTipoDeduccion_Inactivar]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Plani].[UDP_Plani_tbTipoDeduccion_Inactivar]
    (
	   @tde_IdTipoDedu int,
	   @tde_UsuarioModifica int,
	   @tde_FechaModifica datetime
    )
AS
BEGIN
    BEGIN TRAN
       DECLARE @msj nvarchar(100)  
        BEGIN TRY
		SET NOCOUNT ON
           UPDATE  [Plani].[tbTipoDeduccion] 
		   SET    tde_Activo = 0 ,
				  tde_UsuarioModifica =   @tde_UsuarioModifica,
				  tde_FechaModifica = @tde_FechaModifica
            WHERE tde_IdTipoDedu = @tde_IdTipoDedu
			   
          COMMIT TRAN
		  SET  @msj  =CAST( @tde_IdTipoDedu AS nvarchar)		  
    END TRY
    BEGIN CATCH
    ROLLBACK TRAN
             SELECT '-1' + ERROR_MESSAGE() AS MensajeError
    END CATCH
	SELECT @msj as MensajeError
END
GO
/****** Object:  StoredProcedure [Plani].[UDP_Plani_tbTipoDeduccion_Insert]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---PROCEDIMIENTO ALMACENADO DE LA TABLA TIPODEDUCCION (INSERT).
CREATE PROCEDURE [Plani].[UDP_Plani_tbTipoDeduccion_Insert]
    (
       @tde_Descripcion nvarchar(50),
	   @tde_UsuarioCrea int,
	   @tde_FechaCrea datetime
    )
AS
BEGIN
    BEGIN TRAN
       DECLARE @msj nvarchar(100)  
        BEGIN TRY
		DECLARE @tde_IdTipoDedu int
		SET @tde_IdTipoDedu = (SELECT ISNULL(MAX(tde_IdTipoDedu) + 1, 1) FROM [Plani].[tbTipoDeduccion]);
            INSERT INTO [Plani].[tbTipoDeduccion]
            (
              tde_IdTipoDedu, 
			  tde_Descripcion, 
			  tde_Activo, 
			  tde_UsuarioCrea, 
			  tde_FechaCrea
            )
            VALUES
            (
                (SELECT ISNULL(MAX(tde_IdTipoDedu) + 1, 1) FROM [Plani].[tbTipoDeduccion]),
                @tde_Descripcion,
				1,
                @tde_UsuarioCrea,
				@tde_FechaCrea
             )
          COMMIT TRAN
          SET  @msj  = @tde_IdTipoDedu
		  SELECT @msj as MensajeError
    END TRY
    BEGIN CATCH
    ROLLBACK TRAN
             SET  @msj  = '-1' + ERROR_MESSAGE()
    END CATCH
END
GO
/****** Object:  StoredProcedure [Plani].[UDP_Plani_tbTipoDeduccion_Update]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Plani].[UDP_Plani_tbTipoDeduccion_Update]
    (
	   @tde_IdTipoDedu int,
       @tde_Descripcion nvarchar(50),
	   @tde_UsuarioModifica int,
	   @tde_FechaModifica datetime
    )
AS
BEGIN
    BEGIN TRAN
       DECLARE @msj nvarchar(100)  
        BEGIN TRY
            UPDATE [Plani].[tbTipoDeduccion] 
		    SET tde_Descripcion = @tde_Descripcion,
				tde_UsuarioModifica = @tde_UsuarioModifica,
				tde_FechaModifica =  @tde_FechaModifica
           WHERE tde_IdTipoDedu = @tde_IdTipoDedu
		     	
          COMMIT TRAN
		  SET  @msj  = @tde_IdTipoDedu
		  SELECT @msj as MensajeError
    END TRY
    BEGIN CATCH
    ROLLBACK TRAN
             SET  @msj  = '-1' + ERROR_MESSAGE()
    END CATCH
END
GO
/****** Object:  StoredProcedure [Plani].[UDP_tbTipoPlanillaDetalleDeduccion_Insert]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Plani].[UDP_tbTipoPlanillaDetalleDeduccion_Insert]
(
     -- Declarar los parametros que recibe el procedimiento almacenado
     @cde_IdDeducciones INT
   , @cpla_IdPlanilla   INT
   , @tpdd_UsuarioCrea  INT
   , @tpdd_FechaCrea    DATETIME
)
AS
    BEGIN
        -- Inicio del try
        BEGIN TRY
            --INICIO TRANSACCION
            BEGIN TRAN;
            -- Declarar la variable @tpdd_IdPlanillaDetDeduccion, es la que retornara el procedimiento como MensajeError
            DECLARE @tpdd_IdPlanillaDetDeduccion INT;
            SET @tpdd_IdPlanillaDetDeduccion =
            (
                SELECT ISNULL(MAX([tpdd_IdPlanillaDetDeduccion]) + 1, 1)
                FROM [Plani].[tbTipoPlanillaDetalleDeduccion]
            );

            -- Inicio del Insert de la tabla [Plani].[tbTipoPlanillaDetalleDeduccion]
            INSERT INTO [Plani].[tbTipoPlanillaDetalleDeduccion]
            ([tpdd_IdPlanillaDetDeduccion], 
             [cpla_IdPlanilla], 
             [cde_IdDeducciones], 
             [tpdd_UsuarioCrea], 
             [tpdd_FechaCrea], 
             [tpdd_Activo]
            )
            VALUES
            (@tpdd_IdPlanillaDetDeduccion, 
             @cpla_IdPlanilla, 
             @cde_IdDeducciones, 
             @tpdd_UsuarioCrea, 
             @tpdd_FechaCrea, 
             1
            );

            -- @tpdd_IdPlanillaDetDeduccion, era el Id a retornar por el procedimiento almacenado
            SELECT CAST(@tpdd_IdPlanillaDetDeduccion AS VARCHAR) AS MensajeError;
            COMMIT TRAN;
        END TRY
        -- Inicio del catch
        BEGIN CATCH
            ROLLBACK TRAN;
            -- Retornar -1 para detectar que hubo un error al guardar el registro, y que lo vuelva a intentar
            SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError;
        END CATCH;
    END;
GO
/****** Object:  StoredProcedure [Plani].[UDP_tbTipoPlanillaDetalleDeduccion_Update]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Plani].[UDP_tbTipoPlanillaDetalleDeduccion_Update]
(
     -- Declarar los parametros que recibe el procedimiento almacenado
	  @tpdd_IdPlanillaDetDeduccion INT
)
AS
    BEGIN
        -- Inicio del try
        BEGIN TRY
            --INICIO TRANSACCION
            BEGIN TRAN;

	DELETE FROM [Plani].[tbTipoPlanillaDetalleDeduccion] 
	WHERE  [cde_IdDeducciones]= @tpdd_IdPlanillaDetDeduccion

            -- @tpdd_IdPlanillaDetDeduccion, era el Id a retornar por el procedimiento almacenado
            SELECT CAST(1 AS VARCHAR) AS MensajeError;
            COMMIT TRAN;
        END TRY
        -- Inicio del catch
        BEGIN CATCH
            ROLLBACK TRAN;
            -- Retornar -1 para detectar que hubo un error al guardar el registro, y que lo vuelva a intentar
            SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError;
        END CATCH;
    END;
GO
/****** Object:  StoredProcedure [Plani].[UDP_tbTipoPlanillaDetalleIngreso_Insert]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Plani].[UDP_tbTipoPlanillaDetalleIngreso_Insert]
(
     -- Declarar los parametros que recibe el procedimiento almacenado
     @cin_IdIngreso    INT
   , @cpla_IdPlanilla  INT
   , @tpdi_UsuarioCrea INT
   , @tpdi_FechaCrea   DATETIME
)
AS
    BEGIN
        -- Inicio del try
        BEGIN TRY
            --INICIO TRANSACCION
            BEGIN TRAN;
            -- Declarar la variable @tpdi_IdDetallePlanillaIngreso, es la que retornara el procedimiento como MensajeError
            DECLARE @tpdi_IdDetallePlanillaIngreso INT;
            SET @tpdi_IdDetallePlanillaIngreso =
            (
                SELECT ISNULL(MAX([tpdi_IdDetallePlanillaIngreso]) + 1, 1)
                FROM [Plani].[tbTipoPlanillaDetalleIngreso]
            );

            -- Inicio del Insert de la tabla [Plani].[tbTipoPlanillaDetalleIngreso]
            INSERT INTO [Plani].[tbTipoPlanillaDetalleIngreso]
            (
			 [tpdi_IdDetallePlanillaIngreso], 
             [cin_IdIngreso], 
             [cpla_IdPlanilla], 
             [tpdi_UsuarioCrea], 
             [tpdi_FechaCrea], 
             [tpdi_Activo]
            )
            VALUES
            (
			 @tpdi_IdDetallePlanillaIngreso, 
             @cin_IdIngreso, 
             @cpla_IdPlanilla, 
             @tpdi_UsuarioCrea, 
             @tpdi_FechaCrea, 
             1
            );

            -- @tpdi_IdDetallePlanillaIngreso, era el Id a retornar por el procedimiento almacenado
            SELECT CAST(@tpdi_IdDetallePlanillaIngreso AS VARCHAR) AS MensajeError;
            COMMIT TRAN;
        END TRY
        -- Inicio del catch
        BEGIN CATCH
            ROLLBACK TRAN;
            -- Retornar -1 para detectar que hubo un error al guardar el registro, y que lo vuelva a intentar
            SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError;
        END CATCH;
    END;
GO
/****** Object:  StoredProcedure [Plani].[UDP_tbTipoPlanillaDetalleIngreso_Update]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Plani].[UDP_tbTipoPlanillaDetalleIngreso_Update]
(
-- Declarar los parametros que recibe el procedimiento almacenado
@tpdi_IdDetallePlanillaIngreso INT
)
AS
    BEGIN
        -- Inicio del try
        BEGIN TRY
            --INICIO TRANSACCION
            BEGIN TRAN;
            DELETE FROM [Plani].[tbTipoPlanillaDetalleIngreso]
            WHERE [cin_IdIngreso] = @tpdi_IdDetallePlanillaIngreso;

            -- @tpdi_IdDetallePlanillaIngreso, era el Id a retornar por el procedimiento almacenado
            SELECT CAST(1 AS VARCHAR) AS MensajeError;
            COMMIT TRAN;
        END TRY
        -- Inicio del catch
        BEGIN CATCH
            ROLLBACK TRAN;
            -- Retornar -1 para detectar que hubo un error al guardar el registro, y que lo vuelva a intentar
            SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError;
        END CATCH;
    END;
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbCargos_Delete]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbCargos_Delete]
	(
		@car_Id int,
		@car_razon_Inactivo nvarchar(100),
		@car_UsuarioModifica int,
		@car_FechaModifica datetime
	) 
	AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @car_id 
	UPDATE[RRHH].[tbCargos]
	SET   [car_Estado]=0,
		  [car_RazonInactivo] = @car_razon_Inactivo,
		  [car_UsuarioModifica]= @car_UsuarioModifica,
		  [car_FechaModifica]= @car_FechaModifica
	WHERE car_id =@car_id
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbCargos_Insert]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbCargos_Insert]
	(
		@car_Descripcion nvarchar(100),
		@car_UsuarioCrea int,
		@car_FechaCrea datetime
	) 
	AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = (SELECT ISNULL((SELECT MAX([car_Id]) FROM [RRHH].tbCargos),0) + 1)
	INSERT INTO [RRHH].tbCargos(
				car_Id, 
				car_Descripcion,
				car_Usuariocrea, 
				car_Fechacrea
	)
	VALUES(
				@Id,
				@car_Descripcion,
				@car_UsuarioCrea,
				@car_FechaCrea 
	)
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbCargos_Restore]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbCargos_Restore]
	(
		@car_Id int,

		@car_UsuarioModifica int,
		@car_FechaModifica datetime
	) 
	AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @car_id 
	UPDATE[RRHH].[tbCargos]
	SET   [car_Estado]=1,

		  [car_UsuarioModifica]= @car_UsuarioModifica,
		  [car_FechaModifica]= @car_FechaModifica
	WHERE car_id =@car_id
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbCargos_Update]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbCargos_Update]
	(
		@car_Id int,
		@car_Descripcion nvarchar(100),
		@car_UsuarioModifica int,
		@car_FechaModifica datetime
	) AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @car_Id
	UPDATE [RRHH].tbCargos
	SET    [car_Descripcion] = @car_Descripcion,
		   [car_UsuarioModifica] = @car_UsuarioModifica,
		   [car_FechaModifica] = @car_FechaModifica
	WHERE  Car_Id  = @car_Id AND Car_Estado = 1
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbCompetencias_Delete]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbCompetencias_Delete]
	(
		@comp_Id int,
		@comp_razon_Inactivo nvarchar(100),
		@comp_UsuarioModifica int,
		@comp_FechaModifica datetime
	) 
	AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @comp_Id 
	UPDATE [RRHH].[tbCompetencias]
	SET   [comp_Estado]=0,
		  [comp_RazonInactivo] = @comp_razon_Inactivo,
		  [comp_UsuarioModifica]= @comp_UsuarioModifica,
		  [comp_FechaModifica]= @comp_FechaModifica
	WHERE comp_Id =@comp_Id
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbCompetencias_Insert]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbCompetencias_Insert]
	(
		@comp_Descripcion nvarchar (100),
		@comp_UsuarioCrea int,
		@comp_FechaCrea datetime
	) 
	AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = (SELECT ISNULL((SELECT MAX([comp_Id]) FROM [RRHH].[tbCompetencias]),0) + 1)
	INSERT INTO [RRHH].[tbCompetencias](
				comp_Id, 
				comp_Descripcion, 
				comp_UsuarioCrea, 
				comp_FechaCrea
	)
	VALUES(
				@Id,
				@comp_Descripcion,
				@comp_UsuarioCrea,
				@comp_FechaCrea 
	)
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbCompetencias_Restore]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbCompetencias_Restore]
	(
		@comp_Id int,

		@comp_UsuarioModifica int,
		@comp_FechaModifica datetime
	) 
	AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @comp_Id 
	UPDATE [RRHH].[tbCompetencias]
	SET   [comp_Estado]=1,

		  [comp_UsuarioModifica]= @comp_UsuarioModifica,
		  [comp_FechaModifica]= @comp_FechaModifica
	WHERE comp_Id =@comp_Id
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbCompetencias_Update]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbCompetencias_Update]
	(
		@comp_Id int,
		@comp_Descripcion nvarchar(100),
		@comp_UsuarioModifica int,
		@comp_FechaModifica datetime
	) AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @comp_Id
	UPDATE [RRHH].tbCompetencias
	SET   [comp_Descripcion] = @comp_Descripcion,
		  [comp_UsuarioModifica] = @comp_UsuarioModifica,
		  [comp_FechaModifica] = @comp_FechaModifica
	WHERE comp_Id  = @comp_Id AND comp_Estado = 1
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbEmpresas_Delete]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbEmpresas_Delete]
	(
		@empr_Id int,
		@empr_razon_Inactivo nvarchar(100),
		@empr_UsuarioModifica int,
		@empr_FechaModifica datetime
	) 
	AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @empr_id 
	UPDATE [RRHH].[tbEmpresas]
	SET    [empr_Estado]=0,
		   [empr_RazonInactivo] = @empr_razon_Inactivo,
		   [empr_UsuarioModifica]=@empr_UsuarioModifica,
		   [empr_FechaModifica]= @empr_FechaModifica
	WHERE  empr_id =@empr_id
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbEmpresas_Insert]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbEmpresas_Insert]
	(
		@empr_Nombre nvarchar (100),
		@empr_usuarioCrea int,
		@empr_FechaCrea datetime
	) 
	AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = (SELECT ISNULL((SELECT MAX([empr_Id]) FROM [RRHH].[tbEmpresas]),0) + 1)
	INSERT INTO [RRHH].[tbEmpresas](
				empr_Id,
				empr_Nombre,
				empr_UsuarioCrea,
				empr_FechaCrea
	)
	VALUES(
				@Id,
				@empr_Nombre,
				@empr_usuarioCrea,
				@empr_FechaCrea
	)
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbEmpresas_Restore]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbEmpresas_Restore]
	(
		@empr_Id int,

		@empr_UsuarioModifica int,
		@empr_FechaModifica datetime
	) 
	AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @empr_id 
	UPDATE [RRHH].[tbEmpresas]
	SET    [empr_Estado]=1,

		   [empr_UsuarioModifica]=@empr_UsuarioModifica,
		   [empr_FechaModifica]= @empr_FechaModifica
	WHERE  empr_id =@empr_id
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbEmpresas_Select]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbEmpresas_Select]
(
@empr_Id int
) AS
set nocount on;
BEGIN
BEGIN TRY
BEGIN TRAN
declare @Id int
set @Id = @empr_Id
SELECT 
[empr_Nombre], 
[empr_Estado],
[empr_RazonInactivo]
FROM
[ERP_GMEDINA].[RRHH].[tbEmpresas]
WHERE [empr_Id]=@empr_Id AND [empr_Estado] = 1

SELECT CAST(@Id AS VARCHAR) AS MensajeError
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
END CATCH
END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbEmpresas_Update]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbEmpresas_Update]
	(
		@empr_Id int,
		@empr_Nombre nvarchar (100),
		@empr_usuarioModifica int,
		@empr_FechaModifica datetime
	) AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @empr_Id
	UPDATE [RRHH].tbEmpresas
	SET    [empr_Nombre] = @empr_Nombre,
		   [empr_UsuarioModifica] = @empr_UsuarioModifica,
		   [empr_FechaModifica] = @empr_FechaModifica
	WHERE  empr_Id  = @empr_Id AND empr_Estado = 1
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbEquipoTrabajo_Delete]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------------------------DELETE Equipo Trabajo----
	CREATE PROCEDURE [rrhh].[UDP_RRHH_tbEquipoTrabajo_Delete]
	(
		@eqtra_Id int,
		@eqtra_RazonInactivo nvarchar(100),
		@eqtra_UsuarioModifica int,
		@eqtra_FechaModifica datetime
	) 
	AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @eqtra_Id  
	UPDATE [RRHH].[tbEquipoTrabajo]
	SET   [eqtra_Estado]=0,
		  eqtra_RazonInactivo = @eqtra_RazonInactivo,
		  eqtra_UsuarioModifica = @eqtra_UsuarioModifica,
		  eqtra_FechaModifica = @eqtra_FechaModifica
	WHERE eqtra_Id = @eqtra_Id
	SELECT @Id AS MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbEquipoTrabajo_Insert]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [rrhh].[UDP_RRHH_tbEquipoTrabajo_Insert]
	(
		@eqtra_Codigo nvarchar(25), 
		@eqtra_Descripcion nvarchar(50), 
		@eqtra_Observacion nvarchar(50),  
		@eqtra_UsuarioCrea int, 
		@eqtra_FechaCrea datetime
	) 
	AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = (SELECT ISNULL((SELECT MAX(eqtra_Id) FROM  [rrhh].[tbEquipoTrabajo]),0) + 1)
	INSERT INTO [rrhh].[tbEquipoTrabajo](
				eqtra_Id, 
				eqtra_Codigo,
				eqtra_Descripcion,
				eqtra_Observacion,
				eqtra_UsuarioCrea,
				eqtra_FechaCrea		    
	)
	VALUES(
				@Id,
				@eqtra_Codigo,
				@eqtra_Descripcion,
				@eqtra_Observacion,
				@eqtra_UsuarioCrea,
				@eqtra_FechaCrea	

	)
	SELECT @Id AS MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbEquipoTrabajo_Restore]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------------------------Restore Equipo Trabajo----
	CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbEquipoTrabajo_Restore]
	(
		@eqtra_Id int,

		@eqtra_UsuarioModifica int,
		@eqtra_FechaModifica datetime
	) 
	AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @eqtra_Id  
	UPDATE [RRHH].[tbEquipoTrabajo]
	SET   [eqtra_Estado]=1,

		  eqtra_UsuarioModifica = @eqtra_UsuarioModifica,
		  eqtra_FechaModifica = @eqtra_FechaModifica
	WHERE eqtra_Id = @eqtra_Id
	SELECT @Id AS MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbEquipoTrabajo_Update]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [rrhh].[UDP_RRHH_tbEquipoTrabajo_Update]
	(   
	    @eqtra_Id INT,
		@eqtra_Codigo nvarchar(25), 
		@eqtra_Descripcion nvarchar(50), 
		@eqtra_Observacion nvarchar(50),  
		@eqtra_UsuarioModifica int, 
		@eqtra_FechaModifica datetime
	) 
	AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @eqtra_Id
	UPDATE [RRHH].tbEquipoTrabajo	    
	SET	   eqtra_Codigo = @eqtra_Codigo,
	       eqtra_Descripcion = @eqtra_Descripcion,
		   eqtra_Observacion = @eqtra_Observacion,
		   eqtra_UsuarioModifica = @eqtra_UsuarioModifica,
		   eqtra_FechaModifica = @eqtra_FechaModifica
	WHERE  eqtra_Id  = @eqtra_Id AND  eqtra_Estado= 1
	SELECT @Id AS MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbfasesReclutamiento_Delete]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbfasesReclutamiento_Delete]
	(
		@fare_Id int,
		@fare_razon_Inactivo nvarchar(100),
		@fare_UsuarioModifica int,
		@fare_FechaModifica datetime
	) 
	AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @fare_id 
	UPDATE [RRHH].tbfasesReclutamiento
	SET    [fare_Estado]=0,
		   [fare_RazonInactivo] = @fare_razon_Inactivo,
		   [fare_UsuarioModifica] = @fare_UsuarioModifica,
		   [fare_FechaModifica]= @fare_FechaModifica
	WHERE  fare_id =@fare_id
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbFasesReclutamiento_Insert]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [rrhh].[UDP_RRHH_tbFasesReclutamiento_Insert]
	(
		@fare_Descripcion nvarchar(100),
		@fare_UsuarioCrea int,
		@fare_FechaCrea datetime
	) 
	AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = (SELECT ISNULL((SELECT MAX([fare_Id]) FROM [RRHH].tbFasesReclutamiento),0) + 1)
	INSERT INTO [RRHH].tbFasesReclutamiento(
				fare_Id,
				fare_Descripcion,
				fare_UsuarioCrea, 
				fare_FechaCrea
	)
	VALUES(
				@Id,
				@fare_Descripcion,
				@fare_UsuarioCrea,
				@fare_FechaCrea 
	)
	SELECT @Id AS MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbfasesReclutamiento_Restore]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbfasesReclutamiento_Restore]
	(
		@fare_Id int,

		@fare_UsuarioModifica int,
		@fare_FechaModifica datetime
	) 
	AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @fare_id 
	UPDATE [RRHH].tbfasesReclutamiento
	SET    [fare_Estado]=1,

		   [fare_UsuarioModifica] = @fare_UsuarioModifica,
		   [fare_FechaModifica]= @fare_FechaModifica
	WHERE  fare_id =@fare_id
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbFasesReclutamiento_Update]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbFasesReclutamiento_Update]
	(
		@fare_Id int,
		@fare_Descripcion nvarchar(50),
		@fare_UsuarioModifica int,
		@fare_FechaModifica datetime
	) AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @fare_Id
	UPDATE [RRHH].[tbFasesReclutamiento]
	SET    [fare_Descripcion] = @fare_Descripcion,
		   [fare_UsuarioModifica] = @fare_UsuarioModifica,
		   [fare_FechaModifica] = @fare_FechaModifica
	WHERE  fare_Id  = @fare_Id AND fare_Estado = 1
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbHabilidades_Delete]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbHabilidades_Delete]
	(
		@habi_id int,
		@habi_razon_Inactivo nvarchar(100),
		@habi_UsuarioModifica int,
		@habi_FechaModifica datetime
	) 
	AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @habi_id 
	UPDATE [RRHH].tbHabilidades
	SET    [habi_Estado]=0,
		   [habi_RazonInactivo] = @habi_razon_Inactivo,
		   [habi_UsuarioModifica]=@habi_UsuarioModifica,
		   [habi_FechaModifica]= @habi_FechaModifica
	WHERE  habi_Id =@habi_id
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbHabilidades_Insert]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbHabilidades_Insert]
	(
		@habi_Descripcion nvarchar(100),
		@habi_UsuarioCrea  int,
		@habi_FechaCrea datetime
	) 
	AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = (SELECT ISNULL((SELECT MAX([habi_Id]) FROM [RRHH].tbHabilidades),0) + 1)
	INSERT INTO [RRHH].tbHabilidades(
				habi_Id,
				habi_Descripcion,
				habi_UsuarioCrea, 
				habi_FechaCrea
	)
	VALUES(
				@Id,
				@habi_Descripcion,
				@habi_UsuarioCrea,
				@habi_FechaCrea 
	)
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbHabilidades_Restore]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbHabilidades_Restore]
	(
		@habi_id int,

		@habi_UsuarioModifica int,
		@habi_FechaModifica datetime
	) 
	AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @habi_id 
	UPDATE [RRHH].tbHabilidades
	SET    [habi_Estado]=1,

		   [habi_UsuarioModifica]=@habi_UsuarioModifica,
		   [habi_FechaModifica]= @habi_FechaModifica
	WHERE  habi_Id =@habi_id
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbHabilidades_Update]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbHabilidades_Update]
	(
		@habi_Id int,
		@habi_Descripcion nvarchar(50),
		@habi_UsuarioModifica int,
		@habi_FechaModifica datetime
	) AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @habi_Id
	UPDATE [RRHH].[tbHabilidades]
	SET    [habi_Descripcion] = @habi_Descripcion,
		   [habi_UsuarioModifica] = @habi_UsuarioModifica,
		   [habi_FechaModifica] = @habi_FechaModifica
	WHERE  habi_Id  = @habi_Id  AND habi_Estado = 1
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbHorarios_Delete]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROCEDURE [rrhh].[UDP_RRHH_tbHorarios_Delete]
  (
    @hor_Id int,
    @hor_RazonInactivo nvarchar(100),
    @hor_UsuarioModifica int,
    @hor_FechaModifica datetime
  )
  AS
  SET NOCOUNT ON
  BEGIN
  BEGIN TRY
    BEGIN TRAN
  DECLARE @Id INT
  SET @Id = @hor_Id
    UPDATE ERP_GMEDINA.rrhh.tbHorarios 
     SET 
      hor_Estado = 0
      ,hor_RazonInactivo = @hor_RazonInactivo
      ,hor_UsuarioModifica = @hor_UsuarioModifica
      ,hor_FechaModifica = @hor_FechaModifica
     WHERE hor_Id = @hor_Id
  SELECT
    CAST(@Id AS VARCHAR(10)) AS MensajeError
  COMMIT TRAN
  END TRY
  BEGIN CATCH
    ROLLBACK TRAN
  SELECT '-1' + ERROR_MESSAGE() AS MensajeError
  END CATCH
  END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbHorarios_Insert]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [rrhh].[UDP_RRHH_tbHorarios_Insert]
  (
    @jor_Id int,
    @hor_Descripcion nvarchar(50),
    @hor_HoraInicio time,
    @hor_HoraFin time,
    @hor_CantidadHoras time,
    @hor_UsuarioCrea int,
    @hor_FechaCrea datetime
  )
  AS
  SET NOCOUNT ON
  BEGIN
  BEGIN TRY
    BEGIN TRAN
  DECLARE @Id INT
  SET @Id = (SELECT ISNULL((SELECT MAX(hor_Id) FROM ERP_GMEDINA.rrhh.tbHorarios), 0) + 1)
  INSERT INTO rrhh.tbHorarios (hor_Id, jor_Id, hor_Descripcion, hor_HoraInicio, hor_HoraFin, hor_CantidadHoras, hor_UsuarioCrea, hor_FechaCrea)
  VALUES (@Id, @jor_Id, @hor_Descripcion, @hor_HoraInicio, @hor_HoraFin, @hor_CantidadHoras , @hor_UsuarioCrea, @hor_FechaCrea)
  SELECT
    CAST(@Id AS VARCHAR(10)) AS MensajeError
  COMMIT TRAN
  END TRY
  BEGIN CATCH
    ROLLBACK TRAN
  SELECT '-1' + ERROR_MESSAGE() AS MensajeError
  END CATCH
  END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbHorarios_Update]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  CREATE PROCEDURE [rrhh].[UDP_RRHH_tbHorarios_Update]
  (
    @hor_Id int,
    @hor_Descripcion nvarchar(50),
    @hor_HoraInicio time,
    @hor_HoraFin time,
    @hor_CantidadHoras time,
    @hor_UsuarioModifica int,
    @hor_FechaModifica datetime
  )
  AS
  SET NOCOUNT ON
  BEGIN
  BEGIN TRY
    BEGIN TRAN
  DECLARE @Id INT
  SET @Id = @hor_Id
    UPDATE ERP_GMEDINA.rrhh.tbHorarios 
     SET 
    hor_Descripcion = @hor_Descripcion
    ,hor_HoraInicio = @hor_HoraInicio
    ,hor_HoraFin = @hor_HoraFin
    ,hor_CantidadHoras = @hor_CantidadHoras
    ,hor_UsuarioModifica = @hor_UsuarioModifica
    ,hor_FechaModifica = @hor_FechaModifica
     WHERE hor_Id = @hor_Id
  SELECT
    CAST(@Id AS VARCHAR(10)) AS MensajeError
  COMMIT TRAN
  END TRY
  BEGIN CATCH
    ROLLBACK TRAN
  SELECT '-1' + ERROR_MESSAGE() AS MensajeError
  END CATCH
  END
  
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbIdiomas_Delete]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbIdiomas_Delete]
	(
		@idi_Id int,
		@idi_razon_Inactivo nvarchar(100),
		@idi_UsuarioModifica int,
		@idi_FechaModifica datetime
	) 
	AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @idi_id 
	UPDATE[RRHH].[tbIdiomas]
	SET   [idi_Estado]=0,
		  [idi_RazonInactivo] = @idi_razon_Inactivo,
		  [idi_UsuarioModifica]=@idi_UsuarioModifica,
		  [idi_FechaModifica]=@idi_FechaModifica
	WHERE idi_id =@idi_id
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbIdiomas_Insert]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbIdiomas_Insert]
	(
		@idi_Descripcion nvarchar(100),
		@idi_UsuarioCrea int,
		@idi_FechaCrea datetime
	) 
	AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = (SELECT ISNULL((SELECT MAX([idi_Id]) FROM [RRHH].[tbIdiomas]),0) + 1)
	INSERT INTO [RRHH].[tbIdiomas](
				idi_Id,
				idi_Descripcion,
				idi_UsuarioCrea,
				idi_FechaCrea
	)
	VALUES(
				@Id,
				@idi_Descripcion,
				@idi_UsuarioCrea,
				@idi_FechaCrea 
	)
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbIdiomas_Restore]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbIdiomas_Restore]
	(
		@idi_Id int,

		@idi_UsuarioModifica int,
		@idi_FechaModifica datetime
	) 
	AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @idi_id 
	UPDATE[RRHH].[tbIdiomas]
	SET   [idi_Estado]=1,

		  [idi_UsuarioModifica]=@idi_UsuarioModifica,
		  [idi_FechaModifica]=@idi_FechaModifica
	WHERE idi_id =@idi_id
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbIdiomas_Update]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbIdiomas_Update]
	(
		@idi_Id int,
		@idi_Descripcion nvarchar(100),
		@idi_UsuarioModifica int,
		@idi_FechaModifica datetime
	) AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @idi_Id
	UPDATE [RRHH].tbIdiomas
	SET    [idi_Descripcion] = @idi_Descripcion,
		   [idi_UsuarioModifica] = @idi_UsuarioModifica,
		   [idi_FechaModifica] = @idi_FechaModifica
	WHERE  idi_Id  = @idi_Id  AND idi_Estado = 1
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbJornadas_Delete]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [rrhh].[UDP_RRHH_tbJornadas_Delete]
	(
		@jor_Id int,
		@jor_razon_Inactivo nvarchar(100),
		@jor_UsuarioModifica int,
		@jor_FechaModifica datetime
	) 
	AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @jor_Id 
	UPDATE [rrhh].[tbJornadas]
	SET   [jor_Estado]=0,
		  [jor_RazonInactivo] = @jor_razon_Inactivo,
		  [jor_UsuarioModifica] = @jor_UsuarioModifica,
		  [jor_FechaModifica] = @jor_FechaModifica
	WHERE jor_Id =@jor_Id
	SELECT @Id AS MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbJornadas_Insert]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [rrhh].[UDP_RRHH_tbJornadas_Insert]
  (
  @jor_Id int,
  @jor_Descripcion nvarchar(30),
  @jor_Estado bit,
  @jor_RazonInactivo nvarchar(100),
  @jor_UsuarioCrea int,
  @jor_FechaCrea datetime
  )
  AS
  BEGIN
    BEGIN TRY
      BEGIN TRAN
          DECLARE @Id INT
          SET @Id = (SELECT ISNULL((SELECT MAX(jor_Id) FROM ERP_GMEDINA.rrhh.tbJornadas), 0) + 1)
          INSERT INTO rrhh.tbJornadas 
            (jor_Id, jor_Descripcion, jor_UsuarioCrea, jor_FechaCrea)
            VALUES (@Id, @jor_Descripcion, @jor_UsuarioCrea, @jor_FechaCrea)
          SELECT
          CAST(@Id AS VARCHAR(10)) AS MensajeError
        COMMIT TRAN
    END TRY
    BEGIN CATCH
      ROLLBACK TRAN
    SELECT '-1' + ERROR_MESSAGE() AS MensajeError
    END CATCH
  END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbJornadas_Restore]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbJornadas_Restore]
	(
		@jor_Id int,

		@jor_UsuarioModifica int,
		@jor_FechaModifica datetime
	) 
	AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @jor_Id 
	UPDATE [rrhh].[tbJornadas]
	SET   [jor_Estado]=1,

		  [jor_UsuarioModifica] = @jor_UsuarioModifica,
		  [jor_FechaModifica] = @jor_FechaModifica
	WHERE jor_Id =@jor_Id
	SELECT @Id AS MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbJornadas_Update]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [rrhh].[UDP_RRHH_tbJornadas_Update]
	(
		@jor_Id int,
		@jor_Descripcion nvarchar(30),
		@jor_UsuarioModifica int,
		@jor_FechaModifica datetime
	) AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @jor_Id
	UPDATE [rrhh].[tbJornadas]
	SET jor_Descripcion = @jor_Descripcion,
		jor_UsuarioModifica = @jor_UsuarioModifica,
		jor_FechaModifica = @jor_FechaModifica
	WHERE jor_Id  = @jor_Id AND jor_Estado = 1
	SELECT @Id AS MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbNacionalidades_Delete]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbNacionalidades_Delete]
	(
		@nac_id int,
		@nac_razon_Inactivo nvarchar(100),
		@nac_UsuarioModifica int,
		@nac_FechaModifica datetime
	) 
	AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @nac_id 
	UPDATE[RRHH].[tbNacionalidades]
	SET   [nac_Estado]=0,
		  [nac_RazonInactivo] = @nac_razon_Inactivo,
		  [nac_UsuarioModifica]= @nac_UsuarioModifica,
		  [nac_FechaModifica]= @nac_FechaModifica
	WHERE nac_Id =@nac_id
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbNacionalidades_Insert]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbNacionalidades_Insert]
	(
		@nac_Descripcion nvarchar(100),
		@nac_UsuarioCrea int,
		@nac_FechaCrea datetime
	) 
	AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = (SELECT ISNULL((SELECT MAX([nac_Id]) FROM [RRHH].[tbNacionalidades]),0) + 1)
	INSERT INTO [RRHH].[tbNacionalidades](
				[nac_Id],
				[nac_Descripcion],
				[nac_UsuarioCrea],
				[nac_FechaCrea]
	)
	VALUES(
				@Id,
				@nac_Descripcion,
				@nac_UsuarioCrea,
				@nac_FechaCrea
	)
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbNacionalidades_Restore]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbNacionalidades_Restore]
	(
		@nac_id int,

		@nac_UsuarioModifica int,
		@nac_FechaModifica datetime
	) 
	AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @nac_id 
	UPDATE[RRHH].[tbNacionalidades]
	SET   [nac_Estado]=1,

		  [nac_UsuarioModifica]= @nac_UsuarioModifica,
		  [nac_FechaModifica]= @nac_FechaModifica
	WHERE nac_Id =@nac_id
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbNacionalidades_Update]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbNacionalidades_Update]
	(
		@nac_Id int,
		@nac_Descripcion nvarchar(100),
		@nac_UsuarioModifica int,
		@nac_FechaModifica datetime
	) AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @nac_Id
	UPDATE [RRHH].[tbNacionalidades]
	SET nac_Descripcion = @nac_Descripcion,
		nac_UsuarioModifica = @nac_UsuarioModifica,
		nac_FechaModifica = @nac_FechaModifica
	WHERE nac_Id  = @nac_Id AND nac_Estado = 1
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbPermisos_Update]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [rrhh].[UDP_RRHH_tbPermisos_Update]
	(
		@tper_Id int,
		@tper_Descripcion nvarchar(100),
		@tper_UsuarioModifica int,
		@tper_FechaModifica datetime
	) AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @tper_Id
	UPDATE [RRHH].tbTipoPermisos
	SET    [tper_Descripcion] = @tper_Descripcion,
		   [tper_UsuarioModifica] = @tper_UsuarioModifica,
		   [tper_FechaModifica] = @tper_FechaModifica
	WHERE  tper_Id  = @tper_Id  AND tper_Estado = 1
	SELECT @Id AS MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbRazonSalida_Update]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbRazonSalida_Update]
	(
		@rsal_Id int,
		@rsal_Descripcion nvarchar(100),
		@rsal_UsuarioModifica int,
		@rsal_FechaModifica datetime
	) AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @rsal_Id
	UPDATE [RRHH].tbRazonSalidas
	SET    [rsal_Descripcion] = @rsal_Descripcion,
		   [rsal_UsuarioModifica] = @rsal_UsuarioModifica,
		   [rsal_FechaModifica] = @rsal_FechaModifica
	WHERE  rsal_Id  = @rsal_Id AND rsal_Estado = 1
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbRazonSalidas_Delete]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbRazonSalidas_Delete]
	(
		@rsal_Id int,
		@rsal_razon_Inactivo nvarchar(100),
		@rsal_UsuarioModifica int,
		@rsal_FechaModifica datetime
	) 
	AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @rsal_Id 
	UPDATE [RRHH].[tbRazonSalidas]
	SET   [rsal_Estado]=0,
		  [rsal_RazonInactivo] = @rsal_razon_Inactivo,
		  [rsal_UsuarioModifica] = @rsal_UsuarioModifica,
		  [rsal_FechaModifica] = @rsal_FechaModifica
	WHERE rsal_Id =@rsal_Id
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbRazonSalidas_Insert]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbRazonSalidas_Insert]
	(
		@rsal_Descripcion nvarchar(100),
		@rsal_Usuariocrea int,
		@rsal_FechaCrea datetime
	) 
	AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = (SELECT ISNULL((SELECT MAX([rsal_Id]) FROM [RRHH].[tbRazonSalidas] ),0) + 1)
	INSERT INTO [RRHH].[tbRazonSalidas](
				[rsal_id], 
				[rsal_descripcion],
				[rsal_usuariocrea], 
				[rsal_fechacrea]
	)
	VALUES(
				@Id,
				@rsal_Descripcion,
				@rsal_Usuariocrea,
				@rsal_FechaCrea
	)
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbRazonSalidas_Restore]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbRazonSalidas_Restore]
	(
		@rsal_Id int,

		@rsal_UsuarioModifica int,
		@rsal_FechaModifica datetime
	) 
	AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @rsal_Id 
	UPDATE [RRHH].[tbRazonSalidas]
	SET   [rsal_Estado]=1,

		  [rsal_UsuarioModifica] = @rsal_UsuarioModifica,
		  [rsal_FechaModifica] = @rsal_FechaModifica
	WHERE rsal_Id =@rsal_Id
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbTipoAmonestaciones_Delete]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbTipoAmonestaciones_Delete]
	(
		@tamo_Id int,
		@tamo_razon_Inactivo nvarchar(100),
		@tamo_UsuarioModifica int,
		@tamo_FechaModifica datetime
	) 
	AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @tamo_Id 
	UPDATE [RRHH].[tbTipoAmonestaciones]
	SET   [tamo_Estado]=0,
		  [tamo_RazonInactivo] = @tamo_razon_Inactivo,
		  [tamo_UsuarioModifica] = @tamo_UsuarioModifica,
		  [tamo_FechaModifica] =@tamo_FechaModifica
	WHERE tamo_Id =@tamo_Id
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbTipoAmonestaciones_Insert]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbTipoAmonestaciones_Insert]
	(
		@tamo_Descripcion nvarchar(100),
		@tamo_UsuarioCrea int,
		@tamo_FechaCrea datetime
	) 
	AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = (SELECT ISNULL((SELECT MAX([tamo_Id]) FROM [RRHH].tbTipoAmonestaciones),0) + 1)
	INSERT INTO [RRHH].tbTipoAmonestaciones(
				[tamo_Id],
				[tamo_Descripcion],
				[tamo_UsuarioCrea],
				tamo_FechaCrea
	)
	VALUES(
				@Id,
				@tamo_Descripcion,
				@tamo_UsuarioCrea,
				@tamo_FechaCrea
	)
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbTipoAmonestaciones_Restore]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbTipoAmonestaciones_Restore]
	(
		@tamo_Id int,

		@tamo_UsuarioModifica int,
		@tamo_FechaModifica datetime
	) 
	AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @tamo_Id 
	UPDATE [RRHH].[tbTipoAmonestaciones]
	SET   [tamo_Estado]=1,

		  [tamo_UsuarioModifica] = @tamo_UsuarioModifica,
		  [tamo_FechaModifica] =@tamo_FechaModifica
	WHERE tamo_Id =@tamo_Id
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbTipoAmonestaciones_Update]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbTipoAmonestaciones_Update]
	(
		@tamo_Id int,
		@tamo_Descripcion nvarchar(100),
		@tamo_UsuarioModifica int,
		@tamo_FechaModifica datetime
	) AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @tamo_Id
	UPDATE [RRHH].tbTipoAmonestaciones
	SET    [tamo_Descripcion] = @tamo_Descripcion,
		   [tamo_UsuarioModifica] = @tamo_UsuarioModifica,
		   [tamo_FechaModifica] = @tamo_FechaModifica
	WHERE  tamo_Id  = @tamo_Id AND tamo_Estado = 1
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbTipoHora_Update]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbTipoHora_Update]
	(
		@tiho_Id int,
		@tiho_Descripcion nvarchar(100),
		@tiho_Recargo int,
		@tiho_UsuarioModifica int,
		@tiho_FechaModifica datetime
	) AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @tiho_Id
	UPDATE [RRHH].tbTipoHoras
	SET    [tiho_Descripcion] = @tiho_Descripcion,
		   [tiho_Recargo] = @tiho_Recargo,
		   [tiho_UsuarioModifica] = @tiho_UsuarioModifica,
		   [tiho_FechaModifica] = @tiho_FechaModifica
	WHERE  tiho_Id  = @tiho_Id  AND tiho_Estado = 1
	SELECT CAST(@Id AS VARCHAR) AS MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbTipoHoras_Delete]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbTipoHoras_Delete]
	(
		@tiho_Id int,
		@tiho_razon_Inactivo nvarchar(100),
		@tiho_UsuarioModifica int,
		@tiho_FechaModifica datetime
	) 
	AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @tiho_id 
	UPDATE [RRHH].[tbTipoHoras]
	SET	  [tiho_Estado]=0,
		  [tiho_RazonInactivo] = @tiho_razon_Inactivo,
		  [tiho_UsuarioModifica]= @tiho_UsuarioModifica,
		  [tiho_FechaModifica]= @tiho_FechaModifica
	WHERE tiho_id =@tiho_id
	SELECT CAST(@Id AS VARCHAR) AS MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbTipoHoras_Insert]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbTipoHoras_Insert]
(
@tiho_Descripcion nvarchar(100),
@tiho_Recargo int,
@tiho_UsuarioCrea int,
@tiho_FechaCrea datetime
) AS
set nocount on;
BEGIN
BEGIN TRY
BEGIN TRAN
declare @Id int
set @Id = (SELECT ISNULL((SELECT MAX([tiho_Id]) FROM [RRHH].[tbTipoHoras]),0) + 1)
INSERT INTO [RRHH].[tbTipoHoras](
tiho_Id, 
tiho_Descripcion,
tiho_Recargo,  
tiho_UsuarioCrea, 
tiho_FechaCrea
)
VALUES(
@Id,
@tiho_Descripcion,
@tiho_Recargo,
@tiho_UsuarioCrea,
@tiho_FechaCrea 
)
SELECT CAST(@Id AS VARCHAR) AS MensajeError
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
END CATCH
END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbTipoHoras_Restore]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbTipoHoras_Restore]
	(
		@tiho_Id int,

		@tiho_UsuarioModifica int,
		@tiho_FechaModifica datetime
	) 
	AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @tiho_id 
	UPDATE [RRHH].[tbTipoHoras]
	SET	  [tiho_Estado]=1,

		  [tiho_UsuarioModifica]= @tiho_UsuarioModifica,
		  [tiho_FechaModifica]= @tiho_FechaModifica
	WHERE tiho_id =@tiho_id
	SELECT CAST(@Id AS VARCHAR) AS MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbTipoHoras_Select]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbTipoHoras_Select]
(
@tiho_Id int
) AS
set nocount on;
BEGIN
BEGIN TRY
BEGIN TRAN
declare @Id int
set @Id = @tiho_Id
SELECT 
tiho_Id, 
tiho_Descripcion,
tiho_Recargo
FROM
[RRHH].[tbTipoHoras]
WHERE tiho_Id=@tiho_Id

SELECT CAST(@Id AS VARCHAR) AS MensajeError
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN
SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
END CATCH
END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbTipoIncapacidades_Delete]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbTipoIncapacidades_Delete]
	(
		@ticn_Id int,
		@ticn_razon_Inactivo nvarchar(100),
		@ticn_UsuarioModifica int,
		@ticn_FechaModifica datetime
	) 
	AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @ticn_Id 
	UPDATE[RRHH].[tbTipoIncapacidades]
	SET   [ticn_Estado]=0,
		  [ticn_RazonInactivo] = @ticn_razon_Inactivo,
		  [ticn_UsuarioModifica] =@ticn_UsuarioModifica,
		  [ticn_FechaModifica]= @ticn_FechaModifica
	WHERE ticn_Id =@ticn_Id
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbTipoIncapacidades_Insert]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbTipoIncapacidades_Insert]
	(
		@ticn_Descripcion nvarchar(100),
		@ticn_Usuariocrea int,
		@ticn_FechaCrea datetime
	) 
	AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = (SELECT ISNULL((SELECT MAX([ticn_Id]) FROM [RRHH].[tbTipoIncapacidades] ),0) + 1)
	INSERT INTO [RRHH].[tbTipoIncapacidades](
				[ticn_Id],
				[ticn_Descripcion],
				[ticn_Usuariocrea],
				[ticn_Fechacrea]
	)
	VALUES(
				@Id,
				@ticn_Descripcion,
				@ticn_Usuariocrea,
				@ticn_FechaCrea
	)
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbTipoIncapacidades_Restore]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbTipoIncapacidades_Restore]
	(
		@ticn_Id int,

		@ticn_UsuarioModifica int,
		@ticn_FechaModifica datetime
	) 
	AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @ticn_Id 
	UPDATE[RRHH].[tbTipoIncapacidades]
	SET   [ticn_Estado]=1,

		  [ticn_UsuarioModifica] =@ticn_UsuarioModifica,
		  [ticn_FechaModifica]= @ticn_FechaModifica
	WHERE ticn_Id =@ticn_Id
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbTipoIncapacidades_Update]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbTipoIncapacidades_Update]
	(
		@ticn_Id int,
		@ticn_Descripcion nvarchar(100),
		@ticn_UsuarioModifica int,
		@ticn_FechaModifica datetime
	) AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @ticn_Id 
	UPDATE [RRHH].tbTipoIncapacidades
	SET    [ticn_Descripcion] = @ticn_Descripcion,
		   [ticn_UsuarioModifica] = @ticn_UsuarioModifica,
		   [ticn_FechaModifica] = @ticn_FechaModifica
	WHERE ticn_Id  = @ticn_Id AND ticn_Estado = 1
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbTipoMoneda_Update]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbTipoMoneda_Update]
	(
		@tmon_Id int,
		@tmon_Descripcion nvarchar(100),
		@tmon_UsuarioModifica int,
		@tmon_FechaModifica datetime
	) AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @tmon_Id
	UPDATE [RRHH].tbTipoMonedas
	SET    [tmon_Descripcion] = @tmon_Descripcion,
		   [tmon_UsuarioModifica] = @tmon_UsuarioModifica,
		   [tmon_FechaModifica] = @tmon_FechaModifica
	WHERE  tmon_Id  = @tmon_Id  AND tmon_Estado = 1
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbTipoMonedas_Delete]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbTipoMonedas_Delete]
	(
		@tmon_Id int,
		@tmon_razon_Inactivo nvarchar(100),
		@tmon_UsuarioModifica int,
		@tmon_FechaModifica datetime
	)
	AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @tmon_id 
	UPDATE[RRHH].[tbTipoMonedas]
	SET   [tmon_Estado]=0,
		  [tmon_RazonInactivo] = @tmon_razon_Inactivo,
		  [tmon_UsuarioModifica]= @tmon_UsuarioModifica,
		  [tmon_FechaModifica]= @tmon_FechaModifica
	WHERE tmon_id =@tmon_Id
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbTipoMonedas_Insert]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbTipoMonedas_Insert]
	(
		@tmon_Descripcion nvarchar(100),
		@tmon_UsuarioCrea int,
		@tmon_FechaCrea datetime
	) 
	AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = (SELECT ISNULL((SELECT MAX([tmon_Id]) FROM [RRHH].tbTipoMonedas),0) + 1)
	INSERT INTO [RRHH].tbTipoMonedas(
				[tmon_Id],
				[tmon_Descripcion],
				[tmon_UsuarioCrea],
				[tmon_FechaCrea]
	)
	VALUES(
				@Id,
				@tmon_Descripcion,
				@tmon_UsuarioCrea,
				@tmon_FechaCrea
	)
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbTipoMonedas_Restore]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbTipoMonedas_Restore]
	(
		@tmon_Id int,

		@tmon_UsuarioModifica int,
		@tmon_FechaModifica datetime
	)
	AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @tmon_id 
	UPDATE[RRHH].[tbTipoMonedas]
	SET   [tmon_Estado]=1,

		  [tmon_UsuarioModifica]= @tmon_UsuarioModifica,
		  [tmon_FechaModifica]= @tmon_FechaModifica
	WHERE tmon_id =@tmon_Id
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbTipoPermisos_Delete]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbTipoPermisos_Delete]
	(
		@tper_Id int,
		@tper_razon_Inactivo nvarchar(100),
		@tper_UsuarioModifica int,
		@tper_FechaModifica datetime
	) 
	AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @tper_Id 
	UPDATE[RRHH].[tbTipoPermisos]
	SET   [tper_Estado]=0,
		  [tper_RazonInactivo] = @tper_razon_Inactivo,
		  [tper_UsuarioModifica]= @tper_UsuarioModifica
	WHERE tper_Id =@tper_Id
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbTipoPermisos_Insert]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbTipoPermisos_Insert]
	(
		@tper_Descripcion nvarchar(100),
		@tper_UsuarioCrea int,
		@tper_FechaCrea datetime
	) 
	AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = (SELECT ISNULL((SELECT MAX([tper_Id]) FROM [RRHH].tbTipoPermisos),0) + 1)
	INSERT INTO [RRHH].tbTipoPermisos(
				[tper_Id],
				[tper_Descripcion],
				[tper_UsuarioCrea],
				tper_FechaCrea
	)
	VALUES(
				@Id,
				@tper_Descripcion,
				@tper_UsuarioCrea,
				@tper_FechaCrea
	)
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbTipoPermisos_Restore]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbTipoPermisos_Restore]
	(
		@tper_Id int,

		@tper_UsuarioModifica int,
		@tper_FechaModifica datetime
	) 
	AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @tper_Id 
	UPDATE[RRHH].[tbTipoPermisos]
	SET   [tper_Estado]=1,

		  [tper_UsuarioModifica]= @tper_UsuarioModifica
	WHERE tper_Id =@tper_Id
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbTipoPermisos_Update]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [rrhh].[UDP_RRHH_tbTipoPermisos_Update]
	(
		@tper_Id int,
		@tper_Descripcion nvarchar(100),
		@tper_UsuarioModifica int,
		@tper_FechaModifica datetime
	) AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @tper_Id
	UPDATE [RRHH].tbTipoPermisos
	SET    [tper_Descripcion] = @tper_Descripcion,
		   [tper_UsuarioModifica] = @tper_UsuarioModifica,
		   [tper_FechaModifica] = @tper_FechaModifica
	WHERE  tper_Id  = @tper_Id  AND tper_Estado = 1
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbTipoSalidas_Delete]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [rrhh].[UDP_RRHH_tbTipoSalidas_Delete]
	(
		@tsal_id int,
		@tsal_razon_Inactivo nvarchar(100),
		@tsal_UsuarioModifica int,
		@tsal_FechaModifica datetime
	) 
	AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @tsal_id 
	UPDATE [RRHH].[tbTipoSalidas]
	SET   [tsal_Estado]=0,
		  [tsal_RazonInactivo] = @tsal_razon_Inactivo,
		  [tsal_UsuarioModifica]= @tsal_UsuarioModifica,
		  [tsal_FechaModifica]= @tsal_FechaModifica
	WHERE tsal_Id =@tsal_id
	SELECT @Id AS MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbTipoSalidas_Insert]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [rrhh].[UDP_RRHH_tbTipoSalidas_Insert]
	(
		@tsal_Descripcion nvarchar(100),
		@tsal_UsuarioCrea int,
		@tsal_FechaCrea datetime
	) 
	AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = (SELECT ISNULL((SELECT MAX([tsal_Id]) FROM [RRHH].[tbTipoSalidas]),0) + 1)
	INSERT INTO [RRHH].[tbTipoSalidas](
				[tsal_Id],
				[tsal_Descripcion],
				[tsal_UsuarioCrea],
				[tsal_FechaCrea]
	)
	VALUES(
				@Id,
				@tsal_Descripcion,
				@tsal_UsuarioCrea,
				@tsal_FechaCrea
	)
	SELECT @Id AS MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbTipoSalidas_Restore]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbTipoSalidas_Restore]
	(
		@tsal_id int,

		@tsal_UsuarioModifica int,
		@tsal_FechaModifica datetime
	) 
	AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @tsal_id 
	UPDATE [RRHH].[tbTipoSalidas]
	SET   [tsal_Estado]=1,

		  [tsal_UsuarioModifica]= @tsal_UsuarioModifica,
		  [tsal_FechaModifica]= @tsal_FechaModifica
	WHERE tsal_Id =@tsal_id
	SELECT @Id AS MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbTipoSalidas_Update]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [rrhh].[UDP_RRHH_tbTipoSalidas_Update]
	(
		@tsal_Id int,
		@tsal_Descripcion nvarchar(100),
		@tsal_UsuarioModifica int,
		@tsal_FechaModifica datetime
	) AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @tsal_Id
	UPDATE [RRHH].[tbTipoSalidas]
	SET tsal_Descripcion = @tsal_Descripcion,
		tsal_UsuarioModifica = @tsal_UsuarioModifica,
		tsal_FechaModifica = @tsal_FechaModifica
	WHERE tsal_Id  = @tsal_Id AND tsal_Estado = 1
	SELECT @Id AS MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbTitulos_Delete]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbTitulos_Delete]
	(
		@titu_id int,
		@titu_razon_Inactivo nvarchar(100),
		@titu_UsuarioModifica int,
		@titu_FechaModifica datetime
	) 
	AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @titu_id 
	UPDATE[RRHH].tbTitulos
	SET   [titu_Estado]=0,
		  [titu_RazonInactivo] = @titu_razon_Inactivo,
		  [titu_UsuarioModifica]= @titu_UsuarioModifica,
		  [titu_FechaModifica]= @titu_FechaModifica
	WHERE titu_Id =@titu_id
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbTitulos_Insert]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbTitulos_Insert]
	(
		@titu_Descripcion nvarchar(100),
		@titu_UsuarioCrea  int,
		@titu_FechaCrea datetime
	) 
	AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = (SELECT ISNULL((SELECT MAX([titu_Id]) FROM [RRHH].[tbTitulos]),0) + 1)
	INSERT INTO [RRHH].[tbTitulos](
				[titu_Id],
				[titu_Descripcion],
				[titu_UsuarioCrea],
				[titu_Fechacrea]
	)
	VALUES(
				@Id,
				@titu_Descripcion,
				@titu_UsuarioCrea, 
				@titu_FechaCrea
	)
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbTitulos_Restore]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbTitulos_Restore]
	(
		@titu_id int,

		@titu_UsuarioModifica int,
		@titu_FechaModifica datetime
	) 
	AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @titu_id 
	UPDATE[RRHH].tbTitulos
	SET   [titu_Estado]=1,

		  [titu_UsuarioModifica]= @titu_UsuarioModifica,
		  [titu_FechaModifica]= @titu_FechaModifica
	WHERE titu_Id =@titu_id
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
/****** Object:  StoredProcedure [rrhh].[UDP_RRHH_tbTitulos_Update]    Script Date: 19/11/2019 8:12:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [rrhh].[UDP_RRHH_tbTitulos_Update]
	(
		@titu_Id int,
		@titu_Descripcion nvarchar(100),
		@titu_UsuarioModifica int,
		@titu_FechaModifica datetime
	) AS
	set nocount on;
	BEGIN
	BEGIN TRY
	BEGIN TRAN
	declare @Id int
	set @Id = @titu_Id
	UPDATE [RRHH].[tbTitulos]
	SET   [titu_Descripcion] = @titu_Descripcion,
		  [titu_Usuariomodifica] = @titu_Usuariomodifica,
		  [titu_FechaModifica] = @titu_FechaModifica
	WHERE [titu_Id]  = @titu_Id AND titu_Estado = 1
	SELECT CAST(@Id AS VARCHAR(10)) AS  MensajeError
	COMMIT TRAN
	END TRY
	BEGIN CATCH
	ROLLBACK TRAN
	SELECT '-1 ' + ERROR_MESSAGE() AS MensajeError
	END CATCH
	END
GO
