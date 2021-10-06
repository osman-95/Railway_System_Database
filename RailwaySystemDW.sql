
create table dw.Station(
	SID int primary key,
    SName varchar(100),
    SProvince varchar(10)
);

create table dw.Train(
	TID int primary key,
    TName varchar(50),
    TSeat varchar(5),
    TCoach varchar(2)
    );

create table dw.Times(
	TimeID int, 
    TDay varchar(10),
    TMonth varchar(10),
    TQuarter varchar(10),
    TYear varchar(10)
    );
    
create table dw.Sales(
    SalesID int primary key auto_increment,
    SID int references dw.Station(SID),
    TID int references dw.Train(TID),
    TimeID int references dw.Times(TimeID),
    No_Seats int, 
    Sales_Dollar int
    );

insert into dw.Station(SID, SName, SProvince)
select SID, SName,SProvince
from Station s, Province p
where s.ProvID=p.ProvID;

insert into dw.Train(TID,TName,TSeat,TCoach)
select t.TID,t.TName,pb.BSeat as TSeat,pb.BCoach as TCoach
from Train t, PassengerBooking pb
where t.TID=pb.TID;

insert into dw.Sales(SID,TID,No_Seats,Sales_Dollar)
select dw_t.TID,dw_s.SID,count(*),sum(pb.BPrice)
from op.PassengerBooking pb,op.Schedules sche,op.Travel tr,dw.Station dw_s, dw.Train dw_t
where pb.SID=dw_s.SID
and pb.TID=dw_t.TID
and sche.TID=dw_t.TID
and sche.BDepartTime=pb.InTime
and sche.SID=dw_s.SID
group by pb.BDate;