"+.llmap" <- function(e1, e2) {
# Get the name of what was passed in as e2, and pass along so that it
# can be displayed in error messages
	e2name <- deparse(substitute(e2))
	if (is.llmap(e1)) addllmap(e1, e2, e2name)
}

#' @rdname ll-add
#' @export
"%+%" <- `+.llmap`
addllmap <- function(map, object, objectname) {
	#ToDo: cleverness about what type of object is being added needed here
	map$style <- c(map$style, object$style)
	map$head <- c(map$head, object$head)
	map$body <- c(map$body, object$body)
	map$script <- c(map$script, object$script)
	
	return(map)
}