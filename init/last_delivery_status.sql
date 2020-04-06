create   view   if not exists  carriers.last_delivery_status (operation_date, package_ref, point_ref, status_ref, id,carrier_ref) as
select ds.operation_date,ds.package_ref,ds.point_ref,ds.status_ref,ds.id,ds.carrier_ref from (select package_ref,max(operation_date) as last_date from carriers.delivery_status group by package_ref ) maxd inner join
carriers.delivery_status ds on maxd.package_ref=ds.package_ref and ds.operation_date=maxd.last_date
;
