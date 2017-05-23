--  select * from  sanc where substr(dscd,3,5)='CVOSR' and unit like '%08%';


select
-- areacode, type, gdesig
--,unit

d5
,GDESIG
,DSCD
,sum(tot) ext,sum(san) san 
, sum(case when substr(unit ,2,2) ='01'  then tot else 0 end) ext_CHN
, sum(case when  substr(unit ,2,2) ='01' then san else 0 end) san_CHN
, sum(case when  substr(unit ,2,2) ='02' then tot else 0 end) ext_BLR
, sum(case when  substr(unit ,2,2) ='02' then san else 0 end) san_BLR

, sum(case when  substr(unit ,2,2) ='03' then tot else 0 end) ext_WAN
, sum(case when  substr(unit ,2,2) ='03'then san else 0 end) san_WAN
, sum(case when  substr(unit ,2,2) ='04' then tot else 0 end) ext_WNN
, sum(case when  substr(unit ,2,2) ='04' then san else 0 end) san_WNN


, sum(case when  substr(unit ,2,2) ='05' then tot else 0 end) ext_MAJ
, sum(case when  substr(unit ,2,2) ='05' then san else 0 end) san_MAJ
, sum(case when  substr(unit ,2,2) ='06' then tot else 0 end) ext_NGP
, sum(case when  substr(unit ,2,2) ='06' then san else 0 end) san_NGP

, sum(case when  substr(unit ,2,2) ='07' then tot else 0 end) ext_UMR
, sum(case when  substr(unit ,2,2) ='07' then san else 0 end) san_UMR
, sum(case when  substr(unit ,2,2) ='08' then tot else 0 end) ext_PKD
, sum(case when  substr(unit ,2,2) ='08' then san else 0 end) san_PKD



, sum(case when  substr(unit ,2,2) ='09' then tot else 0 end) ext_PEN
, sum(case when  substr(unit ,2,2) ='09' then san else 0 end) san_PEN
, sum(case when  substr(unit ,2,2) ='10' then tot else 0 end) ext_KAN
, sum(case when  substr(unit ,2,2) ='10' then san else 0 end) san_KAN




from unit_dscd_ers where 1=1
--AND  dscd like '%TPDVR'
-- and
 and unit like '%AST'
-- and substr(dscd,3,5)<>'SCSEC'
-- and cadre ='XCD' and substr(dscd,3,5) not in ('OTGNZ','OTBDY','LGLIP','OTCOK' ,'OTLFO')
-- and substr(dscd,3,5) = 'OTGNZ' and type ='UG'
group by 
--d5
D5 --,DSCD
order by d5 --,gcd