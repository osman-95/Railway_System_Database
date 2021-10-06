create database railway_system;
use railway_system;

create table Station(
	SID int primary key auto_increment,
    SName varchar(100),
    ProvID int references Province(ProvID)
);

create table Province(
	ProvID int primary key auto_increment,
    ProvinceName varchar(50)
);

create table Passenger(
	PID int primary key auto_increment,
    PLastName varchar(100) not null,
    PFirstName varchar(100) not null,
    Age int,
    Sex varchar(6)
);

create table Route(
	SeqID int not null primary key
);
create table Train(
	TID int primary key auto_increment,
    TName varchar(50) not null,
    SeqID int references Route(SeqID)
);

create table Track(
	TrackID int(2) primary key 
);
create table Sequence(
    TrackID int references Track(TrackID),
    SeqID int references Route(SeqID),
    constraint Sequence_primary_key primary key(SeqID,TrackID)
);
create table Connections(
	TrackID int references Track(TrackID),
    FromSID int references Station(SID),
    ToSID int references Station(SID),
    constraint Connection_primary_key primary key(TrackID,FromSID,ToSID)
);

create table Schedules(
    InTime date,
    OutTime date,
    TID int references Train(TID),
    SID int references Station(SID),
    constraint c_primary_key primary key(TID,SID)
);
create table PassengerBooking(
	BID int primary key,
    BDate date not null,
    BDepartTime time not null,
    BArrivalTime time not null,
    BCoach varchar(10) not null,
    BSeat varchar(10) not null,
    BPrice int not null,
    PID int references Passenger(PID),
    TID int references Train(TID)
);
create table Travel(
	BID int references Train(TID),
    StartSID int references Station(SID),
    EndSID int references Station(SID),
    constraint Travel_primary_key primary key(BID,StartSID, EndSID)
    )
