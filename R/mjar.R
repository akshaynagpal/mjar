library(rvest)
#'getTitles function
#'
#'This function scrapes the titles of the papers matching the search input of the user.
#'@param mjaSearch search URL.
#'@export
#'@examples
#'getTitles()

getTitles <- function(mjaSearch){
  titles <- mjaSearch %>%
    html_nodes("#block-system-main div ol li h3 a ")%>%
    html_text()
  return(titles)
}

#'getLinks function
#'
#'This function scrapes the URLs of the papers matching the search input of the user.
#'@param mjaSearch search URL.
#'@export
#'@examples
#'getLinks()

getLinks <- function(mjaSearch){
  links <- mjaSearch %>%
    html_nodes("#block-system-main div ol li h3 a ")%>%
    html_attr("href")
}

#'getAbstracts function
#'
#'This function scrapes the abstracts of the papers matching the search input of the user.
#'@param links vector returned by getLinks() function.
#'@export
#'@examples
#'getAbstracts()

getAbstracts <- function(links){
  abstracts <- character(length(links))
  for (i in 1:length(links)){
    abstract_items <- read_html(links[i])%>%
      html_nodes("div.abstract.field-items .p")%>%
      html_text()
    abstracts[i]<- paste(abstract_items,collapse = " | ")
  }
  return(abstracts)
}


#'search_MJA function
#'
#'This function will return the search result in the form of a matrix containing 3 columns - titles, links, abstracts of top 10 articles matching the user input.
#'@param userQuery search keywords given by the user.
#'@export
#'@examples
#'search_MJA()

search_MJA <-function(userQuery){
  userQueryForURL <- gsub(" ","+",userQuery)
  baseURL <- "https://www.mja.com.au/search/site/"
  articleType <- "?f[0]=im_field_article_type%3A5269"
  mjaSearch <- read_html(paste(baseURL,userQuery,articleType,sep = ""))
  title<-getTitles(mjaSearch)[1:10]
  link<- getLinks(mjaSearch)[1:10]
  abstract<-getAbstracts(links)

  searchResult<-cbind(title,link,abstract)
  return(searchResult)
}

