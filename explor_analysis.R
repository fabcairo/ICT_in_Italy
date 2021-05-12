##########################  EXPLORATORY ANALYSIS  ##############################
library(ggplot2)
library(dplyr)
library(ggpubr)
library(stringr)
library(corrplot)
library(proxy)
library(igraph)
library(jtools)
library(kableExtra)

theme_set(theme_pubr())

df <- DF_ICT_A2018

### === FEATURE STUDY === ###
str(df[,1:25])
str(df[,26:50])
str(df[,51:75])
str(df[,76:100])
str(df[,101:125])
str(df[,126:150])
str(df[,151:175])
str(df[,176:200])
str(df[,201:ncol(df)])

update_lab_type <- function(){
  lab_type <<- rep("", ncol(df))
  lab_levels <<- rep("", ncol(df))
  bool.factor <<- sapply(df, is.factor)
  bool.numeric <<- !bool.factor & sapply(df, is.numeric)
  bool.binary.yn <<- sapply(df, function(x) (is.factor(x) && identical(levels(x), c("no", "si"))))
  
  lab_type[bool.factor] <<- "Categorical"
  lab_type[bool.numeric] <<- "Quantitative"
  lab_levels[bool.factor] <<- sapply(df[,bool.factor], function(x){ length(levels(x))})
  
  which.factor <<- names(bool.factor[bool.factor == TRUE])
  which.numeric <<- names(bool.numeric[bool.numeric == TRUE])
  which.binary.yn <<- names(bool.binary.yn[bool.binary.yn == TRUE])
}

update_lab_type()

# Create variable table
varlab_df <- data.frame("Code" =names(varlab), "Type" =lab_type,
                        "Levels" = lab_levels, "Descripion" = unname(varlab))
varlab_df %>%
  kbl() %>%
  kable_styling(bootstrap_options = c("striped", "condensed"))


## == DROP IDENTIFIERS AND IRRELEVANT VARIABLES == ##
df <- df %>%
  select(!c("codice_", "coeffin"))


## == Numeric features == ##
varlab[which.numeric]
cor_numeric <- cor(df[,which.numeric], use="pairwise.complete.obs")
corrplot(cor_numeric)
# I3a and I3b are perfectly negatively correlated! Let's drop I3b
# I4a and I4b are perfectly negatively correlated! Let's drop I4b
df <- df %>%
  select(!c("I3b", "I4b", "A3_"))
update_lab_type()

cor_numeric <- cor(df[,which.numeric], use="pairwise.complete.obs")


## == NAs study == ##
na_threshold <- 0.05
sumna <- function(x){ sum(is.na(x)) }
percna <- function(x) { 
  if(is.vector(x) || is.factor(x)) {
    return(sumna(x)/length(x))
  } else if(is.data.frame(x) || is.matrix(x)) {
    return(sumna(x)/prod(dim(x)))
  }
}

# = Column NAs = #
colna <- apply(df, 2, sumna) # NAs in each column
perccolna <- apply(df, 2, percna) # percentage of NAs in each column
highNAcol <- perccolna[perccolna >= na_threshold]
print(names(highNAcol))
varlab[names(highNAcol)]
#View(data.frame("valore" = highNAcol, "label"=unname(varlab[names(highNAcol)])))
df <- df[, perccolna < na_threshold]

# = Row NAs = #
rowna <- apply(df, 1, sumna) # NAs in each row
percrowna <- apply(df, 1, percna) # percentage of NAs in each row
sum(percrowna > 0)
#df <- df[percrowna < na_threshold,]
df <- df[complete.cases(df),]


### === CATEGORICAL FEATURES === #

## == Constant columns == ##
# Which columns have constant values? 
names(which(apply(df, 2, function(x) all(duplicated(x[!is.na(x)])[-1L]))))
df <- df %>%
  select(!c("C1", "C3"))

## == Similarity analysis == ##
get_similar_cols <- function(threshold=0.99) {
  update_lab_type()
  n <- length(which.binary.yn)
  out1 <- matrix(NA, nrow=n, ncol=n, dimnames=list(which.binary.yn, which.binary.yn))
  out2 <- list()
  ii <- 1
  for(i in seq(1,length(which.binary.yn)-1)) {
    for(j in seq(i, length(which.binary.yn))) {
      if( all(levels(df[,which.binary.yn[i]]) == levels(df[,which.binary.yn[j]])) ) {
        # Sokal-Michener index (simple matching)
        out1[i,j] <- out1[j,i] <- sum(df[,which.binary.yn[i]] == df[,which.binary.yn[j]]) / nrow(df)
        if((i != j) && out1[i,j] > threshold) {
          out2[[ii]] <- c(which.binary.yn[i], which.binary.yn[j])
          ii <- ii+1
        }
      }
    }
  }
  return(list("similarity_matrix"=out1, "similar_cols"=out2))
}

