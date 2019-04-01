// Use the following link to access data via Box: 
// https://uwmadison.box.com/s/929nk193fyu2s99wa7fz2kkl183da3fo


/*numlabel, add 
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

// Create new variable for age in 2011 when cognition scores were collected 
generate age11 = age75+36
generate age05 = age75+30

// Generate new variables for cognition scores. This is the difference in scores from the most recent from the first score collected. 

generate na001 = gi111re - ri002re

generate na002 = gi113re - ri004re

generate na003 = gi115re - ri005re

generate na004 = gi116re - ri003re

generate na005 = gi118re - ri008re

generate na006 = gi119re - ri009re */

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

// Generates a table of retirement status and what age the individual is
tabulate rw022red, summarize(age05)

// Generates a table of educational level and cognition scores from 2005 
// shows a higher percentage of individuals with higher education results in higher cognitive scores
tabulate gb103red, summarize(ri002re)
tabulate gb103red, summarize(ri004re)
tabulate gb103red, summarize(ri005re) 
tabulate gb103red, summarize(ri003re) 
tabulate gb103red, summarize(ri008re) 
tabulate gb103red, summarize(ri009re)


// Generates a table of relationship between self reported health and cognitive scores 
// mx001rer is the variable 

reg ri002re age05 gx201re
reg ri004re age05 gx201re
reg ri005re age05 gx201re
reg ri003re age05 gx201re
reg ri008re age05 gx201re
reg ri009re age05 gx201re

reg ri002re age05 nx001rer
reg ri004re age05 nx001rer
reg ri005re age05 nx001rer
reg ri003re age05 nx001rer
reg ri008re age05 nx001rer
reg ri009re age05 nx001rer

tabulate gx201re, summarize(ri002re)
tabulate gx201re, summarize(ri004re)
tabulate gx201re, summarize(ri005re)
tabulate gx201re, summarize(ri003re)
tabulate gx201re, summarize(ri008re)
tabulate mx001rer, summarize(ri009re)

tabulate nx001rer, summarize(ri002re)
tabulate nx001rer, summarize(ri004re)
tabulate nx001rer, summarize(ri005re)
tabulate nx001rer, summarize(ri003re)
tabulate nx001rer, summarize(ri008re)
tabulate nx001rer, summarize(ri009re)





