# Don't uncomment the following lines, they are for debuging only 
#
# main = firstPkg:::debug_module('firstPkg_first_example')
# ret = main()
# result <- ret$results

#' @title Handles results and print which electrodes selected
#' @export
text_result <- function(result){
  cat("Electrode Selected:", result$get_value('electrode'), '\n')
  cat("Frequency Selected:", result$get_value('frequency'), '\n')
  cat("Time Range Selected:", result$get_value('time_range'), '\n')
}

table_result <- function(result){
  subject_id = result$get_value('subject_id')
  
  n_trials = nrow(result$get_value('subject_id'))
  
  all_freq = result$get_value('all_freq')
  frequencies = result$get_value('frequencies')
  
  n_timepoints = length(result$get_value('time_points'))
  
  all_elec = result$get_value('all_elec')
  requested_electrode = result$get_value('requested_electrode')
  
  tbl = c(
    'Subject ID' = subject_id,
    '# of Trials' = n_trials,
    'Frequencies Loaded' = paste(range(frequencies), collapse = ' - '),
    'Available Frequencies' = paste(range(all_freq), collapse = ' - '),
    'Time Points Selected' = length(n_timepoints),
    'Electrodes Selected' = deparse_selections(requested_electrode),
    'Electrodes Total' = deparse_selections(all_elec)
  )
  
  data.frame(
    Name = names(tbl),
    Value = tbl
  )
}
