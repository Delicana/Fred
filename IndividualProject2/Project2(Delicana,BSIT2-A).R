#Set-up a credentials by generating the tokens and keys from the created app. It need to have an elevated access.
CONSUMER_SECRET <- "Vjel0LhIfHnfdrIW8QEWFzpEPOY7qMF6sj42h45Q1XRztA59QD"
CONSUMER_KEY <- "5vQolTVpLkR72mgAJsObypd7O"
ACCESS_SECRET <- "Vjel0LhIfHnfdrIW8QEWFzpEPOY7qMF6sj42h45Q1XRztA59QD"
ACCESS_TOKEN <- "AAAAAAAAAAAAAAAAAAAAABwCjwEAAAAAQfvWT49egbSWWezPRVXkzJmUASc%3DhXMsIEGBzOy7f0rb2wH9f9iHWEgsTAR9GFGH0U7Ea1iQkxNlsz"

#Connect into twitter app
setup_twitter_oauth(consumer_key = CONSUMER_KEY,
                    consumer_secret = CONSUMER_SECRET,
                    access_token = ACCESS_TOKEN,
                    access_secret = ACCESS_SECRET)

#Extract 10,000 tweets exclude retweets #ChrisPratt
searchTwitter(searchString, n=10000, lang=NULL, since=NULL,
              until=NULL, locale=NULL, geocode=NULL, sinceID=NULL,
              maxID=NULL, resultType=NULL, retryOnRateLimit=120)

searchTwit <- searchTwitter("#Mars -filter:retweets",
                            n=10000,
                            lang="en",
                            since="11-25-2022",
                            until="11-30-2022",
                            retryOnRateLimit=120)

#Making code through internet
auth_setup_default()
tweet <- tweeting("#ChrisPratt", n=10000, include_rts=FALSE)
tweet

summary(tweet)

#Plot the graph with legends
data("longley")
barplot(GNP ~ Celebrities, data = longley)

#Make a wordcloud
word_cloud <- read_excel("C:\Users\CarlF\Desktop\ISAT U Outputs\2nd Year\1st Sem\CS 101\Final(s)\Project1(WordCloud).xlsx")
View(word_cloud)
attach(word_cloud)
labels(word_cloud)
wordcloud(words = words, freq = frequency, colors = brewer.pal(8,"Dark3"))
