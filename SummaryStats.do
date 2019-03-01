
numlabel, add 
// Link for missing codes: https://stats.idre.ucla.edu/stata/faq/how-can-i-recode-missing-values-into-different-categories/
// Step 1: classify non score responses as missing 
// Run the following code to create missing variables of nonscore responses 
// Missing variables will have a sub-category
mvdecode ri001re ri002re ri003re ri004re ri005re ri008re ri009re, mv(-3 = .d)
mvdecode hi111re hi116re hi113re hi115re hi118re hi119re, mv(-30 = .a \ -27 = .b \ -4 = .c \ -3 = .d \ -1 = .e)
mvdecode gi210rec gi211rec gi214rec gi215rec gi216rec, mv(-4 = .c \ -3 = .d \ -2 = .f)
mvdecode hi210rec hi211rec hi214rec hi215rec hi216rec, mv(-30 = .a \ -27 = .b \ -4 = .c)

mvdecode age75, mv(-3 = .d \ -2 = .f)

mvdecode gi111re gi113re gi115re gi116re gi118re gi119re, mv(-4 = .c \ -3 = .d \ -1 = .e)



// mvdecode ri001re ri002re ri003re ri004re ri005re ri008re ri009re, mv(-3)
// mvdecode hi111re hi116re hi113re hi115re hi118re hi119re, mv(-30 -27 -4 -3 -1) this will make missing values of nonscore entries
// mvdecode gi210rec gi211rec gi214rec gi215rec gi216rec, mv(-4 -3 -2)
// mvdecode hi210rec hi211rec hi214rec hi215rec hi216rec, mv(-30 -27 -4 -3)

// Cognition questions to graduates 1992-1993 (Set A) (cogn)
sum ri002re
sum ri003re
sum ri004re
sum ri005re
sum ri008re
sum ri009re

// Cognition questions to graduates 2011 (Set A) (jcogsim)
// The order of variables corresponds with the order of variables from Set A in 1992-93. Must keep in this order. 

sum hi111re 
sum hi116re
sum hi113re 
sum hi115re
sum hi118re 
sum hi119re


// The following sets of cognition questions were asked graduates the same thing in two separate waves
// Cognition questions to graduates 2004 (Set B)
// The order of variables for Set B must be kept in this order to correspond with waves
sum gi210rec 
sum gi211rec  
sum gi214rec 
sum gi215rec 
sum gi216rec 

// Cognition questions to graduates 2011 (Set B)

sum hi210rec 
sum hi211rec
sum hi214rec
sum hi215rec
sum hi216rec 

//net install sg67_1.pkg

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



// Create new variable for age in 2011 when cognition scores were collected 
generate age11 = age75+36
generate age05 = age75+30

// Generate new variables for cognition scores. This is the difference in scores from the most recent from the first score collected. 

generate na001 = gi111re - ri002re

generate na002 = gi113re - ri004re

generate na003 = gi115re - ri005re

generate na004 = gi116re - ri003re

generate na005 = gi118re - ri008re

generate na006 = gi119re - ri009re

table age05, contents(mean na001 sd na001 sum na001 )

// Generates a table of average total cognition score by age in 1975
tabulate age75, summarize(ri001re)

// Generates a table of average score for each cognition related questions by age in 2005
tabulate age05, summarize(gi111re)
tabulate age05, summarize(gi113re)
tabulate age05, summarize(gi115re)
tabulate age05, summarize(gi116re)
tabulate age05, summarize(gi118re)
tabulate age05, summarize(gi119re)

// Generates a table of scores in 1975 and then 2005 for the question "In what way are an orange and a banana alike?"
tabulate age75, summarize(ri002re)
tabulate age05, summarize(gi111re)

// Generates a table of scores in 1975 and then 2005 for the question "In what way are an eye and an ear alike?" 
tabulate age75, summarize(ri004re)
tabulate age05, summarize(gi113re)

// Generates a table of scores in 1975 and then 2005 for the question "In what way are an egg and a seed alike?"
tabulate age75, summarize(ri005re)
tabulate age05, summarize(gi115re)

// Generates a table of scores in 1975 and then 2005 for the question "In what way are a table and a chair alike?"
tabulate age75, summarize(ri003re)
tabulate age05, summarize(gi116re)

// Generates a table of scores in 1975 and then 2005 for the question "In what way are a fly and a tree alike?" 
tabulate age75, summarize(ri008re)
tabulate age05, summarize(gi118re)

// Generates a table of scores in 1975 and then 2005 for the question "In what way are praise and punishment alike?"
tabulate age75, summarize(ri009re)
tabulate age05, summarize(gi119re)



