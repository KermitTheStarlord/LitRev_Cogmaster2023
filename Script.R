library(metafor)

#Read in your data file. This file needs to be in tab-separated value form.
#df <- read.csv("/Users/admin/Documents/Études/Cogmaster/2 Litterature Review/litrev_example_data_r.tsv",sep="\t)
df <- read.csv("/Users/admin/Documents/Études/Cogmaster/2 Litterature Review/FormatedData.csv",sep=",",)

summary(df) #This gives you an overview of your data


df_withES <- escalc(measure="SMD",
                    m1i=mean_stim_performance_real,
                    sd1i=std_stim_performance_real,
                    m2i=mean_stim_performance_placebo,
                    sd2i=std_stim_performance_placebo,
                    n1i=nb_participants_real,
                    n2i=nb_participants_placebo,
                    data=df)

#create forest & funnel plots
forest(df_withES$yi, df_withES$vi,slab=df_withES$name)

funnel(df_withES$yi, df_withES$vi)

#alternative: via meta-regression
res1 <- rma(yi, vi, data=df_withES,slab=df_withES$name)
res1

forest(res1)

funnel(res1)

# note, models can also declare predictors that are factors or continuous
# in this example, neither predictor is significant
res2 <- rma(yi, vi, mods = ~ factor(double.blind), data=df_withES)
res2

res3 <- rma(yi, vi, mods = ~ rejection_rate, data=df_withES)
res3

