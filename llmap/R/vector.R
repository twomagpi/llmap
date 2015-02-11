#' Generic path attributes
#' 
#' Supply, in the correct form, the attributes needed for the generic path class
#' @param stroke Boolean Whether to draw stroke along the path. Set it to false to disable borders on polygons or circles.
#' @param color String Stroke color.
#' @param weight Stroke width in pixels.
#' @param opacity Stroke opacity.
#' @param fill 	Boolean	Whether to fill the path with color. Set it to false to disable filling on polygons or circles.
#' @param fillColor Fill color.
#' @param fillOpacity 	Number 	0.2 	Fill opacity.
#' @param dashArray 	String 	null 	A string that defines the stroke dash pattern. Doesn't work on canvas-powered layers (e.g. Android 2).
#' @param clickable 	Boolean 	true 	If false, the vector will not emit mouse events and will act as a part of the underlying map.
#' @param pointerEvents 	String 	null 	Sets the pointer-events attribute on the path if SVG backend is used.
llmapPath <- function(stroke=TRUE, colour="#03f", weight=5, opacity=0.5, fill=TRUE, fillOpacity=0.2, dashArray=NA, clickable=TRUE, pointerEvents=NA){
	listToJavascript(list(
			stroke = javascriptBoolean(stroke),
			color = javascriptText(colour),
			weight = weight,
			opacity = opacity,
			fill = javascriptBoolean(fill),  
			fillOpacity = fillOpacity, 
			dashArray = collapseIfNotNA(dashArray),  
			clickable = javascriptBoolean(clickable), 
			PointerEvents = pointerEvents
	))
}


#' Add a circle to a map
#' 
#' Draws a circle on a map
#' @param stroke Boolean Whether to draw stroke along the path. Set it to false to disable borders.
#' @param color String Stroke color.
#' @param weight Stroke width in pixels.
#' @param opacity Stroke opacity.
#' @param fill 	Boolean	Whether to fill the path with color. Set it to false to disable filling on polygons or circles.
#' @param fillColor Fill color.
#' @param fillOpacity 	Number 	0.2 	Fill opacity.
#' @param dashArray 	String 	null 	A string that defines the stroke dash pattern. Doesn't work on canvas-powered layers (e.g. Android 2).
#' @param clickable 	Boolean 	true 	If false, the vector will not emit mouse events and will act as a part of the underlying map.
#' @param pointerEvents 	String 	null 	Sets the pointer-events attribute on the path if SVG backend is used.
#' @examples
#' llmapCircle(51.508, -0.11, 500)
llmapCircle <- function(x, y, radius, stroke=TRUE, colour="#03f", weight=5, opacity=0.5, fill=TRUE, fillOpacity=0.2, dashArray=NA, clickable=TRUE, pointerEvents=NA){
	script <- "L.circle([%x%, %y%], %radius%, %path%).addTo(map);"
	script <- gsub("%x%", x, script)
	script <- gsub("%y%", y, script)
	script <- gsub("%radius%", radius, script)
	script <- gsub("%path%", llmapPath(stroke, colour, weight, opacity, fill, fillOpacity, dashArray, clickable, pointerEvents), script)
	result <- structure(list(
					style = c(),
					head = c(),
					body = c(),
					script = script
					), class = c("llmap", "llmapVectorLayer")
	)
	return(result)
}
