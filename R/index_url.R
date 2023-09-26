#' Function to send an URL to the Google Index
#'
#' This function allows you to send a given URL to the Google Index
#' @param url URL you want to Index
#' index_url()
#' @examples
#' \dontrun{
#' index_url("https://my-page-in-the-index.com")
#' }

 index_url <- function(url){

body = list(
  url = url,
  type="URL_UPDATED"
)

f <- gar_api_generator("https://indexing.googleapis.com/v3/urlNotifications:publish",
                       "POST")

res<-f(the_body = body)
return(as.data.frame(res$content$urlNotificationMetadata))
}
