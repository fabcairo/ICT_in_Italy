##########################  CLASSIFICATION  ##############################
library(ROCit)
library(ggstance)
library(kableExtra)

### === TRAINING/VALIDATION/TEST SET SPLIT === ###
set.seed(130497)

train_perc <- 0.55
val_perc <- 0.25
test_perc <- 0.20
train_size <- floor(train_perc * nrow(df))
val_size <- floor(val_perc * nrow(df))
test_size <- floor(test_perc * nrow(df))
train <- sort(sample(seq_len(nrow(df)), size=train_size))
ntrain <- setdiff(seq_len(nrow(df)), train)
val <- sort(sample(ntrain, size=val_size))
test <- setdiff(ntrain, val)



### === LOGISTIC MODEL === ###
logm <- glm(formula = D1 ~ ., data=df[train,], family=binomial())
probs <- predict(logm, newdata=df, type="response")
true <- df$D1

scores <- list()
i <- 1
for(set in list(train, val, test)){
  scores[[i]] <- measureit(score=probs[set], 
                           class=true[set],
                           measure=c("ACC", "SENS", "SPEC"))
  # Youden Index
  scores[[i]]$YOUD <- scores[[i]]$SPEC + scores[[i]]$SENS - 1
  i <- i+1
}

# 1 = train
# 2 = val
# 3 = test

## == ESTIMATED COEFFICIENTS == ##
dfm <- generics::tidy(logm)
colnames(dfm)[1] <- "variable"

conf_level <- 0.05

dfm_signif <- dfm[dfm$p.value < conf_level,]
print(dfm_signif, n=1e5)
dfm_signif %>%
  kbl(format="latex") %>%
  kable_classic_2(full_width = F) %>%
  column_spec(2, color = ifelse(dfm_signif$estimate > 0, "#005ce6", "#cc2900"))

dfm_n_signif <- dfm[dfm$p.value >= conf_level, ]
print(dfm_n_signif, n=1e5)

hist(probs[train], main = "Histogram of pred. probabilities (training)",
     xlab="Predicted probability", col="lightblue")

#plot_coefs(dfm_signif)


## == HYPERPARAMETER TUNING (Threshold Selection) == ##

# Optimal Youden Index
OYI_val <- max(scores[[2]]$YOUD)
OYIpos_val <- which.max(scores[[2]]$YOUD)
OYIthreshold <- scores[[2]]$Cutoff[OYIpos_val]
print(c("OYI"=OYI_val, "Optimal threshold"=OYIthreshold))
# = ROC curve = #
plot(rocit(score=probs[val], class=true[val], negref="no"))
title("ROC Curve - validation set")

preds <- rep("no", length(probs))
preds[probs > OYIthreshold] <- "si"

## == SCORES == ##
# = Test set = #
pos_test <- which.min(abs(scores[[3]]$Cutoff-OYIthreshold))
# ACCURACY
scores[[3]]$ACC[pos_test]
# SENSITIVITY
scores[[3]]$SENS[pos_test]
# SPECIFICITY
scores[[3]]$SPEC[pos_test]

table(na.omit(df[test,"D1"]), preds[test],  dnn=c("true", "predicted"))
View(data.frame(probs[test], true[test]))





