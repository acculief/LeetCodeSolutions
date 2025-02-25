def construct_maximum_binary_tree(nums)
  helper(nums, 0, nums.size-1)
end

def helper(nums, from, to)
  if from > to
    return nil
  elsif from == to
    tree = TreeNode.new(nums[from])
  else
    pos = find_max_element_position(nums, from, to)
    tree = TreeNode.new(nums[pos])
    tree.right = helper(nums, pos+1, to)
    tree.left = helper(nums, from, pos-1)
  end
  return tree
end

def find_max_element_position(nums, from, to)
  pos = from
  for i in (from..to) do
    if nums[i].to_i > nums[pos].to_i
      pos = i
    end
  end
  return pos
end
