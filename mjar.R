
getTitles <- function(mjaSearch){
  titles <- mjaSearch %>%
    html_nodes("#block-system-main div ol li h3 a ")%>%
    html_text()
  return(titles)
}


getLinks <- function(mjaSearch){
  links <- mjaSearch %>%
    html_nodes("#block-system-main div ol li h3 a ")%>%
    html_attr("href")
}


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




search_MJA <-function(userQuery){
  userQueryForURL <- gsub(" ","+",userQuery)
  baseURL <- "https://www.mja.com.au/search/site/"
  articleType <- "?f[0]=im_field_article_type%3A5269"
  mjaSearch <- read_html(paste(baseURL,userQuery,articleType,sep = ""))
  titles<-getTitles(mjaSearch)[1:10]
  links<- getLinks(mjaSearch)[1:10]
  abstracts<-getAbstracts(links)
  
  searchResult<-cbind(titles,links,abstracts)
  return(searchResult)
}

