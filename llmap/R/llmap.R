#' The base class for Rleaflet2
#' 
#' This contains the base class. The base class creates and maintains the basic
#' material to create a leaflet map page.
#' @param ... ignored
#' @author Thomas Finnie (Thomas.Finnie@@phe.gov.uk)
#' @export
llmap <- function(...) UseMethod("llmap")

#' Reports whether x is a ggplot object
#' @param x An object to test
#' @export
is.llmap <- function(x) inherits(x, "llmap")


#' Create a new ggplot plot from a data frame
#'
#' @param data default data frame for plot
#' @export
llmap.default <- function(...) {
	result <- structure(list(
				style = c(
					'#map { height: 180px; }'
				),
				head = c(
					'<link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet-0.7.3/leaflet.css" />',
					'<script src="http://cdn.leafletjs.com/leaflet-0.7.3/leaflet.js"></script>'
				),
				body = c(
					'<div id="map"></div>'
				),
				script = c(
					 'var map = L.map(\'map\').setView([51.505, -0.09], 13);'
			)), class = c("llmap", "llmapBase")
	)
	return(result)
}
