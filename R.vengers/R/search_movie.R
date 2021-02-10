#' A Movie Select Function
#'
#' This function allows you to select the movie by choosing the corresponding number.
#' @param A list of searching results
#' @param A number the user chooses
#' @return A list of results of a specific movie
#' @export
#' select_movie()

select_movie <- function(js_lst, id_num){
  
  id_search_url <- "http://www.omdbapi.com/?i="
  apikey <- 'apikey=45abab5f'
  
  id <- js_lst$Search$imdbID[id_num]
  id_url <- paste0(id_search_url, paste(id, apikey, sep = '&'))
  movie <- httr::GET(url = id_url)
  movie_httr <- httr::content(movie, as = "text")
  movie_json <- fromJSON(movie_httr)
  return(movie_json)
}



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
  result_json <- fromJSON(result_httr)
  return(result_json)
}


#' A Movie Get Function
#'
#' This function allows you to get the movie info.
#' @param A string of an English word
#' @param A number the user chooses
#' @return A list of results of a specific movie
#' @export
#' get_movie()

get_movie <- function(key_word, id_num){
  
  search_out <- search_movie(key_word)
  movie_out <- select_movie(search_out, id_num)

  return(movie_out)
}



