DECLARE
  
   lt_feedback   aquser.q_message;
  
BEGIN
   
   lt_feedback := aquser.q_message
                  (
                     id            => 1, 
                     title         => 'Compliment', 
                     details       => 'Sample details', 
                     email_address => 'oracle@oracle.com'
                  );
  
   feedback_nq
   (
      p_feedback => lt_feedback
   );
  
END;      
