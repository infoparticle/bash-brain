# KB LeetCode Module for Nushell
# Comprehensive coding patterns, templates, and techniques
# Install: Save to ~/.config/nushell/kb/lc.nu

#######################
# COMPLEXITY REFERENCE
#######################

# Big-O Complexity Reference
export def "kb lc complexity" [] {
    [
        {
            notation: "O(1)"
            name: "Constant"
            description: "Independent of input size"
            examples: "Array access, hash table lookup"
            growth: "Flat line"
        }
        {
            notation: "O(log n)"
            name: "Logarithmic"
            description: "Halves problem each iteration"
            examples: "Binary search, balanced BST operations"
            growth: "Slow increase"
        }
        {
            notation: "O(n)"
            name: "Linear"
            description: "Scales linearly with input"
            examples: "Array iteration, linear search"
            growth: "Straight diagonal"
        }
        {
            notation: "O(n log n)"
            name: "Linearithmic"
            description: "Divide and conquer algorithms"
            examples: "Merge sort, quick sort, heap sort"
            growth: "Slightly curved"
        }
        {
            notation: "O(n²)"
            name: "Quadratic"
            description: "Nested iterations"
            examples: "Bubble sort, nested loops, naive string matching"
            growth: "Steep curve"
        }
        {
            notation: "O(n³)"
            name: "Cubic"
            description: "Triple nested iterations"
            examples: "3-sum with brute force, matrix multiplication"
            growth: "Very steep"
        }
        {
            notation: "O(2ⁿ)"
            name: "Exponential"
            description: "Doubles with each addition"
            examples: "Recursive fibonacci, subset generation"
            growth: "Explosive"
        }
        {
            notation: "O(n!)"
            name: "Factorial"
            description: "All permutations"
            examples: "Traveling salesman brute force, permutations"
            growth: "Catastrophic"
        }
    ]
}

# Time/Space complexity comparison
export def "kb lc complexity compare" [] {
    {
        excellent: ["O(1)", "O(log n)"]
        good: ["O(n)", "O(n log n)"]
        acceptable: ["O(n²)"]
        bad: ["O(n³)", "O(2ⁿ)"]
        terrible: ["O(n!)"]
        guidelines: {
            n_10: "All complexities acceptable"
            n_100: "O(n³) starts struggling"
            n_1000: "O(n²) is limit"
            n_10000: "Need O(n log n) or better"
            n_100000: "Need O(n) or better"
            n_1000000: "Need O(log n) or O(1)"
        }
    }
}

#######################
# COMMON PATTERNS
#######################

# All LeetCode patterns overview
export def "kb lc patterns" [] {
    [
        {
            pattern: "Two Pointers"
            when: "Sorted arrays, palindromes, pairs"
            time: "O(n)"
            space: "O(1)"
            difficulty: "Easy-Medium"
            examples: ["Two Sum II", "Container With Most Water", "3Sum"]
        }
        {
            pattern: "Sliding Window"
            when: "Subarray/substring problems"
            time: "O(n)"
            space: "O(1) to O(k)"
            difficulty: "Medium"
            examples: ["Longest Substring Without Repeating", "Min Window Substring"]
        }
        {
            pattern: "Binary Search"
            when: "Sorted data, search space reduction"
            time: "O(log n)"
            space: "O(1)"
            difficulty: "Easy-Hard"
            examples: ["Search in Rotated Array", "Find Peak Element"]
        }
        {
            pattern: "BFS"
            when: "Level-order, shortest path, grid"
            time: "O(V + E)"
            space: "O(V)"
            difficulty: "Medium"
            examples: ["Binary Tree Level Order", "Word Ladder", "Islands"]
        }
        {
            pattern: "DFS"
            when: "Tree/graph traversal, backtracking"
            time: "O(V + E)"
            space: "O(h) recursive"
            difficulty: "Medium-Hard"
            examples: ["Path Sum", "Word Search", "Combinations"]
        }
        {
            pattern: "Dynamic Programming"
            when: "Optimization, overlapping subproblems"
            time: "O(n²) typical"
            space: "O(n) to O(n²)"
            difficulty: "Medium-Hard"
            examples: ["Climbing Stairs", "Longest Increasing Subsequence", "Knapsack"]
        }
        {
            pattern: "Greedy"
            when: "Local optimal leads to global"
            time: "O(n log n) typical"
            space: "O(1) to O(n)"
            difficulty: "Medium"
            examples: ["Jump Game", "Gas Station", "Meeting Rooms"]
        }
        {
            pattern: "Backtracking"
            when: "Generate all solutions, constraints"
            time: "O(2ⁿ) to O(n!)"
            space: "O(n)"
            difficulty: "Medium-Hard"
            examples: ["N-Queens", "Sudoku Solver", "Permutations"]
        }
        {
            pattern: "Union Find"
            when: "Connected components, grouping"
            time: "O(α(n)) ≈ O(1)"
            space: "O(n)"
            difficulty: "Medium-Hard"
            examples: ["Number of Islands", "Redundant Connection"]
        }
        {
            pattern: "Topological Sort"
            when: "DAG, dependency resolution"
            time: "O(V + E)"
            space: "O(V)"
            difficulty: "Medium-Hard"
            examples: ["Course Schedule", "Alien Dictionary"]
        }
    ]
}

