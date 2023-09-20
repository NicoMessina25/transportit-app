alter table customer
alter column address varchar(30) null

alter table Customer
add deleted datetime

alter table Customer
drop column document

alter table Customer
add document varchar(30)

----------------------------

alter table Package
add deleted datetime

----------------------------

alter table ShippingRequest
add deleted datetime