# File defining module inputs, outputs

# ----------------------------------- Debug ------------------------------------
require(firstPkg)

env = dev_firstPkg(T)

#' Load subject for debugging
#' Make sure this is executed before developing the module to make sure
#' at least one subject is loaded
mount_demo_subject()


# >>>>>>>>>>>> Start ------------- [DO NOT EDIT THIS LINE] ---------------------


#  ----------------------  Initializing Global variables -----------------------

#' define_initialization is executed every time when:
#'   *** a subject is loaded
#'
#' You can use this function to do:
#'   1. Check if data is complete
#'   2. Define some "global" variables
#'
#' Check package vignette to see the explanation

define_initialization({
  # Enter code to handle data when a new subject is loaded
})




#  ---------------------------------  Inputs -----------------------------------
#' Define inputs

define_input_single_electrode(inputId = 'electrode')
define_input_frequency(inputId = 'frequency', is_range = FALSE, initial_value = 0)
define_input_time(inputId = 'time_range', is_range = TRUE, initial_value = c(0,1))

# End of input
# ----------------------------------  Outputs ----------------------------------
#' Define Outputs
#'
#' Use function `define_output` to define outputs.
#' Make sure rave toolbox (dev_[your_package_name]) is loaded.
#'
#' @Usage: define_output(definition, title, width, order)
#'
#' @param definition defines output types, for example:
#'     verbatimTextOutput('text_result')
#'   defines output type that dumps whatever is printed by function `text_result`
#'
#' Here are some possible types
#'   1. textOutput is an output for characters
#'   2. verbatimTextOutput is for console print
#'   3. plotOutput is for figures
#'   4. tableOutput is to tables
#'   5. customizedUI is for advanced UI controls
#'
#'   There are lots of output types and R packages such as DT, threejsr can provide
#'   very useful output types. Please check vignettes.
#'
#'   The easiest way to look for usage is using `help` function:
#'   help('verbatimTextOutput'), or ??verbatimTextOutput
#'
#'
#' @param title is the title for output
#'
#' @param width an integer from 1 to 12, defines the percentage of output width
#'   12 means 100% width, 6 means 50% and 4 means 33% width.
#'
#' @param order numeric order of outputs. Outputs will be re-ordered by this argument
#'
define_output(
  definition = verbatimTextOutput('text_result'),
  title = 'This Output Shows all the Printed Results',
  width = 12,
  order = 1
)

define_output(
  definition = tableOutput('table_result'),
  title = 'Subject Summary',
  width = 12,
  order = 2
)

# <<<<<<<<<<<< End ----------------- [DO NOT EDIT THIS LINE] -------------------

# -------------------------------- View layout ---------------------------------

# Preview

view_layout('firstPkg_first_example')