#######################
# TREE PATTERNS
#######################

# Tree DFS template
export def "kb lc tree dfs" [
    --lang: string = "python"  # Language: python, java, cpp, javascript
] {
    match $lang {
        "python" => {
            print "# Tree DFS Template (Python)

def dfs(node):
    if not node:
        return

    # Pre-order: Process node before children
    # print(node.val)

    dfs(node.left)

    # In-order: Process between left and right
    # print(node.val)

    dfs(node.right)

    # Post-order: Process after children
    # print(node.val)

# With return value
def dfs_with_return(node):
    if not node:
        return 0  # base case

    left = dfs_with_return(node.left)
    right = dfs_with_return(node.right)

    # Combine results
    return left + right + node.val

# Path finding
def find_path(node, target, path):
    if not node:
        return False

    path.append(node.val)

    if node.val == target:
        return True

    if find_path(node.left, target, path) or find_path(node.right, target, path):
        return True

    path.pop()  # Backtrack
    return False"
        }
        "java" => {
            print "// Tree DFS Template (Java)

void dfs(TreeNode node) {
    if (node == null) return;

    // Pre-order
    // System.out.println(node.val);

    dfs(node.left);

    // In-order
    // System.out.println(node.val);

    dfs(node.right);

    // Post-order
    // System.out.println(node.val);
}

// With return value
int dfsWithReturn(TreeNode node) {
    if (node == null) return 0;

    int left = dfsWithReturn(node.left);
    int right = dfsWithReturn(node.right);

    return left + right + node.val;
}

// Path finding
boolean findPath(TreeNode node, int target, List<Integer> path) {
    if (node == null) return false;

    path.add(node.val);

    if (node.val == target) return true;

    if (findPath(node.left, target, path) || findPath(node.right, target, path)) {
        return true;
    }

    path.remove(path.size() - 1);  // Backtrack
    return false;
}"
        }
        "cpp" => {
            print "// Tree DFS Template (C++)

void dfs(TreeNode* node) {
    if (!node) return;

    // Pre-order
    // cout << node->val << endl;

    dfs(node->left);

    // In-order
    // cout << node->val << endl;

    dfs(node->right);

    // Post-order
    // cout << node->val << endl;
}

// With return value
int dfsWithReturn(TreeNode* node) {
    if (!node) return 0;

    int left = dfsWithReturn(node->left);
    int right = dfsWithReturn(node->right);

    return left + right + node->val;
}

// Path finding
bool findPath(TreeNode* node, int target, vector<int>& path) {
    if (!node) return false;

    path.push_back(node->val);

    if (node->val == target) return true;

    if (findPath(node->left, target, path) || findPath(node->right, target, path)) {
        return true;
    }

    path.pop_back();  // Backtrack
    return false;
}"
        }
        _ => {
            print "Supported languages: python, java, cpp, javascript"
        }
    }
}

