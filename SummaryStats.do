
//numlabel, add 
mvdecode ri002re ri003re ri004re ri005re ri008re ri009re, mv(-37 = .a \ -22 = .b \ -4 = .c \ -3 = .d \ -1 = .e)
mvdecode hi111re hi116re hi113re hi115re hi118re hi119re, mv(-30 = .f \ -27 = .g \ -4 = .c \ -3 = .d \ -1 = .e)
mvdecode gi210rec gi211rec gi214rec gi215rec gi216rec, mv(-4 = .c \ -3 = .d \ -2 = .h)
mvdecode hi210rec hi211rec hi214rec hi215rec hi216rec, mv(-30 = .f \ -27 = .g \ -4 = .c \ -3 = .d)

// Step 1: classify non score responses as missing (Ask Lindsey if this will change anything)
// Run the following code to create missing variables of nonscore responses 
// mvdecode ri001re ri002re ri003re ri004re ri005re ri008re ri009re, mv(-3)
// mvdecode hi111re hi116re hi113re hi115re hi118re hi119re, mv(-30 -27 -4 -3 -1) this will make missing values of nonscore entries
// mvdecode gi210rec gi211rec gi214rec gi215rec gi216rec, mv(-4 -3 -2)
// mvdecode hi210rec hi211rec hi214rec hi215rec hi216rec, mv(-30 -27 -4 -3)

// Cognition questions to graduates 1992-1993 (Set A) (cogn)
tab ri002re ri003re ri004re ri005re ri008re ri009re

sum ri002re
sum ri003re
sum ri004re
sum ri005re
sum ri008re
sum ri009re

// Cognition questions to graduates 2011 (Set A) (jcogsim)
// The order of variables corresponds with the order of variables from Set A in 1992-93. Must keep in this order. 
tab hi116re hi113re hi115re hi118re hi119re 

sum hi111re 
sum hi116re
sum hi113re 
sum hi115re
sum hi118re 
sum hi119re


// The following sets of cognition questions were asked graduates the same thing in two separate waves
// Cognition questions to graduates 2004 (Set B)
// The order of variables for Set B must be kept in this order to correspond with waves
tab gi210rec gi211rec gi214rec gi215rec gi216rec

sum gi210rec 
sum gi211rec  
sum gi214rec 
sum gi215rec 
sum gi216rec 

// Cognition questions to graduates 2011 (Set B)
tab hi210rec hi211rec hi214rec hi215rec hi216rec

sum hi210rec 
sum hi211rec
sum hi214rec
sum hi215rec
sum hi216rec 


// Descriptive stats for questions asked in 1992-93 by age (Set A)
univar ri002re ri003re ri004re ri005re ri008re ri009re

// Descriptive stats for questions asked in 2011 by age (Set A)
univar hi111re hi116re hi113re hi115re hi118re hi119re

// Descriptive 2004 (Set B)
univar gi210rec gi211rec gi214rec gi215rec gi216rec 

// Descriptive 2011 (Set B)
univar hi210rec hi211rec hi214rec hi215rec hi216rec 

// Retirement descriptive stats
// The following variable asked graduates if they are retired, partially retired, or not retired at all?
tab ht112re

