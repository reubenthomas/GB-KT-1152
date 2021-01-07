# GB-KT-1152
I analyzed the data you sent me looking for differences in the odds of side-effects of drug treatment versus placebo for the three drugs (RAD001, MK and TAK228). I did not include data for the three other drugs which were included only in one study.

Method: I used generalized linear mixed effects models [McCulloch, Charles E., and John M. Neuhaus. "Generalized linear mixed models." Wiley StatsRef: Statistics Reference Online (2014).] (implemented in the lme4 [Douglas Bates, Martin Maechler, Ben Bolker, Steve Walker (2015). Fitting Linear Mixed-Effects Models Using lme4. Journal of Statistical Software, 67(1), 1-48. doi:10.18637/jss.v067.i01.] package in R) to estimate the relevant odds ratios where the StudyID was included as a random effect in the model and Drug as the fixed effect.

Results: I used two ways of counting the cardiac side-effects. For each of the two cases, I list the estimated odds-ratios along with their statistical significance.

1. Adding together the severe and non-severe side-effects (like you had done):
The odds ratio of a cardiac side-effect in a subject treated with RAD001 versus a cardiac side-effect in a subject treated with the placebo = exp(1.05) =2.86 , p-value=0.000743
The odds ratio of a cardiac side-effect in a subject treated with MK versus a cardiac side-effect in a subject treated with the placebo = exp(2.0871) =8.06 , p-value=1.13e-06
The odds ratio of a cardiac side-effect in a subject treated with TK228 versus a cardiac side-effect in a subject treated with the placebo = exp(2.0172) = 7.51, p-value=1.21e-05


2. Just using the severe side-effects
The odds ratio of a cardiac side-effect in a subject treated with RAD001 versus a cardiac side-effect in a subject treated with the placebo = exp(1.05) = 2.86, p-value=0.00124
The odds ratio of a cardiac side-effect in a subject treated with MK versus a cardiac side-effect in a subject treated with the placebo = exp(0.6346) = 1.88, p-value=0.29
The odds ratio of a cardiac side-effect in a subject treated with TK228 versus a cardiac side-effect in a subject treated with the placebo = exp(0.5303) = 1.70, p-value=0.42

Therefore, there are significant side-effects for all three drugs (relative to placebo) if one were to use both the severe and non-severe cases whereas the significant side-effects remain only for the RAD001 drug when only the severe cases are considered.
 