# Tree BFS template
export def "kb lc tree bfs" [--lang: string = "python"] {
    match $lang {
        "python" => {
            print "# Tree BFS Template (Python)

from collections import deque

def bfs(root):
    if not root:
        return []

    queue = deque([root])
    result = []

    while queue:
        node = queue.popleft()
        result.append(node.val)

        if node.left:
            queue.append(node.left)
        if node.right:
            queue.append(node.right)

    return result

# Level-order traversal
def level_order(root):
    if not root:
        return []

    queue = deque([root])
    result = []

    while queue:
        level_size = len(queue)
        level = []

        for _ in range(level_size):
            node = queue.popleft()
            level.append(node.val)

            if node.left:
                queue.append(node.left)
            if node.right:
                queue.append(node.right)

        result.append(level)

    return result

# Right side view
def right_side_view(root):
    if not root:
        return []

    queue = deque([root])
    result = []

    while queue:
        level_size = len(queue)

        for i in range(level_size):
            node = queue.popleft()

            # Last node in level
            if i == level_size - 1:
                result.append(node.val)

            if node.left:
                queue.append(node.left)
            if node.right:
                queue.append(node.right)

    return result"
        }
        "java" => {
            print "// Tree BFS Template (Java)

List<Integer> bfs(TreeNode root) {
    if (root == null) return new ArrayList<>();

    Queue<TreeNode> queue = new LinkedList<>();
    queue.offer(root);
    List<Integer> result = new ArrayList<>();

    while (!queue.isEmpty()) {
        TreeNode node = queue.poll();
        result.add(node.val);

        if (node.left != null) queue.offer(node.left);
        if (node.right != null) queue.offer(node.right);
    }

    return result;
}

// Level-order traversal
List<List<Integer>> levelOrder(TreeNode root) {
    List<List<Integer>> result = new ArrayList<>();
    if (root == null) return result;

    Queue<TreeNode> queue = new LinkedList<>();
    queue.offer(root);

    while (!queue.isEmpty()) {
        int levelSize = queue.size();
        List<Integer> level = new ArrayList<>();

        for (int i = 0; i < levelSize; i++) {
            TreeNode node = queue.poll();
            level.add(node.val);

            if (node.left != null) queue.offer(node.left);
            if (node.right != null) queue.offer(node.right);
        }

        result.add(level);
    }

    return result;
}"
        }
        _ => {
            print "Supported languages: python, java, cpp"
        }
    }
}

# Tree patterns overview
export def "kb lc tree patterns" [] {
    {
        traversal: {
            dfs: {
                preorder: "Root → Left → Right (process before children)"
                inorder: "Left → Root → Right (BST gives sorted order)"
                postorder: "Left → Right → Root (process after children)"
                use_cases: ["Path problems", "Tree construction", "Serialization"]
            }
            bfs: {
                level_order: "Process level by level"
                use_cases: ["Level order traversal", "Right/left view", "Shortest path"]
            }
        }
        common_techniques: {
            recursion: "Natural fit for tree structure"
            iteration: "Use stack (DFS) or queue (BFS)"
            morris: "O(1) space traversal using threading"
        }
        problem_types: [
            {type: "Path Sum", pattern: "DFS with accumulator"}
            {type: "Lowest Common Ancestor", pattern: "Post-order DFS"}
            {type: "Diameter", pattern: "Post-order with max tracking"}
            {type: "Level Order", pattern: "BFS with level tracking"}
            {type: "Serialize/Deserialize", pattern: "Pre-order DFS"}
            {type: "Validate BST", pattern: "In-order or range checking"}
        ]
    }
}

#######################
# GRAPH PATTERNS
#######################

# Graph DFS template
export def "kb lc graph dfs" [--lang: string = "python"] {
    match $lang {
        "python" => {
            print "# Graph DFS Template (Python)

# Adjacency list representation
def dfs_recursive(graph, node, visited):
    visited.add(node)

    for neighbor in graph[node]:
        if neighbor not in visited:
            dfs_recursive(graph, neighbor, visited)

# Iterative DFS
def dfs_iterative(graph, start):
    visited = set()
    stack = [start]

    while stack:
        node = stack.pop()

        if node in visited:
            continue

        visited.add(node)

        for neighbor in graph[node]:
            if neighbor not in visited:
                stack.append(neighbor)

    return visited

# DFS with path tracking
def dfs_path(graph, start, end, visited, path):
    visited.add(start)
    path.append(start)

    if start == end:
        return True

    for neighbor in graph[start]:
        if neighbor not in visited:
            if dfs_path(graph, neighbor, end, visited, path):
                return True

    path.pop()  # Backtrack
    return False

# Detect cycle
def has_cycle(graph, node, visited, rec_stack):
    visited.add(node)
    rec_stack.add(node)

    for neighbor in graph[node]:
        if neighbor not in visited:
            if has_cycle(graph, neighbor, visited, rec_stack):
                return True
        elif neighbor in rec_stack:
            return True

    rec_stack.remove(node)
    return False"
        }
        _ => {
            print "Supported languages: python, java, cpp"
        }
    }
}

