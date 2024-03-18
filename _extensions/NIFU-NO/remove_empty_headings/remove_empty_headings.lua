-- remove_empty_headings.lua

function Pandoc(doc)
    local new_blocks = {}  -- This table will hold the new list of blocks, excluding empty headings
    local heading_stack = {}  -- This stack temporarily holds headings until it's determined whether they should be kept

    -- Function to check if a heading has content following it
    local function has_content(index)
        -- Iterate through the blocks following the heading
        for i = index + 1, #doc.blocks do
            local block = doc.blocks[i] -- Make a variable named block from the blocks in the document
            if block.t == "Header" then
                -- If the next heading is at the same or higher level, no content is present
                if block.level <= doc.blocks[index].level then
                    return false
                end
            else
                -- Any other block type indicates content
                return true
            end
        end
        -- If the end of the document is reached with no content, return false
        return false  
    end

    -- Iterate through each block in the document
    for i, block in ipairs(doc.blocks) do
        if block.t == "Header" then
            -- If a heading is encountered, push it onto the heading_stack
            table.insert(heading_stack, { block = block, index = i })
        else
            -- If a non-heading block is encountered, process the heading_stack
            for _, heading_info in ipairs(heading_stack) do
                -- Check each heading in the stack to see if it has content following it
                if has_content(heading_info.index) then
                    -- If a heading has content, add it to new_blocks
                    table.insert(new_blocks, heading_info.block)
                end
            end
            -- Clear the heading stack for the next set of headings
            heading_stack = {}  
            -- Add the current non-heading block to new_blocks
            table.insert(new_blocks, block)  
        end
    end

    -- Process any remaining headings in the stack at the end of the document
    for _, heading_info in ipairs(heading_stack) do
        -- Check each remaining heading to see if it has content following it
        if has_content(heading_info.index) then
            -- If a heading has content, add it to new_blocks
            table.insert(new_blocks, heading_info.block)
        end
    end

    -- Update the document's blocks to the new list of blocks, excluding empty headings
    doc.blocks = new_blocks
    return doc
end
