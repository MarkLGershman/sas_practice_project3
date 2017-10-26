/* significantly different from 0. AADM and AADD (age of death in month and days). The paired samples T Test compares the means
of the two variables. It computes the difference between the two variables for each case and tests to see if the average diff 
is significantly diff from zero*/
proc ttest data=mar.Missing_data1;
paired aadm*aadd;
run;


/*The Independent samples T Test compares the mean scores of two groups on a given variable. Class is independent variable. */
proc ttest data=mar.Missing_data1;
class sex;
var aadm;
format sex sex.;
run;

/* independent vs dependent. Yearly sale of a sales person is a dependent variable. Yearly sales are dependent on
sales education. Dependent variable is infringed by independent variable. Multi variant analysis. Linear. 1 dependent 1 independent. 
Compare means 3 or more independent variable.*/

/* the one way analysis of variance (anova) is used to determine whether there are any significant differences between the means
of three or more independent (unrelated) groups. Anova is used when you have a categorical independent variable with two or more categories. */

proc glm data=mar.Missing_data1;
/* if 2 group, do independent sampling */
class Area;
model aadm=Area;
means Area;
run;
quit;
/* modelling. How are they correlated? How strongly are they correlated? Do Analysis, regression analysis. Test the correlation.
Correlation value from -1 to +1. In the middle is 0, which means no correlation. In the middle of 0 and 1 is .5, which is strong positive correlation.
+1 and -1 are perfect negative or positive correlation. Strong negative correlation is between -.5 and -1.*/
/* BS: begin salary CS: current salary. For ex, compare marker to one of it's replicaes in the same company. If you compare to 
another company and get .88, you find a strong positive correlation. */
/* proc corr data=mar.Empdb*/
proc corr data=mar.Empdb; 
var salary hired;
run;
proc corr data=mar.empdataa;
var salbegin salary jobcat educ;
run;

proc reg data=mar.emdataa;
model SALARY=jobcat;
run;
quit;