# Graph BFS template
export def "kb lc graph bfs" [--lang: string = "python"] {
    match $lang {
        "python" => {
            print "# Graph BFS Template (Python)

from collections import deque

# Basic BFS
def bfs(graph, start):
    visited = set([start])
    queue = deque([start])

    while queue:
        node = queue.popleft()

        for neighbor in graph[node]:
            if neighbor not in visited:
                visited.add(neighbor)
                queue.append(neighbor)

    return visited

# BFS with distance tracking
def bfs_distance(graph, start):
    visited = {start: 0}
    queue = deque([start])

    while queue:
        node = queue.popleft()

        for neighbor in graph[node]:
            if neighbor not in visited:
                visited[neighbor] = visited[node] + 1
                queue.append(neighbor)

    return visited

# Multi-source BFS (like rotting oranges)
def multi_source_bfs(grid):
    rows, cols = len(grid), len(grid[0])
    queue = deque()

    # Add all starting points
    for r in range(rows):
        for c in range(cols):
            if grid[r][c] == 2:  # Starting condition
                queue.append((r, c, 0))

    max_time = 0
    directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]

    while queue:
        r, c, time = queue.popleft()
        max_time = max(max_time, time)

        for dr, dc in directions:
            nr, nc = r + dr, c + dc

            if 0 <= nr < rows and 0 <= nc < cols and grid[nr][nc] == 1:
                grid[nr][nc] = 2
                queue.append((nr, nc, time + 1))

    return max_time"
        }
        _ => {
            print "Supported languages: python, java"
        }
    }
}

#######################
# DYNAMIC PROGRAMMING
#######################

# DP patterns overview
export def "kb lc dp patterns" [] {
    [
        {
            pattern: "Fibonacci-style"
            recurrence: "dp[i] = dp[i-1] + dp[i-2]"
            examples: "Climbing Stairs, House Robber"
            space_opt: "Only need last 2 values"
        }
        {
            pattern: "0/1 Knapsack"
            recurrence: "dp[i][w] = max(dp[i-1][w], dp[i-1][w-weight[i]] + value[i])"
            examples: "Subset Sum, Partition Equal Subset"
            space_opt: "1D array, iterate backwards"
        }
        {
            pattern: "Unbounded Knapsack"
            recurrence: "dp[i][w] = max(dp[i-1][w], dp[i][w-weight[i]] + value[i])"
            examples: "Coin Change, Rod Cutting"
            space_opt: "1D array, iterate forwards"
        }
        {
            pattern: "LCS (Longest Common Subsequence)"
            recurrence: "dp[i][j] = dp[i-1][j-1] + 1 if match, else max(dp[i-1][j], dp[i][j-1])"
            examples: "LCS, Edit Distance, Longest Palindromic Subsequence"
            space_opt: "Rolling array (2 rows)"
        }
        {
            pattern: "LIS (Longest Increasing Subsequence)"
            recurrence: "dp[i] = max(dp[j] + 1) for all j < i where arr[j] < arr[i]"
            examples: "LIS, Russian Doll Envelopes"
            space_opt: "Binary search approach O(n log n)"
        }
        {
            pattern: "Palindrome"
            recurrence: "dp[i][j] = dp[i+1][j-1] if s[i] == s[j]"
            examples: "Longest Palindromic Substring, Palindrome Partitioning"
            space_opt: "Expand around center"
        }
        {
            pattern: "Interval DP"
            recurrence: "dp[i][j] = min/max over all k in [i,j]"
            examples: "Matrix Chain Multiplication, Burst Balloons"
            space_opt: "Bottom-up, increasing interval length"
        }
        {
            pattern: "State Machine"
            recurrence: "Multiple states per position"
            examples: "Best Time to Buy/Sell Stock with states"
            space_opt: "Track only current state"
        }
    ]
}

