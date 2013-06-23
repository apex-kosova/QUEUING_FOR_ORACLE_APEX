CREATE OR REPLACE PROCEDURE feedback_dq
IS

   lkv_queue_name        CONSTANT VARCHAR2(60) := 'aquser.feedback_queue';
   lt_dq_opt             dbms_aq.dequeue_options_t;
   lt_mprop              dbms_aq.message_properties_t;
   lo_the_feedback       q_message;
   lt_deq_msgid          RAW(16);
   lb_further_feedback   BOOLEAN := TRUE;

   le_no_messages        EXCEPTION;
   PRAGMA EXCEPTION_INIT(le_no_messages, -25228);

BEGIN

   lt_dq_opt.wait := DBMS_AQ.NO_WAIT;

   WHILE lb_further_feedback
   LOOP
      BEGIN
         dbms_aq.dequeue
         (
            queue_name         => lkv_queue_name,
            dequeue_options    => lt_dq_opt,
            message_properties => lt_mprop,
            payload            => lo_the_feedback,
            msgid              => lt_deq_msgid
         );

         INSERT INTO feedback(id,
                              title,
                              details,
                              email_address,
                              date_time_created)
         VALUES(lo_the_feedback.ID,
                lo_the_feedback.title,
                lo_the_feedback.details,
                lo_the_feedback.email_address,
                SYSDATE);

         COMMIT;

      EXCEPTION

         WHEN le_no_messages THEN

            lb_further_feedback := FALSE;

      END;

   END LOOP;

END feedback_dq;
