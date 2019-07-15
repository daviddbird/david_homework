response_unpacker <- function(response_list){
  # convert an emotion response list into a named vector
  
  # stop and throw error if response_list is NULL,
  # or response_length is length 0,
  # or response_list$results has length 0
  if (length(response_list$results) == 0 | 
      is.null(response_list) | length(response_list) == 0){
    stop("response_unpacker: empty response list")
  }

  # setup an empty named vector to return
  emotions <- c("anger", "fear", "joy", "sadness", "surprise")
  # set all 5 elements to NA initially
  return_vec <- rep(NA, times = 5)
  # set names of return_vec using the emotions strings
  names(return_vec) <- emotions
  
  # loop through emotions
  for (emotion in emotions) {
    # get the emotion value for this emotion from the response_list
    emotion_value <- response_list$results[[emotion]]
    # check that the emotion_value is not NULL.
    # If not, use it to set the appropriate element of return_vec
    if (!is.null(emotion_value)) {
     return_vec[emotion] <- emotion_value
    }
  }
  
  # return return_vec
  return(return_vec)

}  