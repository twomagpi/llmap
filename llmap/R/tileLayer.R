#' Add a tile layer to a map
#' 
#' Add a tile layer to a plot
#' @param urlTemplate The url template for the tile server
#' @author Thomas Finnie (Thomas.Finnie@@phe.gov.uk)
#' @export
llmapTileLayer <- function(urlTemplate){
	result <- structure(list(
					style = c(),
					head = c(),
					body = c(),
					script = c(gsub('%url%', urlTemplate, 'L.tileLayer(\'%url%\').addTo(map);')
					)), class = c("llmap", "llmapTileLayer")
	)
	return(result)
}

#' Add a mapbox tile layer to a map
#'
#' @param mapID your mapbox map mapID
#' @param accessToken your mapbox access token
#' @examples 
#'  accessToken <- "pk.eyJ1IjoidHdvbWFncGkiLCJhIjoidTZOeVY3QSJ9.rKKjDjPUISMUb5xGQjhf9A"
#'  mapID <- "twomagpi.l6a9obo9"
#'  mapboxTileLayer(mapID, accessToken)
#' @export
llmapMapboxTileLayer <- function(mapID, accessToken){
	baseURL <- "https://{s}.tiles.mapbox.com/v4/%mapid%/{z}/{x}/{y}.png?access_token=%token%"
	#replace the placeholders
	baseURL <- gsub("%mapid%", mapID, baseURL)
	baseURL <- gsub("%token%", accessToken, baseURL)
	return(llmapTileLayer(baseURL))
}