#similar_cols <- get_similar_cols(0.5)
similar_cols <- get_similar_cols(0.99)
similar_cols$similar_cols

# The following columns are pairwise similar (>0.99).
# Drop the repetitions:
pairwise_similar_drop <- c("C12a5", "C12b1", "C12b2", "C12b3", "C12b4", "C12b5", "C12c5", "C12d5", "C12e5", "C12f5", "C12g5", "C12h5")
df <- df %>%
  select(-pairwise_similar_drop)

similar_cols <- get_similar_cols()
similar_cols$similar_cols

# Similarity with the target
update_lab_type()
D1_similar <- matrix(0, nrow=length(which.binary.yn), ncol=length(which.binary.yn), dimnames=list(which.binary.yn, which.binary.yn))
D1_similar["D1",] <- similar_cols$similarity_matrix["D1",]
D1_similar[,"D1"] <- similar_cols$similarity_matrix[,"D1"]
D1_similar <- na.omit(D1_similar)

net <- graph.adjacency(D1_similar,mode="undirected",weighted=TRUE,diag=FALSE)
E(net)$edge.color <- "#e63900"
E(net)$edge.color[E(net)$weight < 0.8] <- "#ff8533"
E(net)$edge.color[E(net)$weight < 0.7] <- "#ffe6e6"
E(net)$edge.color[E(net)$weight < 0.5] <- "#e6e6e6"
E(net)$width <- E(net)$weight*5
V(net)$label.cex=0.5
plot.igraph(net, vertex.label=V(net)$name, layout=layout_as_star(net,center = "D1"),
            vertex.shape="none", edge.color=E(net)$edge.color)
mtext(side=3, line=3, at=-0.55, adj=0, cex=1.4, "Similarity graph")
mtext(side=3, line=2, at=-0.55, adj=0, cex=0.7, "Sokal-Michener index")
legend("topleft", c("[0, 0.5)","[0.5, 0.7)", "[0.7, 0.8)", "[0.8, 1]"), bty = "n",
       lwd = c(2,2,5,5), cex = 0.8, col = c("#e6e6e6", "#ffe6e6", "#ff8533", "#e63900"),
       lty = 1, pch = NA, title="Similarity range")

table(df$B1, df$D1, dnn=list("B1", "D1"))
table(df$B2a, df$D1, dnn=list("B1", "D1"))
table(df$B3, df$D1, dnn=list("B1", "D1"))


# Drop selected columns similar to the target (cloud computing investments)
target_similar_drop <- c("J1e1", "J1e2", "J1e3", "J2e1", "J2e2", "J2e3")
# View(data.frame(varlab[target_similar_drop]))
df <- df %>%
  select(-target_similar_drop)
update_lab_type()

### === Target barplot === ###
D1_tab <- table(df$D1, dnn=c("class")) # for NAs insert argument: useNA = "always"
D1_df <- data.frame(D1_tab)

ggplot(D1_df, aes(x=class, y=Freq)) +
  geom_bar(fill = "#0073C2FF", stat = "identity") +
  geom_text(aes(label = Freq), vjust = -0.3) + 
  theme_pubclean() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  labs(title = varlab["D1"])

### === Revenues Histogram === ###
ricavi_tab <- table(df$ricavi_cl, dnn=c("class")) # for NAs insert argument: useNA = "always"
nastring <- str_wrap("missing per esigenze di anonimizzazione", width=25)
ricavi_df <- data.frame(ricavi_tab)

ggplot(ricavi_df, aes(x=class, y=Freq)) +
  geom_bar(fill = "orange", stat = "identity") +
  geom_text(aes(label = Freq), vjust = -0.3) + 
  theme_pubclean() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) + 
  labs(title = varlab["ricavi_cl"]) + 
  xlab("Class (€)")

# Just one element for ricavi_cl class "[20k, 50k)": drop it
df <- df %>%
  filter(ricavi_cl != "[20k, 50k)")
df$ricavi_cl <- droplevels(df$ricavi_cl)
update_lab_type()


### Geographic histrogram ###
rip_tab <- table(df$rip, dnn=c("class")) # for NAs insert argument: useNA = "always"
rip_df <- data.frame(rip_tab)

ggplot(rip_df, aes(x=class, y=Freq)) +
  geom_bar(fill = "darkgreen", stat = "identity") +
  geom_text(aes(label = Freq), vjust = -0.3) + 
  theme_pubclean() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  labs(title = varlab["rip"]) + 
  xlab("Location")
