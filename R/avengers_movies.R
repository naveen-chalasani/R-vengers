#' This function provides the list of all the Avengers movies to the user.
#' 
#' @return A dataframe that contains information of all the Avengers movies.
#'     Dataframe contains Title, Type, Year, Genre, Runtime (in minutes), Actors, Director, Awards, and IMDB Rating.
#' @export
#'
#' @examples 
#' avengers_movies()

avengers_movies <- function(){

    avengers_list <- c('tt0371746', 'tt0800080', 'tt1228705', 'tt0800369', 'tt0458339', 'tt0848228', 'tt1300854', 'tt1981115', 'tt1843866', 'tt2015381', 'tt2395427', 'tt0478970', 'tt3498820', 'tt1211837', 'tt3896198', 'tt2250912', 'tt3501632', 'tt1825683', 'tt4154756', 'tt5095030', 'tt4154664', 'tt4154796')

    # setup URL and API parameters   
    id_search_url <- "http://www.omdbapi.com/?i="
    apikey <- "apikey=a79b2c95"
    
    # setup vectors for output dataframe
    title <- NA
    type <- NA
    year <- NA
    genre <- NA
    runtime <- NA
    actors <- NA
    director <- NA
    awards <- NA
    rating <- NA

    # loop through each recommendation to get attributes like rating, runtime and awards
    imdb_id_details <- NA    
    for (i in 1:length(avengers_list)){
        imdb_id = avengers_list[i]

        id_url <- paste0(id_search_url, paste(imdb_id, apikey, sep = '&'))
        movie <- httr::GET(url = id_url)
        movie_httr <- httr::content(movie, as = "text")
        movie_json <- jsonlite::fromJSON(movie_httr)
        if (movie_json$Response == 'True'){
            imdb_id_details <- movie_json
            title[i] <- imdb_id_details$Title
            type[i] <- imdb_id_details$Type
            year[i] <- imdb_id_details$Year
            genre[i] <- imdb_id_details$Genre
            runtime[i] <- imdb_id_details$Runtime
            actors[i] <- imdb_id_details$Actors
            director[i] <- imdb_id_details$Director
            awards[i] <- imdb_id_details$Awards
            rating[i] <- imdb_id_details$imdbRating
        } else {
            print(movie_json$Error)
        }
    }
    
    # create output dataframe with necessary columns from search results
    output <- NA
    runtimes <- NA
    try(runtimes <- suppressWarnings(as.numeric(sapply(strsplit(runtime, " "), "[[", 1))), silent = TRUE)
    output = data.frame(title, type, suppressWarnings(as.numeric(year)), genre, runtimes, actors, director, awards, suppressWarnings(as.numeric(rating)))
    names(output)[1] <- "Title"
    names(output)[2] <- "Type"
    names(output)[3] <- "Year"
    names(output)[4] <- "Genre"
    names(output)[5] <- "Runtime (in minutes)"
    names(output)[6] <- "Actors"
    names(output)[7] <- "Director"
    names(output)[8] <- "Awards"
    names(output)[9] <- "IMDB Rating"  
    return (output)
}
