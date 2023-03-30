# Get current file directory
current_file_dir=$(dirname "$0")

# Build paths
command_file="${current_file_dir}/bin/brainstorm3.command"
automated_tool_script="${current_file_dir}/bst_tool_script.m"

# First argument
matlab_root=$1

# Second argument
bids_dir=$2

# Third argument
pipeline_path=$3

# Build instruction
instruction="${command_file} ${matlab_root} ${automated_tool_script} ${bids_dir} ${pipeline_path}"

# Display instruction
echo -e '\n'$instruction'\n'

# Execute
$instruction