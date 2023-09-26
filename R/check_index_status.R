#' Function check the URL Index Status via the Index Metadata Endpoint
#'
#' This function allows check the status of a given URL via the Index API Metadata Endpoint
#' @param url URL you want to check
#' check_index_status()
#' @examples
#' \dontrun{
#' check_index_status("https://my-page-in-the-index.com")
#' }

check_index_status <- function(url){


  f <- gar_api_generator(paste0("https://indexing.googleapis.com/v3/urlNotifications/metadata?url=",URLencode(url, TRUE, TRUE)),
                         "GET",
                         checkTrailingSlash = FALSE)
  res<-f()
  return(as.data.frame(res$content$latestUpdate))
}
