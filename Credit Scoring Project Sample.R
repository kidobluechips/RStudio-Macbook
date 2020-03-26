#https://github.com/chrisliti/Credit-Scoring/blob/master/Credit%20Scoring%20Script.R

train <- read.csv("C:/Users/Chris Liti/Desktop/R Data/loan_pred_3/train.csv",na.strings = c("","NA"))
test <- read.csv("C:/Users/Chris Liti/Desktop/R Data/loan_pred_3/test.csv",na.strings = c("","NA"))
str(train)
test$Loan_Status <- NA
loan_data <- rbind(train,test)

str(loan_data)

prop.table(table(train$Loan_Status))

pie(table(train$Loan_Status),labels = levels(train$Loan_Status))

#About 31% of the trainset population had their l0ans rejected


prop.table(table(loan_data$Gender))
levels(loan_data$Gender) <- c(levels(loan_data$Gender),"Missing")
loan_data$Gender[is.na(loan_data$Gender)] <- "Missing"
prop.table(table(loan_data$Gender,loan_data$Loan_Status),1)
library(ggplot2)
ggplot(train,aes(x=Gender,fill=Loan_Status))+geom_bar(stat="count",position = "fill")+
  ggtitle("Approval Rates By Gender")
#Of the 24% with missing gender about 38% had their loans rejected

table(loan_data$Married,useNA = "ifany")
loan_data$Married[is.na(loan_data$Married)] <- "Yes"
prop.table(table(loan_data$Married))
#about 65% of the population is married
prop.table(table(Married=train$Married,Approved=train$Loan_Status),1)
train$Married[is.na(train$Married)] <- "Yes"
ggplot(train,aes(x=Married,fill=Loan_Status))+geom_bar(stat="count",position = "fill")+
  ggtitle("Approval Rates According To Marriage")


#Unmarried folks had a higher than usualloan rejection rate.

table(loan_data$Dependents)
levels(loan_data$Dependents) <- c(levels(loan_data$Dependents),"Missing")
loan_data$Dependents[is.na(loan_data$Dependents)] <- "Missing"
table(train$Dependents,useNA = "ifany")
prop.table(table(train$Dependents,train$Loan_Status),1)
# 2 dependents has the highest approval rates but there is no evident trend



prop.table(table(train$Education,train$Loan_Status),1)

ggplot(train,aes(x=Education,fill=Loan_Status))+geom_bar(stat="count",position = "fill")+
  ggtitle("Approval Rates According To Education")
#Non-Graduates have higher than usual rejection rates

table(loan_data$Self_Employed)
levels(loan_data$Self_Employed) <- c(levels(loan_data$Self_Employed),"Missing")
loan_data$Self_Employed[is.na(loan_data$Self_Employed)] <- "Missing"
prop.table(table(loan_data$Self_Employed))
prop.table(table(train$Self_Employed,train$Loan_Status),1)
ggplot(train,aes(x=Self_Employed,fill=Loan_Status))+geom_bar(position = "fill")
#Self_Employed doesnt seem to have a significant difference in approval rates


summary(loan_data$ApplicantIncome)
sum(is.na(loan_data$ApplicantIncome))
sum(loan_data$ApplicantIncome==0)
loan_data[loan_data$ApplicantIncome==0,"Loan_Status"]
ggplot(train,aes(x=Loan_Status,y=ApplicantIncome))+geom_boxplot(col="blue")+coord_cartesian(ylim=c(0,8000))+ggtitle("Boxplots of Applicants Income")
ggplot(train,aes(x=ApplicantIncome,color=Loan_Status))+geom_density()+ggtitle("Density Plots Of Applicant Income")

ggplot(train,aes(x=ApplicantIncome,y=Loan_Status,col=Loan_Status))+geom_point()+ggtitle("Income According to Approval Rates")
by(train$ApplicantIncome,train$Loan_Status,FUN = summary)

#Applicant Income doesnt have a significamt impact on Loan Approval rates




summary(loan_data$CoapplicantIncome)
sum(is.na(loan_data$CoapplicantIncome))


ggplot(train,aes(x=CoapplicantIncome,color=Loan_Status))+geom_density()
ggplot(train,aes(x=log(CoapplicantIncome),color=Loan_Status))+geom_density()+ggtitle("Density plots of Log of Applicant Income")

ggplot(train,aes(x=Loan_Status,y=CoapplicantIncome,col=I("blue")))+geom_boxplot()+coord_cartesian(ylim = c(0,5000))+ggtitle("Boxplots Of Coapplicant Income")
by(train$CoapplicantIncome,train$Loan_Status,FUN = summary)


loan_data$TotalIncome <- loan_data$ApplicantIncome+loan_data$CoapplicantIncome
train$TotalIncome <- train$ApplicantIncome+train$CoapplicantIncome
summary(loan_data$TotalIncome)
ggplot(train,aes(x=log(TotalIncome),color=Loan_Status))+geom_density()+ggtitle("Density plots of Log of Total Income")
by(train$TotalIncome,train$Loan_Status,FUN = summary)

ggplot(train,aes(log(ApplicantIncome),log(CoapplicantIncome),col=Loan_Status))+geom_point()+ggtitle("Scatter Plot Of Applicant And\n Coapplicant Income")

