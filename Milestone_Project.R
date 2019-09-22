
library(knitr)
twitter <- readLines("en_US.twitter.txt",warn = FALSE, encoding = "UTF-8")
news <- readLines("en_US.news.txt",warn = FALSE, encoding = "UTF-8")
blogs <- readLines("en_US.blogs.txt",warn = FALSE, encoding = "UTF-8")

library(stringi)
wc_twitter <-stri_stats_latex(twitter)[4]
wc_news <-stri_stats_latex(news)[4]
wc_blogs <-stri_stats_latex(blogs)[4]

data.frame("Names" = c("twitter", "news", "blogs"),
           "line_count" = c(length(twitter), length(news), length(blogs)),
           "word_count" = c(sum(wc_twitter), sum(wc_news), sum(wc_blogs)),
           "character_count" = c(sum(nchar(twitter)),sum(nchar(news)), sum(nchar(blogs)))
)


set.seed(10000)
twitter_con<-iconv(twitter,"latin1","ASCII",sub="")
blogs_con<-iconv(blogs,"latin1","ASCII",sub="")
news_con<-iconv(news,"latin1","ASCII",sub="")

sampledata<-c(sample(twitter_con,length(twitter_con)*0.01),
              sample(blogs_con,length(blogs_con)*0.01),
               sample(news_con,length(news_con)*0.01))



library(tm)
library(NLP)
     
# Use volatile corpus to intepret sampledata to docs
docs <- VCorpus(VectorSource(sampledata))
# Use preprocessing functions to clean
toSpace <- content_transformer(function(x, pattern) gsub(pattern, " ", x))
docs <- tm_map(docs, toSpace, "(f|ht)tp(s?)://(.*)[.][a-z]+")
docs <- tm_map(docs, toSpace, "@[^\\s]+")
docs <- tm_map(docs, tolower)
docs <- tm_map(docs, removeWords, stopwords("en"))
docs <- tm_map(docs, removePunctuation)
docs <- tm_map(docs, removeNumbers)
docs <- tm_map(docs, stripWhitespace)
docs <- tm_map(docs, PlainTextDocument)


# Load libraries
library(RWeka)
library(ggplot2)

# Create Ngram tokenizer for unigram
unigram <-function(x) NGramTokenizer(x,Weka_control(min=1,max=1))

# Create tdm from docs for unigram
tdm_unigram <-TermDocumentMatrix(docs,control=list(tokenize=unigram))

# Find frequent terms in tdm_unigram for a lower frequency bound of 1000
freq_unigram <-findFreqTerms(tdm_unigram,lowfreq=1000)

# Convert tdm_unigram to a matrix and get the sum of the row using freq_unigram
rs_unigram <-rowSums(as.matrix(tdm_unigram[freq_unigram,]))

# Put rs_unigram in a data frame
df_unigram <-data.frame(Word=names(rs_unigram),freq=rs_unigram)

# Sort the df_unigram by frequency
st_unigram <-df_unigram[order(-df_unigram$freq),]

saveRDS(df_unigram, "unigram.RData")
# Examine df_unigram
head(df_unigram)

# Create Ngram tokenizer for bigram
bigram <-function(x) NGramTokenizer(x,Weka_control(min=2,max=2))

# Create tdm from docs for bigram
tdm_bigram <-TermDocumentMatrix(docs,control=list(tokenize=bigram))

# Find frequent terms in tdm_bigram for a lower frequency bound of 80
freq_bigram <-findFreqTerms(tdm_bigram,lowfreq=80)

# Convert tdm_bigram to a matrix and get the sum of the row using freq_bigram
rs_bigram <-rowSums(as.matrix(tdm_bigram[freq_bigram,]))

# Put rs_bigram in a data frame
df_bigram <-data.frame(Word=names(rs_bigram),freq=rs_bigram)

# Sort the df_bigram by frequency
st_bigram <-df_bigram[order(-df_bigram$freq),]

saveRDS(df_bigram, "bigram.RData")
# Examine df_bigram
head(df_bigram)





# Create Ngram tokenizer for trigram
trigram <-function(x) NGramTokenizer(x,Weka_control(min=3,max=3))

# Create tdm from docs for trigram
tdm_trigram <-TermDocumentMatrix(docs,control=list(tokenize=trigram))

# Find frequent terms in tdm_trigram for a lower frequency bound of 10
freq_trigram <-findFreqTerms(tdm_trigram,lowfreq=10)

# Convert tdm_trigram to a matrix and get the sum of the row using freq_trigram
rs_trigram <-rowSums(as.matrix(tdm_trigram[freq_trigram,]))

# Put rs_trigram in a data frame
df_trigram <-data.frame(Word=names(rs_trigram),freq=rs_trigram)

# Sort the df_trigram by frequency
st_trigram <-df_trigram[order(-df_trigram$freq),]

saveRDS(df_trigram, "trigram.RData")
# Examine df_trigram
head(df_trigram)



# Create Ngram tokenizer for trigram
quadgram <-function(x) NGramTokenizer(x,Weka_control(min=4,max=4))

# Create tdm from docs for trigram
tdm_quadgram <-TermDocumentMatrix(docs,control=list(tokenize=quadgram))

# Find frequent terms in tdm_trigram for a lower frequency bound of 10
freq_quadgram <-findFreqTerms(tdm_quadgram,lowfreq=1000)

# Convert tdm_trigram to a matrix and get the sum of the row using freq_trigram
rs_quadgram <-rowSums(as.matrix(tdm_quadgram[freq_quadgram,]))

# Put rs_trigram in a data frame
df_quadgram <-data.frame(Word=names(rs_quadgram),freq=rs_quadgram)

# Sort the df_trigram by frequency
st_quadgram <-df_quadgram[order(-df_quadgram$freq),]

saveRDS(df_quadgram, "quadgram.RData")
# Examine df_trigram
head(df_quadgram)

