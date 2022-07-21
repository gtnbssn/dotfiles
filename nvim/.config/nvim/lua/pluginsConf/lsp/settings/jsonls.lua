return {
	settings = {
		json = {
			schemas = require("schemastore").json.schemas({
				replace = {
					["geojson.json"] = {
						description = "geojson overriden with a fileMatch thank you",
						fileMatch = { "*.geojson" },
						name = "geojson.json",
						url = "https://json.schemastore.org/geojson.json",
					},
				},
			}),
			validate = { enable = true },
		},
	},
}
