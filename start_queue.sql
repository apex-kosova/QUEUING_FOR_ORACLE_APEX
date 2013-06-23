BEGIN
   
    dbms_aqadm.start_queue
    (
       queue_name => 'feedback_queue'
    );    

END;
/