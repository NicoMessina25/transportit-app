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

----------------------------
alter table package
alter column recipientDocument varchar(30) not null

alter table package
alter column recipientFirstname varchar(50) not null

alter table package
alter column requestId bigint null

----------------------------

alter table routemap
add deleted datetime

alter table shippingrequest
add deleted datetime