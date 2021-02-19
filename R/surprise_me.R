#' This function provides surprise recommendations of movies and TV shows to the user.
#'
#' @param genre Genre of recommendations can be - action, adventure, comedy, romance, drama, scifi, horror, animation
#'     When there is no input genre from user, a random recommendation from each of the genres is given.
#' 
#' @return A dataframe that contains the list of search results.
#'     Dataframe contains Title, Type, Year, Genre, Runtime (in minutes), Actors, Director, Awards, and IMDB Rating.
#' @export
#'
#' @examples 
#' surprise_me()
#' surprise_me(genre = 'adventure')

surprise_me <- function(genre = 'all'){

    # Top 10 most popular IMDB titles by genre
    action <- c('tt9140560', 'tt2560140', 'tt8179402', 'tt2306299', 'tt2531336', 'tt10332588', 'tt7221388', 'tt8111088', 'tt0944947', 'tt6156584')    
    adventure <- c('tt2560140', 'tt8179402', 'tt2306299', 'tt10332588', 'tt8111088', 'tt0944947', 'tt9845564', 'tt1831804', 'tt2948372', 'tt0293429')
    comedy <- c('tt9140560', 'tt4477976', 'tt10332588', 'tt7221388', 'tt9140342', 'tt8690918', 'tt0386676', 'tt3526078', 'tt2948372', 'tt1586680')
    romance <- c('tt9012876', 'tt8740790', 'tt12676326', 'tt2306299', 'tt10333426', 'tt3006802', 'tt0413573', 'tt1442437', 'tt5420376', 'tt5555260')
    drama <- c('tt9140560', 'tt3661210', 'tt10016180', 'tt2560140', 'tt8740790', 'tt9012876', 'tt8179402', 'tt6857376', 'tt3230854', 'tt2306299')
    scifi <- c('tt9140560', 'tt3230854', 'tt8111088', 'tt6156584', 'tt5034838', 'tt8690918', 'tt1831804', 'tt10333426', 'tt6723592', 'tt1190634')
    horror <- c('tt2560140', 'tt1831804', 'tt1520211', 'tt0460681', 'tt4574334', 'tt12664876', 'tt1844624', 'tt1405406', 'tt7557108', 'tt8068860')
    animation <- c('tt2560140', 'tt2948372', 'tt0458290', 'tt0096697', 'tt5363918', 'tt5109280', 'tt2861424', 'tt0182576', 'tt9335498', 'tt0121955')

    # get 5 random recommendations from most popular top10 based on user input of genre
    # if no user input, a random recommendation from each of the genres is given
    recommendations <- NA
    if (genre == 'action') {
        recommendations <- sample(action, 5)
        } else if (genre == 'adventure') {
        recommendations <- sample(adventure, 5)
        } else if ( genre == 'comedy') {
        recommendations <- sample(comedy, 5)
        } else if ( genre == 'romance') {
        recommendations <- sample(romance, 5)
        } else if ( genre == 'drama') {
        recommendations <- sample(drama, 5)
        } else if ( genre == 'scifi') {
        recommendations <- sample(scifi, 5)
        } else if ( genre == 'horror') {
        recommendations <- sample(horror, 5)
        } else if ( genre == 'animation'){
        recommendations <- sample(animation, 5)
        } else if (genre == 'all') {
        recommendations <- recommendations <- c(sample(action[1:5], 1), sample(adventure[1:5], 1), sample(comedy[1:5], 1), sample(romance[1:5], 1), sample(drama[1:5], 1), sample(scifi[1:5], 1), sample(horror[1:5], 1), sample(animation[1:5], 1))
        } else {
            stop(paste0("Please choose a valid genre."))
        }

    # setup URL and API parameters   
    base_search_url <- "http://www.omdbapi.com/?s="
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
    for (i in 1:length(recommendations)){
        imdb_id = recommendations[i]

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
