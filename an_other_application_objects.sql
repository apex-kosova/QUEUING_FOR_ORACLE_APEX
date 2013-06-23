CREATE SEQUENCE feedback_seq
/

CREATE OR REPLACE PROCEDURE add_feedback
(  
    pv_title         IN VARCHAR2,
    pv_details       IN VARCHAR2,
    pv_email_address IN VARCHAR2
)
IS

   lo_feedback_message   aquser.q_message;

BEGIN

  lo_feedback_message := aquser.q_message
                         (                         
                            id            => feedback_seq.nextval,  
                            title         => pv_title, 
                            details       => pv_details, 
                            email_address => pv_email_address
                         );
    
    
   aquser.feedback_nq
   (
      p_feedback => lo_feedback_message
   );
    
END add_feedback;
/