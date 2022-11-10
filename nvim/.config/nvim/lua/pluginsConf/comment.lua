local comment = Prequire("Comment")
local tsintegration = Prequire("ts_context_commentstring.integrations.comment_nvim")

if comment ~= nil then
	if tsintegration ~= nil then
		comment.setup({
			pre_hook = tsintegration.create_pre_hook(),
		})
	else
		comment.setup()
	end
end
