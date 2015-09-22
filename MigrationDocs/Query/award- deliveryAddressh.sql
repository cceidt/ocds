SELECT COUNT(1) FROM (SELECT 
  MUNICIPIO.DESCRIPCION AS locality,
  DEPARTAMENTO.DESCRIPCION AS region,
  'Colombia' AS countryName,
  ADJUDICACION.ID_ADJUDICACION AS id_award
FROM T_PTC_ADJUDICACIONES ADJUDICACION
LEFT JOIN T_PTC_PROCESOS PROCESO
  ON ADJUDICACION.ID_PROCESO = PROCESO.NUM_CONSTANCIA
LEFT JOIN TB_USUARIOLDAP USRLDAP
  ON PROCESO.USUARIO = USRLDAP.USUARIO
RIGHT JOIN T_PTC_DPTOS_EJECUCION DPTOEJE
  ON DPTOEJE.ID_PROCESO = PROCESO.NUM_CONSTANCIA
LEFT JOIN T_PTC_UBICACIONES_GEO MUNICIPIO
  ON DPTOEJE.ID_DEPARTAMENTO = MUNICIPIO.IDENTIFICADOR
LEFT JOIN T_PTC_UBICACIONES_GEO DEPARTAMENTO
  ON MUNICIPIO.IDENTIFICADOR_PADRE = DEPARTAMENTO.IDENTIFICADOR
WHERE 
  USRLDAP.IDENTIDAD <> '199999999'
  AND TRUNC(PROCESO.FECHA_CARGUE) BETWEEN TO_DATE('01/01/2015','DD/MM/YYYY') AND TO_DATE('19/08/2015','DD/MM/YYYY'))
;