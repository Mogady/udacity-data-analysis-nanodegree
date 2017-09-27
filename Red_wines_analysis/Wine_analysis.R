Mydata=read.csv("C:/Users/ahmed/Downloads/wineQualityReds.csv")
install.packages('ggplot2')
install.packages('ggthemes',dependencies = TRUE)
install.packages('tidyr')
install.packages('plyr')
install.packages('psych')
library('ggplot2')
library('ggthemes')
library('gridExtra')
library('dplyr')
library('psych')
d1<-ggplot(data = Mydata,aes(quality))+geom_bar()
d2<-ggplot(data = Mydata,aes(fixed.acidity))+geom_histogram(bins = 15)
d3<-ggplot(data = Mydata,aes(volatile.acidity))+geom_histogram(bins = 20)
d4<-ggplot(data = Mydata,aes(citric.acid))+geom_histogram(bins = 20)
grid.arrange(d1,d2,d3,d4)
d5<-ggplot(data = Mydata,aes(residual.sugar))+geom_histogram(bins = 20)
d6<-ggplot(data = Mydata,aes(chlorides))+geom_histogram(bins = 50)
d7<-ggplot(data = Mydata,aes(total.sulfur.dioxide))+geom_histogram(bins = 50)
d8<-ggplot(data = Mydata,aes(free.sulfur.dioxide))+geom_histogram(bins = 15)
grid.arrange(d5,d6,d7,d8)
d9<-ggplot(data = Mydata,aes(sulphates))+geom_histogram(bins = 15)
d10<-ggplot(data = Mydata,aes(pH))+geom_histogram(bins = 15)
d11<-ggplot(data = Mydata,aes(density))+geom_histogram(bins = 15)
d12<-ggplot(data = Mydata,aes(alcohol))+geom_histogram(bins = 15)
grid.arrange(d9,d10,d11,d12)
quality_min <- min(Mydata$quality)
quality_max <- max(Mydata$quality)
quality_mean <- mean(Mydata$quality)
quality_median <- median(Mydata$quality)
cor(x=Mydata[,2:12], y=Mydata$quality)
data_quality<-group_by(Mydata,quality)
summary(Mydata$alcohol)
Mydata.quality_means<-summarise(data_quality,fixed_acid_mean=mean(fixed.acidity),
          volatile_acid_mean=mean(volatile.acidity),
          citric_acid_mean=mean(citric.acid),
          sugar_mean=mean(residual.sugar),
          salt_mean=mean(chlorides),
          sulfur_mean=mean(total.sulfur.dioxide),
          sulphates_mean=mean(sulphates),
          density_mean=mean(density),
          alcohol_mean=mean(alcohol)
          )
ggplot(aes(x=alcohol_mean,y=quality),data = Mydata.quality_means)+geom_line()+geom_point()
ggplot(aes(y=alcohol,x=quality),data = Mydata)+geom_boxplot(aes(group=cut_width(quality,1)))
alcohol_mean <- mean(Mydata$alcohol)
alcohol_median <- median(Mydata$alcohol)
ggplot(data=Mydata, aes(x=quality, y=alcohol)) +
  geom_boxplot(aes(group=cut_width(quality,1))) +
  geom_hline(show.legend =T, yintercept=alcohol_mean, linetype='longdash', alpha=.5, color='blue') +
  geom_vline(xintercept =quality_mean, linetype='longdash', color='blue', alpha=.5) +
  xlab("Wine Quality") +
  ylab("Alcohol")
summary(Mydata$citric.acid)
citric.acid_mean <- mean(Mydata$citric.acid)
citric.acid_median <- median(Mydata$citric.acid)
ggplot(aes(x=citric_acid_mean,y=quality),data = Mydata.quality_means)+geom_line()
ggplot(data=Mydata, aes(x=quality, y=citric.acid)) +
  geom_boxplot(aes(group=cut_width(quality,1))) +
  geom_hline(show.legend =T, yintercept=citric.acid_mean, linetype='longdash', alpha=.5, color='blue') +
  geom_vline(xintercept =quality_mean, linetype='longdash', color='blue', alpha=.5) +
  xlab("Wine Quality") +
  ylab("citric acid")
summary(Mydata$volatile.acidity)
volatile.acidity_mean <- mean(Mydata$volatile.acidity)
volatile.acidity_median <- median(Mydata$volatile.acidity)
Mydata.quality_means$volatile_acid_mean
ggplot(aes(x=volatile_acid_mean,y=quality),data = Mydata.quality_means)+geom_line()+geom_point()
Mydata <- transform(Mydata, is.bad = quality<5)
bad.reds <- table(Mydata$is.bad)
bad.reds
ggplot(data=Mydata, aes(x=is.bad, y=volatile.acidity)) +
  geom_boxplot() +
  geom_hline(show.legend =T, yintercept=volatile.acidity_mean, linetype='longdash', alpha=.5, color='red')+
  scale_x_discrete(labels=c('good','bad'))+
  xlab("Wine quality") +
  ylab("Volatile Acidity")

ggplot(data=Mydata, aes(x=is.bad, y=citric.acid)) +
  geom_boxplot() +
  geom_hline(show.legend =T, yintercept=citric.acid_mean, linetype='longdash', alpha=.5, color='red')+
  scale_x_discrete(labels=c('good','bad'))+
  xlab("Wine quality") +
  ylab("citric Acidity")

ggplot(data=Mydata, aes(x=is.bad, y=citric.acid)) +
  geom_boxplot() +
  geom_hline(show.legend =T, yintercept=citric.acid_mean, linetype='longdash', alpha=.5, color='red')+
  scale_x_discrete(labels=c('good','bad'))+
  xlab("Wine quality") +
  ylab("citric Acidity")

p4<-ggplot(aes(x=sugar_mean,y=quality),data = Mydata.quality_means)+geom_line()
p5<-ggplot(aes(x=salt_mean,y=quality),data = Mydata.quality_means)+geom_line()
grid.arrange(p4,p5)
pairs(Mydata[,-12], gap=0, pch=19, cex=0.4, col="darkblue")
