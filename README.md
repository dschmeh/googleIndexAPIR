# googleIndexAPIR
Lighweight R Package to use the Google Indexing API
https://developers.google.com/search/apis/indexing-api/v3/quickstart

## Installation
```r
remotes::install_github("dschmeh/googleIndexAPIR", ref="main")
```

## Get your Credentials
Before using this API you have to activate the endpoint in the Google Cloud Console and get your Client Secret and ClientID

1. Navigate to the Google Cloud API Library: https://console.developers.google.com/apis/
2. Search for the "indexing API" and activate it
![image](https://github.com/dschmeh/googleIndexAPIR/assets/22255224/ee223f50-dd9b-45a6-9994-54914a152c2d)

3. Go to the Credentials page and there you’ll find your credentials. Click on Download JSON to get the credentials as a JSON File

## Login in your R Session
Now that you have the endpoint activated it´s time to use it in your R Session

1. Activate the Plugin 
```r
library(googleIndexAPIR)
```
2. Set the required Scopes
```r
scopes = c("https://www.googleapis.com/auth/indexing")
```
3. Set the Client here we need the Downloaded JSON File from above
```r
gar_set_client("PATH_TO_YOUR_FILE.apps.googleusercontent.com.json", scopes = scopes)

```
4. Authenticate and go through the OAuth2 flow first time
```r
gar_auth()

```

## Start Indexing your Pages

```r
index_url("https://my-page-in-the-index.com")

```
### Index a list of URLs

```r
url<- read_csv("your_csv_with_a_list_of_urls.csv")
output_df<-NULL;
for(i in 1:nrow(url)){
  df<-index_url(url$url[i])
  output_df<-rbind(df, output_df)
  print(i)
}

```
