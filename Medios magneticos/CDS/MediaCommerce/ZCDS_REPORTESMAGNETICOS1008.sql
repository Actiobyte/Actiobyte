@AbapCatalog.sqlViewName: 'ZCDS_RMM1008'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@VDM.viewType: #CONSUMPTION

@EndUserText.label: 'CDS REPORTES MAGNETICOS FICA 1008'
define view ZCDS_REPORTESMAGNETICOS1008
  with parameters
    P_FECHA1 : abap.dats,
    P_FECHA2 : abap.dats,
    P_BUKRS  : abap.char(4)



  as select from dfkkop
    inner join   dfkkbptaxnum   on dfkkbptaxnum.partner = dfkkop.gpart
    inner join   ztfe_cod_dian  on ztfe_cod_dian.taxtype = dfkkbptaxnum.taxtype
    inner join   but000         on but000.partner = dfkkop.gpart
    inner join   abupartaddress on abupartaddress.businesspartner = dfkkop.gpart




{

  gpart                    as NUMERO_INTERLOCUTOR,
  bukrs                    as SOCIEDAD,
  dfkkop.opbel             as NUMERO_DOCMENTO,
  dfkkop.opupk             as POSICION,
  case when dfkkop.hkont between '1305010001' and '1305010001'  then '1315'
   when dfkkop.hkont between '1305020001' and '1305020001'  then '1315'
   when dfkkop.hkont between '1320010001' and '1320020090'  then '1316'
   when dfkkop.hkont between '1310050000' and '1310100001'  then '1317'
   when dfkkop.hkont between '1380010001' and '1380020098'  then '1317'
   when dfkkop.hkont between '1381010001' and '1381010098'  then '1317'
   when dfkkop.hkont between '1382010001' and '1389020001'  then '1317'
   when dfkkop.hkont between '1305010090' and '1305010090'  then '1318'

            end            as concepto,
   dfkkop.betrw *100
         as IMPUESTOS,
  waers                    as moneda,
  name_last                as PRIMER_APELLIDO,
  name_last2               as SEGUNDO_APELLIDO,
  name_first               as PRIMER_NOMBRE,
  namemiddle               as SEGUNDO_NOMBRE,
  but000.mc_name1          as OTROS_NOMBRES,
  but000.mc_name2          as OTROS__NOMBRES,
  bldat                    as fecha,
  budat                    as fecha2,
  streetname               as DIRECCION,
  region                   as CODIGO_DEPARTAMENTO,
  citycode                 as CODIGO_MUNICIPIO,
  country                  as PAIS,
  dfkkbptaxnum.taxnum      as NUMERO_DE_IDENTIFICACION,
  dfkkbptaxnum.taxtype     as TIPO_NUMERO_IDENTIFICACION,
  taxnumxl                 as NUMERO_IDENTIFIACION_FISCAL,
  ztfe_cod_dian.typeperson as TIPO_DE_DOCUMENTO

}

where

      dfkkop.bukrs = $parameters.P_BUKRS
  /*and   not(
      hvorg          between '9900' and '9910'
      and tvorg      =       '0001'
    )*/
  and budat        <= $parameters.P_FECHA1
  and budat        >= $parameters.P_FECHA2
  and dfkkop.hkont = '1305010001'
  and not(
    augbd          between $parameters.P_FECHA2 and $parameters.P_FECHA1

  )
