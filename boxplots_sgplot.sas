libname a 'D:\UTD_JSOM\Fall2017\Adv BI\projects';

/*For box plot, first of the group variable should be sorted 
for eg : in the below case the attrition is the grouping variable hence it is sorted*/

proc sort data=a.attrition1;
by attrition;
run;
title 'Box plot of monthlyIncome on EducationField';
proc sgplot data=a.attrition1;
vbox monthlyIncome/ category=EducationField;
run;
title 'Box plot of monthlyIncome on attrition';
proc sgplot data=a.attrition1;
vbox monthlyIncome/ category=attrition;
run;
