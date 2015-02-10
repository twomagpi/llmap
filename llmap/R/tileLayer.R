#' Add a tile layer to a map
#' 
#' Add a tile layer to a plot
#' @param urlTemplate The url template for the tile server
#' @author Thomas Finnie (Thomas.Finnie@@phe.gov.uk)
#' @export
tileLayer <- function(urlTemplate){
	result <- structure(list(
					style = c(),
					head = c(),
					body = c(),
					script = c('L.tileLayer(\'https://{s}.tiles.mapbox.com/v4/twomagpi.l6a9obo9/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoidHdvbWFncGkiLCJhIjoidTZOeVY3QSJ9.rKKjDjPUISMUb5xGQjhf9A\').addTo(map);'
					)), class = c("llmap", "llmapBase")
	)
	return(result)
}