# DP template generator
export def "kb lc dp template" [
    type: string  # fibonacci, knapsack, lcs, lis
    --lang: string = "python"
] {
    match $type {
        "fibonacci" => {
            print "# Fibonacci-style DP (Python)

# Top-down (memoization)
def fib_memo(n, memo={}):
    if n in memo:
        return memo[n]
    if n <= 1:
        return n

    memo[n] = fib_memo(n-1, memo) + fib_memo(n-2, memo)
    return memo[n]

# Bottom-up (tabulation)
def fib_tab(n):
    if n <= 1:
        return n

    dp = [0] * (n + 1)
    dp[1] = 1

    for i in range(2, n + 1):
        dp[i] = dp[i-1] + dp[i-2]

    return dp[n]

# Space optimized
def fib_opt(n):
    if n <= 1:
        return n

    prev2, prev1 = 0, 1

    for _ in range(2, n + 1):
        curr = prev1 + prev2
        prev2 = prev1
        prev1 = curr

    return prev1"
        }
        "knapsack" => {
            print "# 0/1 Knapsack DP (Python)

# 2D DP
def knapsack_2d(weights, values, capacity):
    n = len(weights)
    dp = [[0] * (capacity + 1) for _ in range(n + 1)]

    for i in range(1, n + 1):
        for w in range(capacity + 1):
            # Don't take item i
            dp[i][w] = dp[i-1][w]

            # Take item i if possible
            if weights[i-1] <= w:
                dp[i][w] = max(dp[i][w],
                              dp[i-1][w - weights[i-1]] + values[i-1])

    return dp[n][capacity]

# Space optimized (1D)
def knapsack_1d(weights, values, capacity):
    dp = [0] * (capacity + 1)

    for i in range(len(weights)):
        # Iterate backwards to avoid using updated values
        for w in range(capacity, weights[i] - 1, -1):
            dp[w] = max(dp[w], dp[w - weights[i]] + values[i])

    return dp[capacity]"
        }
        "lcs" => {
            print "# Longest Common Subsequence (Python)

def lcs(s1, s2):
    m, n = len(s1), len(s2)
    dp = [[0] * (n + 1) for _ in range(m + 1)]

    for i in range(1, m + 1):
        for j in range(1, n + 1):
            if s1[i-1] == s2[j-1]:
                dp[i][j] = dp[i-1][j-1] + 1
            else:
                dp[i][j] = max(dp[i-1][j], dp[i][j-1])

    return dp[m][n]

# With path reconstruction
def lcs_with_path(s1, s2):
    m, n = len(s1), len(s2)
    dp = [[0] * (n + 1) for _ in range(m + 1)]

    # Build DP table
    for i in range(1, m + 1):
        for j in range(1, n + 1):
            if s1[i-1] == s2[j-1]:
                dp[i][j] = dp[i-1][j-1] + 1
            else:
                dp[i][j] = max(dp[i-1][j], dp[i][j-1])

    # Reconstruct LCS
    lcs = []
    i, j = m, n
    while i > 0 and j > 0:
        if s1[i-1] == s2[j-1]:
            lcs.append(s1[i-1])
            i -= 1
            j -= 1
        elif dp[i-1][j] > dp[i][j-1]:
            i -= 1
        else:
            j -= 1

    return ''.join(reversed(lcs))"
        }
        _ => {
            print "Supported types: fibonacci, knapsack, lcs, lis"
        }
    }
}

#######################
# TWO POINTERS / SLIDING WINDOW
#######################

# Two pointers patterns
export def "kb lc two-pointers" [] {
    {
        opposite_ends: {
            description: "Start from both ends, move towards middle"
            when: "Sorted array, palindrome check, pair sum"
            template: "left = 0, right = n-1; while left < right"
            examples: ["Two Sum II", "Container With Most Water", "Valid Palindrome"]
        }
        same_direction: {
            description: "Both pointers move in same direction at different speeds"
            when: "Remove duplicates, partition, fast-slow pointer"
            template: "slow = 0, fast = 0; move fast, conditionally move slow"
            examples: ["Remove Duplicates", "Move Zeroes", "Linked List Cycle"]
        }
        sliding_window: {
            description: "Window expands and contracts"
            when: "Substring/subarray with constraints"
            template: "left = 0; for right in range(n): expand, while invalid: contract"
            examples: ["Longest Substring Without Repeating", "Min Window Substring"]
        }
    }
}

