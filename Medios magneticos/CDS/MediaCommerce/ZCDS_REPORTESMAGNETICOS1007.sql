@AbapCatalog.sqlViewName: 'ZCDS_RMM1007'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS REPORTES MAGNETICOS FICA 1007'
define view ZCDS_REPORTESMAGNETICOS1007
  with parameters
    P_FECHA1 : abap.dats,
    P_FECHA2 : abap.dats,
    P_BUKRS  : abap.char(12)



  as select from dfkkopk
    inner join   dfkkop         on dfkkop.opbel = dfkkopk.opbel //and dfkkop.opupk = dfkkopk.opupk
    inner join   dfkkbptaxnum   on dfkkbptaxnum.partner = dfkkop.gpart
    inner join   ztfe_cod_dian  on ztfe_cod_dian.taxtype = dfkkbptaxnum.taxtype
    inner join   but000         on but000.partner = dfkkop.gpart
    inner join   abupartaddress on abupartaddress.businesspartner = dfkkop.gpart



{
  case when dfkkopk.hkont  between '4135010001' and '4145750050'  then '4001'
  when      dfkkopk.hkont  between '4202010001' and '4295040001'  then '4002'
  when       dfkkopk.hkont  between '4201010001' and '4201020003'  then '4003'
  end                      as concepto,
  gpart                    as NUMERO_INTERLOCUTOR,
  dfkkop.opbel             as NUMERO_DOCMENTO,
  dfkkop.opupk             as N,
  ztfe_cod_dian.typeperson as TIPO_DE_DOCUMENTO,
  dfkkbptaxnum.taxnum      as NUMERO_DE_IDENTIFICACION,
  name_last                as PRIMER_APELLIDO,
  name_last2               as SEGUNDO_APELLIDO,
  name_first               as PRIMER_NOMBRE,
  but000.mc_name1          as OTROS_NOMBRES,
  but000.mc_name2          as OTROS__NOMBRES,
  dfkkopk.opupk            as posicion,
  country                  as PAIS,
  augbd                    as fecha,
  budat                    as fecha2,
  augrd                    as agrd,
  dfkkopk.betrh *100       as IMPUESTOS


}

where
          dfkkopk.bukrs   = $parameters.P_BUKRS
  and     dfkkop.opupk    =       '0001'
  and     dfkkop.opupz    =       '000'
  and(
          dfkkopk.hkont   between '4000000000' and '4999999999'


  )

  and     budat           <= $parameters.P_FECHA1
  and     budat           >= $parameters.P_FECHA2
  and(
    (
          augrd != '05'
      and augbd           <= $parameters.P_FECHA1
    )
    /*or(
          augrd         =  '05'
      and augbd         >  $parameters.P_FECHA1
    )*/
    or(
          augbd           > $parameters.P_FECHA1
    )
  )
