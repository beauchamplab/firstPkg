#' @title Handles results and print which electrodes selected
#' @export
text_result <- function(result){
  text_electrode = result$get_value('text_electrode')
  cat("Electrode Selected: ", text_electrode, sep = '')
}
