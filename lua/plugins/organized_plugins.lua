local function load_plugins()
	local plugin_file_paths = vim.fn.glob(vim.fn.stdpath("config") .. "/lua/plugins/**/*.lua", true)
	local all_plugin_specs = {}

	if type(plugin_file_paths) == "string" then
		plugin_file_paths = vim.split(plugin_file_paths, "\n")
	end

	for _, file_path in ipairs(plugin_file_paths) do
		local start_index = file_path:find("plugins", 1, true)

		if start_index then
			local formatted_path = file_path:sub(start_index)
			formatted_path = string.gsub(formatted_path, "%.lua$", "")

			if formatted_path ~= "plugins/organized_plugins" then
				local plugin_specs = require(formatted_path)
				table.insert(all_plugin_specs, plugin_specs)
			end
		end
	end
	return all_plugin_specs
end

return load_plugins()
