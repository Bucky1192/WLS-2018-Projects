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
generate age93 = age75+18

// Generate new variables for cognition scores. This is the difference in scores from the most recent from the first score collected. 

generate na001 = gi111re - ri002re

generate na002 = gi113re - ri004re

generate na003 = gi115re - ri005re

generate na004 = gi116re - ri003re

generate na005 = gi118re - ri008re

generate na006 = gi119re - ri009re */

table age05, contents(mean na001 sd na001 sum na001 )

// gi101re is the total of gi111re, gi113re, gi115re, gi116re, gi118re, gi119re
// 

// *** This is the only way I know how to combine so that both ages from the survey waves are in the column 
table ri001re age75 


_________________________________________________________________________________Keep everything below 

// Generates tables on cognition scores based on occupational level 

tabulate gf044jcg, summarize(ri101re)
tabulate gf044jpg, summarize(ri101re)


// Generates a table of average total cognition score by age 
tabstat ri001re, by(age93) s(mean sd max min)
tabstat gi101re, by(age05) s(mean sd max min)

// Generates a table of average score for each cognition wave related questions by age and gender in 2005
tabulate age93 sexrsp, summarize(ri101re)
tabulate age05 sexrsp, summarize(gi101re)

tabstat ri101re, by(sexrsp) s(mean sd max min)
tabstat gi101re, by(sexrsp) s(mean sd max min) 


// this table is a summary of how scores decrease with age 
table age05 if rw022red>0, contents( mean gi101re )
table age93 if rw022red>0, contents (mean ri001re)

// this table is a summary of how scores look for those who are retired 
table age05 if rw022red==1, contents( mean gi101re )

// this table is a summary of how scores look for those who did not retire (partly retired or currently working)
table age05 if rw022red>1, contents( mean gi101re )
//table age93 if rw022red>1, contents (mean ri001re)

// Generates a table of educational level and cognition scores from 2005 
// shows a higher percentage of individuals with higher education results in higher cognitive scores
	// cognition score from 1993
tabulate gb103red, summarize(ri101re)
	// cognition score from 2005
tabulate gb103red, summarize(gi101re)

//** THE FOLLOWING PRODUCES DETAILED TABLES OF EACH QUESTION ASKED RELATED TO COGNITION**
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


// Generates a table of relationship between self reported health and cognitive scores 
// mx001rer is the variable 

reg ri101re age05 gx201re
reg gi101re age05 gx201re


reg ri101re age93 mx001rer
reg gi101re age93 mx001rer


tabulate gx201re, summarize(ri101re)
tabulate gx201re, summarize(gi101re)


tabulate mx001rer, summarize(ri101re)
tabulate mx001rer, summarize(gi101re)



// gx201re: general self reported health collected in 2004/2005
// nx001rer: general self reported health collected in 1993-1994
// gi101re: 6-item score for the Cognition Similarities section. 2005
// ri101re: total cognition of 6 point questions that were asked again in each wave
// ri001re: total cognition of all questions asked in 1993 
// gf044jcg: 1990 Major occupation code for last or only job in current or last employment spell.
// gf044jpg: 1990 Major occupation code for last or only job in pre-retirement spell.
// hf002js: current employment status in 2011
// hf015j1d: 1990 Census detailed occupation code for first or only job in Participant’s first employer job spell. collected in 2011


