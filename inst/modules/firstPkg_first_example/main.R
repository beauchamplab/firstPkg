# Main algorithm - rave_executes

require(firstPkg)

# Initialize inputs
dev_firstPkg(expose_functions = TRUE)

mount_demo_subject()

# >>>>>>>>>>>> Start ------------- [DO NOT EDIT THIS LINE] ---------------------
######' @auto=TRUE

requested_electrodes = parse_selections(text_electrode)

time_points = preload_info$time_points
frequencies = preload_info$frequencies

trial = module_tools$get_meta('trials')

# <<<<<<<<<<<< End ----------------- [DO NOT EDIT THIS LINE] -------------------

# Debug - Step 1: clear environment and reload

firstPkg::dev_firstPkg(expose_functions = TRUE)

mount_demo_subject()

env = reload_this_package(expose = FALSE, clear_env = TRUE)

# Step 2: make sure rave data is attached
attachDefaultDataRepository()


# Step 3: try to run from local session
module = rave::get_module(package = 'firstPkg', module_id = 'firstPkg_first_example', local = T)

res = module()

# Check results
res$results$get_value(key = 'requested_electrodes')
res$results$get_value(key = 'time_points')
res$results$get_value(key = 'frequencies')
res$results$get_value(key = 'trial')

# Step 4: load module and preview

# First method
m = rave::get_module(package = 'firstPkg', module_id = 'firstPkg_first_example', local = F)
rave::init_app(m)

# Second method
firstPkg::dev_firstPkg(expose_functions = TRUE)
view_layout('firstPkg_first_example')
