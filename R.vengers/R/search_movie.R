#' A Movie Search Function
#'
#' This function allows you to search movie by using a key word.
#' @param A string of an English word
#' @return A list of search results
#' @export
#' search_movie()

search_movie <- function(keyWord){
  
  base_search_url <- "http://www.omdbapi.com/?s="
  apikey <- 'apikey=45abab5f'
  
  search_url <- paste0(base_search_url, paste(keyWord, apikey, sep = '&'))
  result <- httr::GET(url = search_url)
  result_httr <- httr::content(result, as = "text")
  result_json <- fromJSON(search_1_httr)
  
  result_json
}