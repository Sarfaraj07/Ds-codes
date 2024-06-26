y1 = c(18.2, 20.1, 17.6, 16.8, 18.8, 19.7, 19.1)
y2 = c(17.4, 18.7, 19.1, 16.4, 15.9, 18.4, 17.7)
y3 = c(15.2, 18.8, 17.7, 16.5, 15.9, 17.1, 16.7)

y = c(y1, y2, y3)
n = rep(7, 3)
n
group = rep(1:3, n)
group
tmp = tapply(y, group, stem)
stem(y)
tmpfn = function(x) c(sum = sum(x), mean = mean(x), var = var(x),n = length(x))
tapply(y, group, tmpfn)
tmpfn(y)
data = data.frame(y = y, group = factor(group))
fit = lm(y ~ group, data)
anova(fit)
df = anova(fit)[, "Df"]
names(df) = c("trt", "err")
df
alpha = c(0.05, 0.01)
qf(alpha, df["trt"], df["err"], lower.tail = FALSE)
anova(fit)["Residuals", "Sum Sq"]
anova(fit)["Residuals", "Sum Sq"]/qchisq(c(0.025, 0.975), 18,lower.tail = FALSE)