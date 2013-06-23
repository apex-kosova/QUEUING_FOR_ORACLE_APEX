BEGIN
   
    dbms_aqadm.create_queue
    (
       queue_name  => 'feedback_queue',
       queue_table => 'feedback_queue_table',
       comment     => 'feedback queue'
    );    

END;
/