# Sliding window template
export def "kb lc sliding-window" [--lang: string = "python"] {
    match $lang {
        "python" => {
            print "# Sliding Window Template (Python)

from collections import defaultdict

# Fixed size window
def fixed_window(arr, k):
    if len(arr) < k:
        return None

    window_sum = sum(arr[:k])
    max_sum = window_sum

    for i in range(k, len(arr)):
        window_sum = window_sum - arr[i-k] + arr[i]
        max_sum = max(max_sum, window_sum)

    return max_sum

# Variable size window (longest valid window)
def longest_window(s):
    left = 0
    max_len = 0
    char_count = defaultdict(int)

    for right in range(len(s)):
        # Expand window
        char_count[s[right]] += 1

        # Contract window while invalid
        while not is_valid(char_count):
            char_count[s[left]] -= 1
            if char_count[s[left]] == 0:
                del char_count[s[left]]
            left += 1

        # Update result
        max_len = max(max_len, right - left + 1)

    return max_len

# Variable size window (shortest valid window)
def shortest_window(s, target):
    left = 0
    min_len = float('inf')
    need = {}  # characters needed
    have = {}  # characters we have

    for c in target:
        need[c] = need.get(c, 0) + 1

    formed = 0  # how many unique chars match

    for right in range(len(s)):
        char = s[right]
        have[char] = have.get(char, 0) + 1

        if char in need and have[char] == need[char]:
            formed += 1

        # Contract window when valid
        while formed == len(need):
            min_len = min(min_len, right - left + 1)

            char = s[left]
            have[char] -= 1
            if char in need and have[char] < need[char]:
                formed -= 1

            left += 1

    return min_len if min_len != float('inf') else 0"
        }
        _ => {
            print "Supported languages: python"
        }
    }
}

#######################
# BINARY SEARCH
#######################

# Binary search patterns
export def "kb lc binary-search" [] {
    {
        basic: {
            description: "Find exact target in sorted array"
            template: "while left <= right: mid = (left + right) // 2"
            examples: ["Binary Search", "Search Insert Position"]
        }
        leftmost: {
            description: "Find first occurrence"
            template: "if nums[mid] >= target: right = mid - 1"
            examples: ["Find First and Last Position"]
        }
        rightmost: {
            description: "Find last occurrence"
            template: "if nums[mid] <= target: left = mid + 1"
            examples: ["Find First and Last Position"]
        }
        search_space: {
            description: "Answer is in a range, not array indices"
            template: "Binary search on possible answers"
            examples: ["Koko Eating Bananas", "Capacity To Ship Packages"]
        }
        rotated: {
            description: "Rotated sorted array"
            template: "Determine which half is sorted, then search"
            examples: ["Search in Rotated Sorted Array"]
        }
    }
}

