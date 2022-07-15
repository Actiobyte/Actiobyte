@AbapCatalog.sqlViewName: 'ZCDS_RMM1008_3'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS REPORTES MAGNETICOS FICA'
define view ZCDS_REPORTESMAGNETICOS1008_3

  with parameters
    P_FECHA1 : abap.dats,
    P_FECHA2 : abap.dats,
    P_BUKRS  : abap.char(4)



  as select from ZCDS_REPORTESMAGNETICOS1008_2(P_FECHA1:$parameters.P_FECHA1, P_FECHA2:$parameters.P_FECHA2,P_BUKRS:$parameters.P_BUKRS)



{
  Concepto,
  tipo_doc,
  Numid,
  Pape,
  sape,
  Prinom,
  otrnom,
  otronom,
  PAIS,
  DIRECCION,
  CODIGO_DEPARTAMENTO,
  CODIGO_MUNICIPIO,
  case when SUM_IMPUESTOS < 100 then SUM_IMPUESTOS *(-100)
  when SUM_IMPUESTOS > 100 then SUM_IMPUESTOS 
            end            as Impuestos
  


}

