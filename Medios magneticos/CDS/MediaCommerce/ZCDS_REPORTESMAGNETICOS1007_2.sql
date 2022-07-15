@AbapCatalog.sqlViewName: 'ZCDS_RMM1007_2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS REPORTES MAGNETICOS FICA'
define view ZCDS_REPORTESMAGNETICOS1007_2
  with parameters
    P_FECHA1 : abap.dats,
    P_FECHA2 : abap.dats,
    P_BUKRS1 : abap.char(12)



  as select from ZCDS_REPORTESMAGNETICOS1007(P_FECHA1:$parameters.P_FECHA1,P_FECHA2:$parameters.P_FECHA2, P_BUKRS:$parameters.P_BUKRS1)



{
   concepto          as concepto,
  TIPO_DE_DOCUMENTO        as tipo_doc,
  NUMERO_DE_IDENTIFICACION as NUMERO_DE_IDENTIFICACION,
  NUMERO_DE_IDENTIFICACION as numid,
  PRIMER_APELLIDO          as Pape,
  SEGUNDO_APELLIDO         as sape,
  PRIMER_NOMBRE            as Prinom,
  OTROS_NOMBRES            as otrnom,
  OTROS__NOMBRES           as otronom,
  case when PAIS = 'CO'
           then '169'
            end            as PAIS,
  sum(IMPUESTOS)           as SUM_IMPUESTOS


}
group by
  concepto,
  TIPO_DE_DOCUMENTO,
  NUMERO_DE_IDENTIFICACION,
  PRIMER_APELLIDO,
  SEGUNDO_APELLIDO,
  PRIMER_NOMBRE,
  OTROS_NOMBRES,
  OTROS__NOMBRES,