#' Return a string containing the skeleton html file
htmlPrintTemplate <- function(){
"
<html>
			<head>
			<style>%style%</style>
			%head%
			</head>
			<body>
			%body%
			<script>
			%script%
	L.tileLayer('https://{s}.tiles.mapbox.com/v4/twomagpi.l6a9obo9/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoidHdvbWFncGkiLCJhIjoidTZOeVY3QSJ9.rKKjDjPUISMUb5xGQjhf9A').addTo(map);

			</script>
			</body>
			</html>
"
}

#' Plot a llmap object
#' 
#' Plots a llmap object as html. By default this is written
#' to a temp file and displayed in the browser.
#' @param file If supplied the map will be written to this file instead of opening in a browser
#' @export
plot.llmap <- function(x, file=NA, ...){
	#create a temp file to write the llmap html to
	tempFile <- tempfile()
	
	#read the template
	template <- htmlPrintTemplate()
	
	#fill the blanks
	#style
	template <- gsub("%style%", paste(x$style, collapse="\n"), template)
	#head
	template <- gsub("%head%", paste(x$head, collapse="\n"), template)
	#body
	template <- gsub("%body%", paste(x$body, collapse="\n"), template)
	#script
	template <- gsub("%script%", paste(x$script, collapse="\n"), template)
	
	#write to tempfile
	cat(template, file=tempFile)
	
	#open in browser
	browseURL(tempFile, browser = getOption("browser"), encodeIfNeeded = FALSE)
}
