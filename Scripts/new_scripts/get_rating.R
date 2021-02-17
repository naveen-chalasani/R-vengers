#' This function returns the IMDB rating of Movies and TV shows based on search word(s) by user.
#'
#' @param search_text search text i.e., word(s) to look for in the Title.
#' @param type expected type of the result can be - movie, series, episode, game
#'
#' @return A dataframe that contains the list of search results.
#'     Dataframe contains Title, Type, Year, and IMDB Rating.
#' @export
#'
#' @examples 
#' get_rating('Guardians')
#' get_rating('Guardians Galaxy', type = 'movie')

get_rating <- function(search_text, type = ""){

    # setup URL and API parameters   
    base_search_url <- "http://www.omdbapi.com/?s="
    id_search_url <- "http://www.omdbapi.com/?i="
    type = paste0("type=",type)
    apikey <- "apikey=a79b2c95"
    search <- gsub(" ", "+", search_text)

    # query the API using GET request, and parse the http response as JSON
    search_url <- paste0(base_search_url, paste(search, type, apikey, sep = '&'))
    result <- httr::GET(url = search_url)
    result_httr <- httr::content(result, as = "text")
    result_json <- jsonlite::fromJSON(result_httr)
    
    # setup vectors for output dataframe
    title <- NA
    type <- NA
    year <- NA
    rating <- NA

    # loop through each search result from JSON to get necessary details like rating
    imdb_id_details <- NA    
    for (i in 1:length(result_json$Search$imdbID)){
        imdb_id = result_json$Search$imdbID[i]

        id_url <- paste0(id_search_url, paste(imdb_id, apikey, sep = '&'))
        movie <- httr::GET(url = id_url)
        movie_httr <- httr::content(movie, as = "text")
        movie_json <- jsonlite::fromJSON(movie_httr)
        if (movie_json$Response == 'True'){
            imdb_id_details <- movie_json
            title[i] <- imdb_id_details$Title
            type[i] <- imdb_id_details$Type
            year[i] <- imdb_id_details$Year
            rating[i] <- imdb_id_details$imdbRating
        } else {
            print(movie_json$Error)
        }
    }
    
    # create output dataframe with necessary columns from search results
    output <- NA
    output = data.frame(title, type, suppressWarnings(as.numeric(year)), suppressWarnings(as.numeric(rating)))
    names(output)[1] <- "Title"
    names(output)[2] <- "Type"
    names(output)[3] <- "Year"
    names(output)[4] <- "IMDB Rating"
    return (output)
}
