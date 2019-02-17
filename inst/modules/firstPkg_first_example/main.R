# Main algorithm - rave_executes

require(firstPkg)

# Initialize inputs
dev_firstPkg(expose_functions = TRUE)

mount_demo_subject()

init_module('firstPkg_first_example', debug = TRUE)

# >>>>>>>>>>>> Start ------------- [DO NOT EDIT THIS LINE] ---------------------
######' @auto=TRUE

# Get subject ID
subject_id = subject$id

# Get actual loaded time
time_points = preload_info$time_points

# Get actual loaded frequencies
frequencies = preload_info$frequencies

# Get trial information
trial = module_tools$get_meta('trials')

# Get all the frequencies this subject has
all_freq = module_tools$get_meta('frequencies'); all_freq = all_freq$Frequency

# Get all valid electrodes for this subject
all_elec = subject$valid_electrodes

# Obtain user selected electrode
requested_electrode = parse_selections(electrode)

# Obtain the nearest frequency 
nearest_frequency = frequencies[which.min(abs(frequencies - frequency))]

# Obtain the time points selected
requested_time_range = time_points[time_points %within% time_range]

print(time_range)
# <<<<<<<<<<<< End ----------------- [DO NOT EDIT THIS LINE] -------------------

firstPkg::dev_firstPkg(expose_functions = TRUE)

# Debug - offline:
main = firstPkg:::debug_module('firstPkg_first_example')
ret = main()
result = ret$results

result$get_value('preload_info')


# Debug - online:
firstPkg::dev_firstPkg(expose_functions = TRUE)
mount_demo_subject()
view_layout('firstPkg_first_example')

# Production - Deploy as RAVE module
# Always Ctrl/cmd+shift+B first if you want to deploy it online
rm(list = ls(all.names = TRUE)); rstudioapi::restartSession()
module = rave::get_module(package = 'firstPkg', module_id = 'firstPkg_first_example')
rave::init_app(module)
