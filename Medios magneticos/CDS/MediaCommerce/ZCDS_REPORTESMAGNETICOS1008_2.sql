@AbapCatalog.sqlViewName: 'ZCDS_RMM1008_2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'REPORTE MEDIOS MAGNETICOS FORMATO 1008'
define view ZCDS_REPORTESMAGNETICOS1008_2

  with parameters
    P_FECHA1 : abap.dats,
    P_FECHA2 : abap.dats,
    P_BUKRS  : abap.char(4)



  as select from ZCDS_REPORTESMAGNETICOS1008(P_FECHA1:$parameters.P_FECHA1, P_FECHA2:$parameters.P_FECHA2,P_BUKRS:$parameters.P_BUKRS)



{
  concepto                 as Concepto,
  NUMERO_DE_IDENTIFICACION,
  TIPO_DE_DOCUMENTO        as tipo_doc,
  NUMERO_DE_IDENTIFICACION as Numid,
  PRIMER_APELLIDO          as Pape,
  SEGUNDO_APELLIDO         as sape,
  PRIMER_NOMBRE            as Prinom,
  OTROS_NOMBRES            as otrnom,
  OTROS__NOMBRES           as otronom,
  case when PAIS = 'CO'
           then '169'
            end            as PAIS,
  DIRECCION                as dir,
  CODIGO_DEPARTAMENTO      as coddepar,
  CODIGO_MUNICIPIO         as codmun,
  sum(IMPUESTOS)        as SUM_IMPUESTOS


}
group by

  NUMERO_DE_IDENTIFICACION,
  concepto,
  PRIMER_APELLIDO,
  SEGUNDO_APELLIDO,
  PRIMER_NOMBRE,
  SEGUNDO_NOMBRE,
  OTROS_NOMBRES,
  OTROS__NOMBRES,
  TIPO_DE_DOCUMENTO,
  DIRECCION,
  CODIGO_DEPARTAMENTO,
  CODIGO_MUNICIPIO,
  PAIS