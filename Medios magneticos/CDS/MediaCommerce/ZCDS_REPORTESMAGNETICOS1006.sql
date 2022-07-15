@AbapCatalog.sqlViewName: 'ZCDS_RMM1006'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'REPORTE MEDIOS MAGNETICOS FORMATO 1006'

define view ZCDS_REPORTESMAGNETICOS1006
  with parameters
    P_FECHA1 : abap.dats,
    P_FECHA2 : abap.dats,
    P_BUKRS  : abap.char(12)



  as select from dfkkopk
    inner join   dfkkop        on dfkkop.opbel = dfkkopk.opbel
    inner join   dfkkbptaxnum  on dfkkbptaxnum.partner = dfkkop.gpart
    inner join   ztfe_cod_dian on ztfe_cod_dian.taxtype = dfkkbptaxnum.taxtype
    inner join   but000        on but000.partner = dfkkop.gpart
  /*   inner join   bseg          on  bseg.lifnr = dfkkop.gpart
                                and bseg.saknr = dfkkop.hkont*/




{
  key dfkkop.gpart             as NUMERO_INTERLOCUTOR,
      dfkkop.opbel             as NUMERO_DOCMENTO,
      dfkkopk.hkont            as cuenta_mayor,
      dfkkop.opupk             as N,
      dfkkop.opupz             as n2,
      ztfe_cod_dian.typeperson as TIPO_DE_DOCUMENTO,
      dfkkbptaxnum.taxnum      as NUMERO_DE_IDENTIFICACION,
      name_last                as PRIMER_APELLIDO,
      name_last2               as SEGUNDO_APELLIDO,
      name_first               as PRIMER_NOMBRE,
      but000.mc_name1          as OTROS_NOMBRES,
      but000.mc_name2          as OTROS__NOMBRES,
      dfkkopk.opupk            as posicion,
      augbd                    as fecha,
      budat                    as fecha2,
      augrd                    as agrd,
      case when dfkkopk.betrh < 0
      then dfkkopk.betrh *(-100)
      else dfkkopk.betrh *(100)
        end                    as IMPUESTOS
      //bseg.dmbtr               as IVA



}

where

          dfkkopk.bukrs = $parameters.P_BUKRS
  and     dfkkop.opupk  = '0001'
  and     dfkkop.opupz  = '000'
  and(
          dfkkopk.hkont = '2408010001'
    or    dfkkopk.hkont = '2408010002'

  )

  and     budat         <= $parameters.P_FECHA1
  and     budat         >= $parameters.P_FECHA2
  and(
    (
          augrd != '05'
      and augbd         <= $parameters.P_FECHA1
    )
    or(
          augbd         > $parameters.P_FECHA1
    )
  )
/* and(
         bseg.mwskz    = 'V0'
   or    bseg.mwskz    = 'V1'
   or    bseg.mwskz    = 'V2'
   or    bseg.mwskz    = 'V3'
   or    bseg.mwskz    = 'V4'
   or    bseg.mwskz    = 'V5'
   or    bseg.mwskz    = 'V6'
   or    bseg.mwskz    = 'V7'
   or    bseg.mwskz    = 'V8'
   or    bseg.mwskz    = 'V9'
   or    bseg.mwskz    = 'VT'
 )*/




;