CREATE OR REPLACE PROCEDURE feedback_nq
(
    p_feedback IN q_message
)
IS

    lkv_queue_name    CONSTANT VARCHAR2(60) := 'aquser.feedback_queue';
    lt_eopt           dbms_aq.enqueue_options_t;
    lt_mprop          dbms_aq.message_properties_t;
    lo_the_feedback   q_message;
    lt_enq_msgid      RAW(16);        
    
BEGIN
  
    dbms_aq.enqueue
    (
        queue_name         => lkv_queue_name,
        enqueue_options    => lt_eopt,
        message_properties => lt_mprop,
        payload            => p_feedback,
        msgid              => lt_enq_msgid
    );

    COMMIT;
    
END feedback_nq;
/