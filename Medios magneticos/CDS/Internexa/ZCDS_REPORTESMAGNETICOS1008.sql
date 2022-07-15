AbapCatalog.sqlViewName: 'ZCDS_RMM1008'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS REPORTES MAGNETICOS FICA'
define view ZCDS_REPORTESMAGNETICOS1008
  with parameters
    P_FECHA1 : abap.dats,
    P_FECHA2 : abap.dats,
    P_BUKRS  : abap.char(4)



  as select from dfkkop
    inner join   dfkkbptaxnum   on dfkkbptaxnum.partner = dfkkop.gpart
  // inner join   ztfe_cod_dian  on ztfe_cod_dian.taxtype = dfkkbptaxnum.taxtype
    inner join   but000         on but000.partner = dfkkop.gpart
    inner join   abupartaddress on abupartaddress.businesspartner = dfkkop.gpart




{
  case when dfkkop.hkont between '1316060100' and '1316060100'  then '1315'
       when dfkkop.hkont between '1316060200' and '1316060200'  then '1315'
       when dfkkop.hkont between '1317080100' and '1317080100'  then '1315'
       when dfkkop.hkont between '1317080200' and '1317080200'  then '1315'
       when dfkkop.hkont between '1317900100' and '1317900100'  then '1315'
       when dfkkop.hkont between '1317900200' and '1317900200'  then '1315'
       when dfkkop.hkont between '1318060100' and '1318060100'  then '1315'
       when dfkkop.hkont between '1318060200' and '1318060200'  then '1315'
       when dfkkop.hkont between '1384160100' and '1384160100'  then '1315'
       when dfkkop.hkont between '1384350100' and '1384350100'  then '1315'
       when dfkkop.hkont between '1384360100' and '1384360100'  then '1315'
       when dfkkop.hkont between '1385010100' and '1385010100'  then '1315'
       when dfkkop.hkont between '1385080100' and '1385080100'  then '1315'
       when dfkkop.hkont between '1384900001' and '1384900001'  then '1317'
       when dfkkop.hkont between '1384900100' and '1384900100'  then '1317'
       when dfkkop.hkont between '1384909999' and '1384909999'  then '1317'
       when dfkkop.hkont between '1385900100' and '1385900100'  then '1317'
       when dfkkop.hkont between '1386080001' and '1386080001'  then '1318'
                 end   as concepto,
  gpart                as NUMERO_INTERLOCUTOR,
  bukrs                as SOCIEDAD,
  dfkkop.opbel         as NUMERO_DOCMENTO,
  dfkkop.opupk         as POSICION,
  dfkkop.hkont         as CUENTA_MAYOR,
  dfkkop.betrw *100    as IMPUESTOS,
  waers                as moneda,
  name_last            as PRIMER_APELLIDO,
  name_last2           as SEGUNDO_APELLIDO,
  name_first           as PRIMER_NOMBRE,
  namemiddle           as SEGUNDO_NOMBRE,
  but000.mc_name1      as OTROS_NOMBRES,
  but000.mc_name2      as OTROS__NOMBRES,
  bldat                as fecha,
  budat                as fecha2,
  streetname           as DIRECCION,
  region               as CODIGO_DEPARTAMENTO,
  citycode             as CODIGO_MUNICIPIO,
  country              as PAIS,
  dfkkbptaxnum.taxnum  as NUMERO_DE_IDENTIFICACION,
  dfkkbptaxnum.taxtype as TIPO_NUMERO_IDENTIFICACION,
  case when dfkkbptaxnum.taxtype  = 'CO1'  then '31'
  when      dfkkbptaxnum.taxtype  = 'CO2'  then '13'
  when      dfkkbptaxnum.taxtype  = 'CO3'  then '22'
  when      dfkkbptaxnum.taxtype  = 'CO4'  then '12'
  when      dfkkbptaxnum.taxtype  = 'CO5'  then '41'
  when      dfkkbptaxnum.taxtype  = 'CO6'  then '42'
  else dfkkbptaxnum.taxtype
  end                  as TIPO_DE_DOCUMENTO,
  taxnumxl             as NUMERO_IDENTIFIACION_FISCAL

 
}

where
      dfkkop.bukrs        = $parameters.P_BUKRS
  /*and   not(
      hvorg          between '9900' and '9910'
      and tvorg      =       '0001'
    )*/
  and budat               <= $parameters.P_FECHA1
  and budat               >= $parameters.P_FECHA2
  and (
       dfkkop.hkont between '1316060100' and '1316060100'  
       or dfkkop.hkont between '1316060200' and '1316060200'  
       or dfkkop.hkont between '1317080100' and '1317080100'  
       or dfkkop.hkont between '1317080200' and '1317080200'  
       or dfkkop.hkont between '1317900100' and '1317900100'  
       or dfkkop.hkont between '1317900200' and '1317900200'  
       or dfkkop.hkont between '1318060100' and '1318060100'  
       or dfkkop.hkont between '1318060200' and '1318060200'  
       or dfkkop.hkont between '1384160100' and '1384160100'  
       or dfkkop.hkont between '1384350100' and '1384350100'  
       or dfkkop.hkont between '1384360100' and '1384360100'  
       or dfkkop.hkont between '1385010100' and '1385010100'  
       or dfkkop.hkont between '1385080100' and '1385080100'  
       or dfkkop.hkont between '1384900001' and '1384900001'  
       or dfkkop.hkont between '1384900100' and '1384900100'  
       or dfkkop.hkont between '1384909999' and '1384909999'  
       or dfkkop.hkont between '1385900100' and '1385900100'  
       or dfkkop.hkont between '1386080001' and '1386080001'  
  )
  and not(
    augbd                 between $parameters.P_FECHA2 and $parameters.P_FECHA1

  )
