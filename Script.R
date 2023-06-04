library(metafor)

# Modify the path accordingly
df <- read.csv("/Users/admin/Documents/Études/Cogmaster/2 Litterature Review/FormatedData.csv",sep=",",)

# Using the metafor library on formated data
df_withES <- escalc(measure="SMD",
                    m1i=mean_stim_performance_real,
                    sd1i=std_stim_performance_real,
                    m2i=mean_stim_performance_placebo,
                    sd2i=std_stim_performance_placebo,
                    n1i=nb_participants_real,
                    n2i=nb_participants_placebo,
                    data=df)

#create forest & funnel plots
res1 <- rma(yi, vi, data=df_withES,slab=df_withES$name)
forest(res1)
funnel(res1)
ranktest(res1)
#alternative: via meta-regression
res2 <- rma(yi, vi, data=df_withES,slab=df_withES$name)
forest(res2)
funnel(res2)
ranktest(res2)