BEGIN
   dbms_aqadm.create_queue_table
   (
      queue_table        => 'feedback_queue_table',      
      queue_payload_type => 'q_message',      
      comment            => 'Creating feedback queue table'
   );
END;
/