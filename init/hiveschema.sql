create table if not exists  carrier.carriers_list(id decimal(10,0),carrier_name string)
  create table if not exists  carrier.delivery_status
   (carrier_ref decimal(10,0),
     operation_date date,
	package_ref decimal(10,0),
	point_ref decimal(10,0),
	status_ref decimal(5,0),
	id decimal(10,0)
);
create table  if not exists carrier.packages
   (	id decimal(10,0),
   carrier_ref decimal(10,0),
	acceptance_date date,
	start_point decimal(10,0),
	end_point decimal(10,0)
);
  create table carrier.planned_routes
   (	id decimal(10,0),
   carrier_ref decimal(10,0),
	package_ref decimal(10,0),
	point_decimal decimal(3,0),
	point_ref decimal(10,0)
);
  create table carrier.statuses
   (	id decimal(5,0),
	status_name string
);

  create  view if not exists carrier.current_delivery_status (operation_date, package_ref, point_ref, status_ref, id,carrier_ref) as
  select ds.operation_date,ds.package_ref,ds.point_ref,ds.status_ref,ds.id,ds.carrier_ref from carrier.delivery_status ds join (select id,max(operation_date) from delivery_status group by id) dsmax
on ds.id=dsmax.id
;

  create or replace force editionable view carrier.last_delivery_status (operation_date, package_ref, point_ref, status_ref, id,carrier_ref) as
  select ds.operation_date,ds.package_ref,ds.point_ref,ds.status_ref,ds.id,ds.carrier_ref from (select package_ref,max(operation_date) as last_date from delivery_status group by package_ref ) maxd inner join
delivery_status ds on maxd.package_ref=ds.package_ref and ds.operation_date=maxd.last_date
;
