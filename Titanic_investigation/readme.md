# Investigate Titanic dataset

Here I have Titanic dataset with its describe  and I try to explore it to see

What factors made people more likely to survive

## Age Factor
![alt text](https://github.com/Mogady/udacity-data-analysis-nanodegree/blob/master/Titanic_investigation/age.png)

So, let&#39;s start with a histogram of distribution of different ages that survived and not survived the accident

Form this diagram we see that there is more young age people survived than non-survived and this is expected because we know the children&#39;s evacuated first so they could survive.

So, here I made a T-statistic test to ensure this result and see if age factor might affect the Survival of people or not

### P value and statistical significance:
 The two-tailed P value equals 0.0391
 By conventional criteria, this difference is considered to be statistically significant.

### Confidence interval:
 The mean of Group One minus Group Two equals 2.28248900
 95% confidence interval of this difference: From 0.11261619 to 4.45236181

### Intermediate values :
 t = 2.0667
 df = 712
 standard error of difference = 1.104

As expected the Pvalue is &lt;5% which mean the age factor is reason for survived people.

## Gender Factor:

Now let&#39;s examine the gender factor and how many females survived and males and who had the best chance.
![alt text](https://github.com/Mogady/udacity-data-analysis-nanodegree/blob/master/Titanic_investigation/gender1.png)
![alt text](https://github.com/Mogady/udacity-data-analysis-nanodegree/blob/master/Titanic_investigation/gender2.png)
Again, with the histogram we see that more females survived more than males and this is also expected because they evacuated first with children&#39;s.

I also made a T-statistic test to ensure this and here are the results

### P value and statistical significance:
The two-tailed P value is less than 0.0001
By conventional criteria, this difference is considered to be extremely statistically significant.

### Confidence interval:
 The mean of Group One minus Group Two equals 0.55313000
 95% confidence interval of this difference: From 0.49681566 to 0.60944434

### Intermediate values :
 t = 19.2978
 df = 889
 standard error of difference = 0.029

Here we see p value is too low which mean the gender was an extremely factor that affects the survival of people as expected.

## Embarked Factor:
![alt text](https://github.com/Mogady/udacity-data-analysis-nanodegree/blob/master/Titanic_investigation/embarked.png)

While exploring the data I noticed that there is a lot of people that comes from Southampton so I wanted we might expect to see more survived people from Southampton here I ensure that by making Anove test to compare between the three ports.

|   | **SS** | **df** | **MS** | **F** | **p** |
| --- | --- | --- | --- | --- | --- |
| **Between:** | **6.253** | **2** | **3.126** | **13.598** | **0.000** |
| **Within:** | **203.704** | **886** | **0.230** |   |   |
| **Total:** | **209.957** | **888** |   |   |   |

We see the p value is too low that mean because of more people comes from Southampton port they had chance to survive more than others .
