#' Convert R boolean values
#' 
#' Convert R boolean values to javascript
#' @param x The vector to be converted
#' @note Done like this so if we want a concatinated JSON array we can fix it once here
#' @author Thomas Finnie (Thomas.Finnie@@phe.gov.uk)
#' @export 
javascriptBoolean <- function(x){
	tolower(x)
}

#' Quote R text for Javascript
javascriptText <- function(x){
	paste('"',x,'"', sep="")
}

#' Return a key value pair string if value is not NA
#' 
#' Retruns a string containing a key: value pair if the key is not NA.
#' If the key is NA then it returns an empty string
#' @param key A string containing the name of the key to create
#' @param value A string containing the value. Should this be NA then
ifNotNA <- function(key, value){
	if(!is.na(value)){
		result <- paste(key,": ", value, sep="")
	} else {
		result <- ""
	}
	return(result)
}

#' Collapses a vector if none of its elements are NA
collapseIfNotNA <- function(x, collapse =", "){
	if(!any(is.na(x))){
		result <- paste(test, collapse=collapse)
	} else {
		result <- NA
	}
	return(result)
}

listToJavascript <- function(x, na.rm=TRUE){
	if(na.rm){
		x <- x[names(x)[!is.na(x)]]
	}
	paste("{", paste(paste(names(x), x, sep=": "),collapse=", "), "}",sep="")
}