# Binary search template
export def "kb lc binary-search template" [--lang: string = "python"] {
    match $lang {
        "python" => {
            print "# Binary Search Templates (Python)

# Basic binary search
def binary_search(nums, target):
    left, right = 0, len(nums) - 1

    while left <= right:
        mid = left + (right - left) // 2

        if nums[mid] == target:
            return mid
        elif nums[mid] < target:
            left = mid + 1
        else:
            right = mid - 1

    return -1

# Find leftmost (first occurrence)
def find_first(nums, target):
    left, right = 0, len(nums) - 1
    result = -1

    while left <= right:
        mid = left + (right - left) // 2

        if nums[mid] == target:
            result = mid
            right = mid - 1  # Continue searching left
        elif nums[mid] < target:
            left = mid + 1
        else:
            right = mid - 1

    return result

# Find rightmost (last occurrence)
def find_last(nums, target):
    left, right = 0, len(nums) - 1
    result = -1

    while left <= right:
        mid = left + (right - left) // 2

        if nums[mid] == target:
            result = mid
            left = mid + 1  # Continue searching right
        elif nums[mid] < target:
            left = mid + 1
        else:
            right = mid - 1

    return result

# Search space binary search (find minimum that satisfies condition)
def min_satisfying(left, right, condition):
    result = right + 1

    while left <= right:
        mid = left + (right - left) // 2

        if condition(mid):
            result = mid
            right = mid - 1  # Try to find smaller
        else:
            left = mid + 1

    return result

# Rotated sorted array
def search_rotated(nums, target):
    left, right = 0, len(nums) - 1

    while left <= right:
        mid = left + (right - left) // 2

        if nums[mid] == target:
            return mid

        # Determine which half is sorted
        if nums[left] <= nums[mid]:  # Left half sorted
            if nums[left] <= target < nums[mid]:
                right = mid - 1
            else:
                left = mid + 1
        else:  # Right half sorted
            if nums[mid] < target <= nums[right]:
                left = mid + 1
            else:
                right = mid - 1

    return -1"
        }
        _ => {
            print "Supported languages: python"
        }
    }
}

#######################
# BACKTRACKING
#######################

# Backtracking patterns
export def "kb lc backtracking" [] {
    {
        combinations: {
            description: "Choose k elements from n"
            template: "Add to path, recurse, remove from path"
            examples: ["Combinations", "Combination Sum"]
        }
        permutations: {
            description: "All orderings of elements"
            template: "Use visited set, try all positions"
            examples: ["Permutations", "Permutations II"]
        }
        subsets: {
            description: "All possible subsets"
            template: "Include or exclude each element"
            examples: ["Subsets", "Subsets II"]
        }
        partition: {
            description: "Split into valid parts"
            template: "Try all split points"
            examples: ["Palindrome Partitioning", "Restore IP Addresses"]
        }
        board_problems: {
            description: "2D grid exploration"
            template: "Try 4 directions, mark visited, backtrack"
            examples: ["Word Search", "N-Queens", "Sudoku Solver"]
        }
    }
}

# Backtracking template
export def "kb lc backtracking template" [
    type: string  # combinations, permutations, subsets
    --lang: string = "python"
] {
    match $type {
        "combinations" => {
            print "# Combinations Backtracking (Python)

def combine(n, k):
    result = []

    def backtrack(start, path):
        # Base case: found valid combination
        if len(path) == k:
            result.append(path[:])
            return

        # Pruning: not enough elements left
        need = k - len(path)
        available = n - start + 1
        if available < need:
            return

        # Try all candidates
        for i in range(start, n + 1):
            # Choose
            path.append(i)

            # Explore
            backtrack(i + 1, path)

            # Unchoose (backtrack)
            path.pop()

    backtrack(1, [])
    return result

# Combination sum (with duplicates allowed)
def combination_sum(candidates, target):
    result = []

    def backtrack(start, target, path):
        if target == 0:
            result.append(path[:])
            return

        if target < 0:
            return

        for i in range(start, len(candidates)):
            path.append(candidates[i])
            backtrack(i, target - candidates[i], path)  # i not i+1 (reuse allowed)
            path.pop()

    backtrack(0, target, [])
    return result"
        }
        "permutations" => {
            print "# Permutations Backtracking (Python)

def permute(nums):
    result = []

    def backtrack(path, remaining):
        if not remaining:
            result.append(path[:])
            return

        for i in range(len(remaining)):
            # Choose
            path.append(remaining[i])

            # Explore with remaining elements
            backtrack(path, remaining[:i] + remaining[i+1:])

            # Unchoose
            path.pop()

    backtrack([], nums)
    return result

# With swap approach (more efficient)
def permute_swap(nums):
    result = []

    def backtrack(start):
        if start == len(nums):
            result.append(nums[:])
            return

        for i in range(start, len(nums)):
            # Swap
            nums[start], nums[i] = nums[i], nums[start]

            # Recurse
            backtrack(start + 1)

            # Backtrack (swap back)
            nums[start], nums[i] = nums[i], nums[start]

    backtrack(0)
    return result

# Permutations with duplicates
def permute_unique(nums):
    result = []
    nums.sort()  # Sort to group duplicates

    def backtrack(path, used):
        if len(path) == len(nums):
            result.append(path[:])
            return

        for i in range(len(nums)):
            if used[i]:
                continue

            # Skip duplicates
            if i > 0 and nums[i] == nums[i-1] and not used[i-1]:
                continue

            path.append(nums[i])
            used[i] = True

            backtrack(path, used)

            path.pop()
            used[i] = False

    backtrack([], [False] * len(nums))
    return result"
        }
        "subsets" => {
            print "# Subsets Backtracking (Python)

def subsets(nums):
    result = []

    def backtrack(start, path):
        # Every path is a valid subset
        result.append(path[:])

        for i in range(start, len(nums)):
            # Include nums[i]
            path.append(nums[i])

            # Explore
            backtrack(i + 1, path)

            # Backtrack
            path.pop()

    backtrack(0, [])
    return result

# Iterative approach
def subsets_iterative(nums):
    result = [[]]

    for num in nums:
        # Add num to all existing subsets
        result += [curr + [num] for curr in result]

    return result

# Subsets with duplicates
def subsets_with_dup(nums):
    result = []
    nums.sort()  # Sort to handle duplicates

    def backtrack(start, path):
        result.append(path[:])

        for i in range(start, len(nums)):
            # Skip duplicates
            if i > start and nums[i] == nums[i-1]:
                continue

            path.append(nums[i])
            backtrack(i + 1, path)
            path.pop()

    backtrack(0, [])
    return result"
        }
        _ => {
            print "Supported types: combinations, permutations, subsets"
        }
    }
}

