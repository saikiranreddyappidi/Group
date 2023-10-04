-- auto-generated definition
create table bookings
(
    `sl.no` int auto_increment
        primary key,
    trainno varchar(45)                   not null,
    uname   varchar(45)                   not null,
    seats   int                           null,
    status  varchar(45) default 'pending' null
);

-- auto-generated definition
create table trains
(
    slno       int auto_increment,
    name       varchar(45) not null,
    train_no   varchar(45) not null,
    start      varchar(45) not null,
    end        varchar(45) not null,
    start_time datetime    not null,
    end_time   datetime    not null,
    primary key (slno, train_no)
);

-- auto-generated definition
create table user_login
(
    `sl.no`  int auto_increment
        primary key,
    username varchar(45) not null,
    paswd    varchar(45) null,
    datetime datetime    null
);

-- auto-generated definition
create table users
(
    id       int auto_increment
        primary key,
    username varchar(30)                        not null,
    email    varchar(50)                        not null,
    password varchar(255)                       not null,
    reg_date datetime default CURRENT_TIMESTAMP not null
);

-- auto-generated definition
create table users_reg
(
    `sl.no`    int auto_increment,
    email      varchar(45) not null,
    password   varchar(45) not null,
    first_name varchar(45) not null,
    last_name  varchar(45) null,
    address    varchar(45) not null,
    phno       varchar(15) not null,
    primary key (`sl.no`, email, phno),
    constraint email_UNIQUE
        unique (email),
    constraint phno_UNIQUE
        unique (phno)
);