summary(loan_data$LoanAmount)
sum(is.na(loan_data$LoanAmount))
ggplot(train,aes(x=log(LoanAmount),color=Loan_Status))+geom_density()+ggtitle("Loan Amount Distribution")
loan_data[is.na(loan_data$LoanAmount),"LoanAmount"] <- median(loan_data$LoanAmount,na.rm = T)
train[is.na(train$LoanAmount),"LoanAmount"] <- median(train$LoanAmount,na.rm = T)


by(train$LoanAmount,train$Loan_Status,FUN = summary)


summary(loan_data$Loan_Amount_Term)
loan_data[is.na(loan_data$Loan_Amount_Term),"Loan_Amount_Term"] <- median(loan_data$Loan_Amount_Term,na.rm = T)
train[is.na(train$Loan_Amount_Term),"Loan_Amount_Term"] <- median(train$Loan_Amount_Term,na.rm = T)
table(loan_data$Loan_Amount_Term)
prop.table(table(loan_data$Loan_Amount_Term,loan_data$Loan_Status),1)
loan_data$Loan_Amount_Term <- as.numeric(loan_data$Loan_Amount_Term)



loan_data$Installments <- loan_data$LoanAmount*1000/loan_data$Loan_Amount_Term
summary(loan_data$Installments)
loan_data[which(loan_data$Installments>5000),]

loan_data$ApplicantIncome <- as.numeric(loan_data$ApplicantIncome)
loan_data[loan_data$ApplicantIncome==0,"ApplicantIncome"] <- median(loan_data$ApplicantIncome,na.rm = T)



loan_data$Installment_Income_Ratio <- loan_data$Installments/loan_data$ApplicantIncome
summary(loan_data$Installment_Income_Ratio)

table(loan_data$Credit_History,useNA = "ifany")
levels(loan_data$Credit_History) <- c(levels(loan_data$Credit_History),"99")
loan_data[is.na(loan_data$Credit_History),"Credit_History"] <- "99"
loan_data$Credit_History <- factor(loan_data$Credit_History)
prop.table(table(loan_data$Credit_History,loan_data$Loan_Status),1)
ggplot(train,aes(x=Credit_History,fill=Loan_Status))+geom_bar(position = "fill")+ggtitle("Approval Rates According To Credit History")


table(loan_data$Property_Area)
prop.table(table(loan_data$Property_Area,loan_data$Loan_Status),1)
ggplot(train,aes(x=Property_Area,fill=Loan_Status))+geom_bar(position = "fill")+ggtitle("Approval Rates According to Property Area")



train_data <- loan_data[1:614,]
test_data <- loan_data[615:981,]

train_data2 <- train_data[,-1]
test_data2 <- test_data[,-1]

names(loan_data)
library(randomForest)
sum(is.na(loan_data))
sum(is.na(train_data2))
summary(train_data2)
set.seed(1234)
rand_model_full<- randomForest(Loan_Status~.,data=train_data2,mtry=5,ntree=500,importance=TRUE)
varImpPlot(rand_model_full)
rand_preds <- predict(rand_model_full,test_data2)
table(rand_preds)
prop.table(table(rand_preds))
submit_rand1 <- data.frame(Loan_ID=test_data$Loan_ID,Loan_Status=rand_preds)
write.csv(submit_rand1,"new_submit1",row.names = FALSE)

set.seed(1234)
rand_model_few<- randomForest(Loan_Status~Installment_Income_Ratio+Married+Property_Area +Credit_History ,data=train_data2,mtry=2,ntree=500,importance=TRUE)
varImpPlot(rand_model_few)
rand_preds2 <- predict(rand_model_few,test_data2)
table(rand_preds2)
prop.table(table(rand_preds2))
submit_rand2 <- data.frame(Loan_ID=test_data$Loan_ID,Loan_Status=rand_preds2)
write.csv(submit_rand2,"new_submit2",row.names = FALSE)

#tree Model
library(rpart)
library(rpart.plot)

set.seed(1234)
tree_model <- rpart(Loan_Status~.,data=train_data2,method="class",parms = list(loss=matrix(c(0,5,1,0),ncol=2)),control = rpart.control(cp=0.001))
rpart.plot(tree_model)
printcp(tree_model)
plotcp(tree_model)

#Prune Tree

index <- which.min(tree_model$cp[,"xerror"])
min_cp <- tree_model$cptable[index,"CP"]

tree_model_pruned <- prune(tree_model,min_cp)
prp(tree_model_pruned,extra = 1)

tree_preds <- predict(tree_model_pruned,newdata = test_data2,type = "class")
table(tree_preds)
prop.table(table(tree_preds))

submit_tree <- data.frame(Loan_ID=test_data$Loan_ID,Loan_Status=tree_preds)
write.csv(submit_tree,"new_tree_submit3",row.names = FALSE)

#Stepwise_regression
steps_log <- step(glm(Loan_Status~.,data=train_data2,family = binomial(link = "logit")),direction = "backward")

log_pred <- predict(steps_log,newdata = test_data2,type = "response")
log_class <- ifelse(log_pred>0.5,"Y","N")
table(log_class)
prop.table(table(log_class))

submit_logs <- data.frame(Loan_ID=test_data$Loan_ID,Loan_Status=log_class)

write.csv(submit_logs,"new_log_submit4",row.names = FALSE)

table(rand_preds)
table(rand_preds2)
table(tree_preds)
table(log_class)

prop.table(table(rand_preds))
prop.table(table(rand_preds2))
prop.table(table(tree_preds))
prop.table(table(log_class))

comparison <- data.frame(full_rand=rand_preds,rand_few=rand_preds2,tree_preds=tree_preds,log_preds=log_class)
View(comparison)