#######################
# UTILITY FUNCTIONS
#######################

# Search patterns
export def "kb lc search" [query: string] {
    help commands
    | where name =~ "kb lc"
    | where name =~ $query or usage =~ $query
    | select name usage
}

# List all LeetCode commands
export def "kb lc list" [] {
    help commands
    | where name =~ "kb lc"
    | select name usage
    | sort-by name
}

# Complexity calculator
export def "kb lc complexity calc" [n: int, complexity: string] {
    let operations = match $complexity {
        "O(1)" => 1
        "O(log n)" => ($n | math log 2 | math ceil)
        "O(n)" => $n
        "O(n log n)" => ($n * ($n | math log 2 | math ceil))
        "O(n²)" => ($n * $n)
        "O(2ⁿ)" => (2 ** $n)
        _ => 0
    }

    {
        input_size: $n
        complexity: $complexity
        operations: $operations
        feasible: ($operations < 100000000)
    }
}

# Main help
export def "kb lc" [] {
    print "KB LeetCode - Coding patterns and templates

Patterns Overview:
  kb lc patterns                    All common patterns
  kb lc complexity                  Big-O reference
  kb lc complexity compare          Complexity guidelines

Tree Problems:
  kb lc tree dfs [--lang python]    DFS template
  kb lc tree bfs [--lang python]    BFS template
  kb lc tree patterns               Tree problem types

Graph Problems:
  kb lc graph dfs [--lang python]   Graph DFS
  kb lc graph bfs [--lang python]   Graph BFS

Dynamic Programming:
  kb lc dp patterns                 DP pattern overview
  kb lc dp template <type>          Generate DP template
                                    Types: fibonacci, knapsack, lcs

Two Pointers / Sliding Window:
  kb lc two-pointers                Two pointers patterns
  kb lc sliding-window              Sliding window template

Binary Search:
  kb lc binary-search               Binary search patterns
  kb lc binary-search template      BS templates

Backtracking:
  kb lc backtracking                Backtracking patterns
  kb lc backtracking template <type>
                                    Types: combinations, permutations, subsets

Utilities:
  kb lc search <query>              Search commands
  kb lc list                        List all commands
  kb lc recommend <description>     Pattern recommendation
  kb lc complexity calc <n> <type>  Calculate operations

Examples:
  kb lc tree dfs --lang python      # Python DFS template
  kb lc dp template fibonacci       # Fibonacci DP
  kb lc recommend 'sorted array'    # Get pattern suggestions
  kb lc complexity calc 1000 'O(n²)' # Check if feasible

Pipeline Examples:
  kb lc patterns | where difficulty == 'Medium'
  kb lc complexity | where notation =~ 'O(n'
"
}
