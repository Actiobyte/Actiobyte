@AbapCatalog.sqlViewName: 'ZCDS_RMM1006_2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS REPORTES MAGNETICOS FICA'
define view ZCDS_REPORTESMAGNETICOS1006_2
  with parameters
    P_FECHA1 : abap.dats,
    P_FECHA2 : abap.dats,
    P_BUKRS1 : abap.char(12)



  as select from ZCDS_REPORTESMAGNETICOS1006(P_FECHA1:$parameters.P_FECHA1,P_FECHA2:$parameters.P_FECHA2, P_BUKRS:$parameters.P_BUKRS1)



{
  NUMERO_DE_IDENTIFICACION,
  TIPO_DE_DOCUMENTO as tipo_doc,
  PRIMER_APELLIDO   as Pape,
  SEGUNDO_APELLIDO  as sape,
  PRIMER_NOMBRE     as Prinom,
  OTROS_NOMBRES     as otrnom,
  OTROS__NOMBRES    as otronom,
  sum(IMPUESTOS)    as SUM_IMPUESTOS
  //sum(IVA)          as SUM_IVA



}
group by
  NUMERO_DE_IDENTIFICACION,
  TIPO_DE_DOCUMENTO,
  NUMERO_DE_IDENTIFICACION,
  PRIMER_APELLIDO,
  SEGUNDO_APELLIDO,
  PRIMER_NOMBRE,
  OTROS_NOMBRES,
  OTROS__NOMBRES;
