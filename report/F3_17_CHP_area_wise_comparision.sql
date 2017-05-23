select ucde ,unit.name, count(eis) Total,
sum(case when substr(desg,3,5) in ('OPCHP','OPFBO') then 1 else 0 end) "CHP/FBO",
sum(case when substr(desg,3,5) in ('OPCVO') then 1 else 0 end) "Conv",
sum(case when substr(desg,3,5) in ('OPBKR') then 1 else 0 end) "Bunker",
sum(case when substr(desg,3,5) in ('EMFMC') then 1 else 0 end) "Supr Mech",
sum(case when substr(desg,3,5) in ('EMFEL') then 1 else 0 end) "Supr Elec",

sum(case when substr(desg,3,5) in ('MTFMC') then 1 else 0 end) "Fitter Mech",
sum(case when substr(desg,3,5) in ('MTFEL') then 1 else 0 end) "Fitter Ele",
sum(case when substr(desg,3,5) in ('MTWDR') then 1 else 0 end) "Welder",
sum(case when substr(desg,3,5) in ('OTGNZ') then 1 else 0 end) "Gen Maz"
 from employee left join unit on employee.ucde = unit.code where
--  ucde in (select distinct ucde from employee where sect  in ('OS_CHPB','CS_SIDI') )
ucde in ('C05NMO','C10HIR')
 and  sect  in ('OS_CHPB','CS_SIDI','CS_SOEM','CS_DEPT') 
  and
  substr(ucde,1,1) in ('C','O')
 group by ucde
  order by cast ( substr(ucde,2,2) as int)
 ;

 union
select "TOTAL" , "", count(eis) Total,
sum(case when substr(desg,3,5) in ('OPCHP','OPFBO') then 1 else 0 end) "CHP/FBO",
sum(case when substr(desg,3,5) in ('OPCVO') then 1 else 0 end) "Conv",
sum(case when substr(desg,3,5) in ('OPBKR') then 1 else 0 end) "Bunker",
sum(case when substr(desg,3,5) in ('EMFMC') then 1 else 0 end) "Supr Mech",
sum(case when substr(desg,3,5) in ('EMFEL') then 1 else 0 end) "Supr Elec",
sum(case when substr(desg,3,5) in ('MTFMC') then 1 else 0 end) "Fitter Mech",
sum(case when substr(desg,3,5) in ('MTFEL') then 1 else 0 end) "Fitter Ele",
sum(case when substr(desg,3,5) in ('MTWDR') then 1 else 0 end)  "Welder",
sum(case when substr(desg,3,5) in ('OTGNZ') then 1 else 0 end) "Gen Maz"
 from employee where sect in ('OS_CHPB','CS_SIDI') and substr(ucde,1,1) in ('C','O') 
 
