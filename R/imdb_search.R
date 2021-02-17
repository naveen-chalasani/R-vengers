#' This internal function returns the dataframe of movie.
#'
#' @param imdb_id search id
#'
#' @return A dataframe that contains the list of search results.
#'     Dataframe contains Title, Type, Year, and Director.
#'


imdb_search <- function(imdb_id){
  
  id_search_url <- "http://www.omdbapi.com/?i="
  apikey <- 'apikey=45abab5f'
  
  id_url <- paste0(id_search_url, paste(imdb_id, apikey, sep = '&'))
  movie <- httr::GET(url = id_url)
  movie_httr <- httr::content(movie, as = "text")
  movie_json <- jsonlite::fromJSON(movie_httr)
  if (movie_json$Response == 'True'){
    return(movie_json)
  } else {
    stop(paste0("Incorrect IMDb ID."))
   # print(movie_json$Error)
   # return (NULL)
  }   
}