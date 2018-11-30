--[[
    Copies the text of all selected items to the clipboard, separated by empty new lines
    Author: GSGBen
]]

-- get how many items we've selected
local num_items = reaper.CountSelectedMediaItems(0)

-- initialise the whole notes variable, with the first notes to avoid two empty lines at the start
firstitem = reaper.GetSelectedMediaItem(0, 0)
notes = reaper.ULT_GetMediaItemNote(firstitem)

-- add the rest of the item notes
for i = 1, num_items - 1 do
	
	local item = reaper.GetSelectedMediaItem(0, i)
    notes = notes .. "\n\n" .. reaper.ULT_GetMediaItemNote(item)
	
end

-- send them to the clipboard
reaper.CF_SetClipboard(notes)