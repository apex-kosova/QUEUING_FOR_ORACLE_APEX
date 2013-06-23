CREATE TYPE q_message AS OBJECT 
(
    id              NUMBER(10),
    title           VARCHAR2(100),
    details         VARCHAR2(4000),
    email_address   VARCHAR2(1000)
)
/