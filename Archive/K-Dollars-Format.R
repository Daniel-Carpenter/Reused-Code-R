library(scales)

# Function to scale a value and add unit at end (similar to comma, or dollar in the scales package)
kDollarsFormat <- function(x, scaleUnit = 'M',
                           useDollarSign = TRUE,
                           roundToDigit = 1
                           ) {
  
  # List of possible formats
  formatTypes <- list(
    'K' = 3,
    'M' = 6,
    'B' = 9,
    'T' = 12
  )
  
  formatTypesVector <- (formatTypes |> stack())$ind
  
  # Warn if format not in list
  # Default to million
  if (!(scaleUnit %in% formatTypesVector)) {
    warning(paste0('Scale format given (', scaleUnit, ') not in list: ', paste(formatTypesVector, collapse = ', '), '. Using "M" as default.'))
    scaleUnit = 'M'
    
  }  
  
  # Get the degree value of the chosen format
  chosenFormatValue <- formatTypes[[scaleUnit]] |> unlist()
  
  # Round number and scale
  x = round(x / (10^chosenFormatValue), roundToDigit)
  
  formattedNumber = dollar(x, 
                           prefix = ifelse(useDollarSign, "$", ''), # dollar or not
                           suffix = paste0(' ', trimws(scaleUnit)))  # K/M
  
  return(formattedNumber)
}

# Examples
# kDollarsFormat(1000, scaleUnit = 'K')
# kDollarsFormat(1000000, scaleUnit = 'M')
# kDollarsFormat(1000000000, scaleUnit = 'B')
# kDollarsFormat(1500000000000, scaleUnit = 'T')
# kDollarsFormat(1000000, scaleUnit = 'M', useDollarSign = F)
