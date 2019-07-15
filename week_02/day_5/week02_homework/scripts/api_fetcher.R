api_fetcher <- function(url, api_key, message){
  # fetch from API, return response as list
  
  # need to pass api_key and data here
  params <- list(
      api_key = indico_api_key,
      data = message
  )
  
  response <- httr::POST(url, query = params)
  
  # stop and thow an error if the API call fails
  if (httr::http_error(response)){
    stop("API fetch failed.")
  }
  
  # return the httr::content() of the response
  return(httr::content(response))
  # i had response_list here
}