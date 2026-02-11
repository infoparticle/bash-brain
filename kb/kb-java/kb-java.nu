# ──────────────────────────────────────────────────────────
# Nu-Brain: Java Fundamentals (kb java)
# Muscle-memory patterns for core Java operations
# ──────────────────────────────────────────────────────────

# ─── Overview ─────────────────────────────────────────────

# Show all java subcommands
export def "kb java" [] {
    print "── kb java ──────────────────────────────────────"
    print ""
    print "  kb java arrays          Array creation & ops"
    print "  kb java lists           ArrayList operations"
    print "  kb java maps            HashMap operations"
    print "  kb java sets            HashSet operations"
    print "  kb java strings         String & StringBuilder"
    print "  kb java streams         Stream API patterns"
    print "  kb java convert         Type conversions"
    print "  kb java threads         Threading basics"
    print "  kb java io              File I/O patterns"
    print "  kb java sort            Sorting patterns"
    print "  kb java random          Random number gen"
    print "  kb java imports         Common import groups"
    print "  kb java snippet <topic> Copyable code blocks"
    print ""
}

# ─── Arrays ───────────────────────────────────────────────

# Primitive and Object array operations
export def "kb java arrays" [] {
    {
        creation: [
            {pattern: "int[] a = new int[5]"
             note: "fixed size, default 0"}
            {pattern: "int[] a = {1, 2, 3, 4, 5}"
             note: "literal init"}
            {pattern: "Integer[] a = new Integer[5]"
             note: "wrapper type, default null"}
            {pattern: "int[][] m = new int[3][4]"
             note: "2D array: 3 rows × 4 cols"}
            {pattern: "int[][] m = {{1,2},{3,4}}"
             note: "2D literal init"}
        ]
        access: [
            {op: "read"
             code: "a[i]"
             time: "O(1)"}
            {op: "write"
             code: "a[i] = val"
             time: "O(1)"}
            {op: "length"
             code: "a.length"
             time: "O(1)"}
            {op: "2D row len"
             code: "m.length"
             time: "O(1)"}
            {op: "2D col len"
             code: "m[0].length"
             time: "O(1)"}
        ]
        utilities: [
            {op: "fill"
             code: "Arrays.fill(a, 0)"
             time: "O(n)"}
            {op: "sort"
             code: "Arrays.sort(a)"
             time: "O(n log n)"}
            {op: "sort range"
             code: "Arrays.sort(a, from, to)"
             time: "O(k log k)"}
            {op: "binary search"
             code: "Arrays.binarySearch(a, key)"
             time: "O(log n)"}
            {op: "copy"
             code: "Arrays.copyOf(a, newLen)"
             time: "O(n)"}
            {op: "copy range"
             code: "Arrays.copyOfRange(a, from, to)"
             time: "O(k)"}
            {op: "equals"
             code: "Arrays.equals(a, b)"
             time: "O(n)"}
            {op: "to string"
             code: "Arrays.toString(a)"
             time: "O(n)"}
            {op: "2D to string"
             code: "Arrays.deepToString(m)"
             time: "O(n×m)"}
            {op: "arraycopy"
             code: "System.arraycopy(src, sPos, dst, dPos, len)"
             time: "O(n)"}
        ]
        gotchas: [
            "Arrays.sort(int[]) → quicksort (not stable)"
            "Arrays.sort(Object[]) → mergesort (stable)"
            "binarySearch requires sorted array"
            "copyOf pads with 0/null if newLen > old"
            "int[] cannot be cast to Integer[]"
        ]
    }
}

# ─── Lists (ArrayList) ───────────────────────────────────

# ArrayList and LinkedList operations
export def "kb java lists" [] {
    {
        creation: [
            {pattern: "List<Integer> l = new ArrayList<>()"
             note: "empty, default cap 10"}
            {pattern: "List<Integer> l = new ArrayList<>(100)"
             note: "pre-sized capacity"}
            {pattern: "List<Integer> l = new ArrayList<>(Arrays.asList(1,2,3))"
             note: "from varargs"}
            {pattern: "List<Integer> l = List.of(1, 2, 3)"
             note: "immutable (Java 9+)"}
            {pattern: "List<Integer> l = Collections.nCopies(5, 0)"
             note: "5 zeros, immutable"}
        ]
        operations: [
            {op: "append"
             code: "l.add(val)"
             time: "O(1) amortized"}
            {op: "insert at i"
             code: "l.add(i, val)"
             time: "O(n)"}
            {op: "get"
             code: "l.get(i)"
             time: "O(1)"}
            {op: "set"
             code: "l.set(i, val)"
             time: "O(1)"}
            {op: "remove by idx"
             code: "l.remove(i)"
             time: "O(n)"}
            {op: "remove by val"
             code: "l.remove(Integer.valueOf(val))"
             time: "O(n)"}
            {op: "size"
             code: "l.size()"
             time: "O(1)"}
            {op: "contains"
             code: "l.contains(val)"
             time: "O(n)"}
            {op: "indexOf"
             code: "l.indexOf(val)"
             time: "O(n)"}
            {op: "subList"
             code: "l.subList(from, to)"
             time: "O(1) view"}
            {op: "clear"
             code: "l.clear()"
             time: "O(n)"}
            {op: "sort"
             code: "l.sort(Comparator.naturalOrder())"
             time: "O(n log n)"}
            {op: "reverse"
             code: "Collections.reverse(l)"
             time: "O(n)"}
            {op: "shuffle"
             code: "Collections.shuffle(l)"
             time: "O(n)"}
            {op: "addAll"
             code: "l.addAll(otherList)"
             time: "O(m)"}
        ]
        iteration: [
            {style: "for-each"
             code: "for (int x : l) { ... }"}
            {style: "index"
             code: "for (int i = 0; i < l.size(); i++) { l.get(i); }"}
            {style: "iterator"
             code: "Iterator<Integer> it = l.iterator(); while(it.hasNext()) it.next();"}
            {style: "stream"
             code: "l.stream().forEach(x -> ...)"}
            {style: "listIterator"
             code: "ListIterator<Integer> li = l.listIterator(); // bidirectional"}
        ]
        gotchas: [
            "l.remove(3) removes INDEX 3, not value 3"
            "use l.remove(Integer.valueOf(3)) for value"
            "subList is a VIEW — modifying it modifies parent"
            "List.of() returns IMMUTABLE list"
            "ConcurrentModificationException if modify during for-each"
        ]
    }
}

# ─── Maps (HashMap) ──────────────────────────────────────

# HashMap, TreeMap, LinkedHashMap
export def "kb java maps" [] {
    {
        creation: [
            {pattern: "Map<String,Integer> m = new HashMap<>()"
             note: "unordered"}
            {pattern: "Map<String,Integer> m = new TreeMap<>()"
             note: "sorted by key"}
            {pattern: "Map<String,Integer> m = new LinkedHashMap<>()"
             note: "insertion order"}
            {pattern: "Map.of(\"a\",1, \"b\",2)"
             note: "immutable (Java 9+)"}
        ]
        operations: [
            {op: "put"
             code: "m.put(k, v)"
             time: "O(1)"}
            {op: "get"
             code: "m.get(k)"
             time: "O(1)"}
            {op: "getOrDefault"
             code: "m.getOrDefault(k, 0)"
             time: "O(1)"}
            {op: "containsKey"
             code: "m.containsKey(k)"
             time: "O(1)"}
            {op: "containsValue"
             code: "m.containsValue(v)"
             time: "O(n)"}
            {op: "remove"
             code: "m.remove(k)"
             time: "O(1)"}
            {op: "size"
             code: "m.size()"
             time: "O(1)"}
            {op: "putIfAbsent"
             code: "m.putIfAbsent(k, v)"
             time: "O(1)"}
            {op: "merge"
             code: "m.merge(k, 1, Integer::sum)"
             time: "O(1)  ← freq counter"}
            {op: "compute"
             code: "m.compute(k, (key,val) -> val+1)"
             time: "O(1)"}
            {op: "computeIfAbsent"
             code: "m.computeIfAbsent(k, k -> new ArrayList<>())"
             time: "O(1)  ← adjacency list"}
        ]
        iteration: [
            {style: "entrySet"
             code: "for (var e : m.entrySet()) { e.getKey(); e.getValue(); }"}
            {style: "keySet"
             code: "for (String k : m.keySet()) { m.get(k); }"}
            {style: "values"
             code: "for (int v : m.values()) { ... }"}
            {style: "forEach"
             code: "m.forEach((k, v) -> ...)"}
        ]
        patterns: [
            {name: "frequency counter"
             code: "m.merge(key, 1, Integer::sum)"}
            {name: "group by"
             code: "m.computeIfAbsent(key, k -> new ArrayList<>()).add(val)"}
            {name: "two sum map"
             code: "m.put(nums[i], i) // value → index"}
            {name: "char frequency"
             code: "for (char c : s.toCharArray()) m.merge(c, 1, Integer::sum)"}
        ]
        comparison: [
            {type: "HashMap"
             order: "none"
             get: "O(1)"
             put: "O(1)"
             notes: "fastest, general use"}
            {type: "TreeMap"
             order: "sorted"
             get: "O(log n)"
             put: "O(log n)"
             notes: "range queries, floor/ceiling"}
            {type: "LinkedHashMap"
             order: "insertion"
             get: "O(1)"
             put: "O(1)"
             notes: "LRU cache, ordered iteration"}
        ]
    }
}

# ─── Sets ─────────────────────────────────────────────────

# HashSet, TreeSet, LinkedHashSet
export def "kb java sets" [] {
    {
        creation: [
            {pattern: "Set<Integer> s = new HashSet<>()"
             note: "unordered"}
            {pattern: "Set<Integer> s = new TreeSet<>()"
             note: "sorted"}
            {pattern: "Set<Integer> s = new LinkedHashSet<>()"
             note: "insertion order"}
            {pattern: "Set.of(1, 2, 3)"
             note: "immutable (Java 9+)"}
            {pattern: "new HashSet<>(Arrays.asList(1,2,3))"
             note: "from collection"}
        ]
        operations: [
            {op: "add"
             code: "s.add(val)"
             time: "O(1)"
             returns: "bool"}
            {op: "remove"
             code: "s.remove(val)"
             time: "O(1)"
             returns: "bool"}
            {op: "contains"
             code: "s.contains(val)"
             time: "O(1)"
             returns: "bool"}
            {op: "size"
             code: "s.size()"
             time: "O(1)"
             returns: "int"}
            {op: "isEmpty"
             code: "s.isEmpty()"
             time: "O(1)"
             returns: "bool"}
            {op: "clear"
             code: "s.clear()"
             time: "O(n)"
             returns: "void"}
        ]
        set_operations: [
            {op: "union"
             code: "a.addAll(b)"
             note: "modifies a"}
            {op: "intersection"
             code: "a.retainAll(b)"
             note: "modifies a"}
            {op: "difference"
             code: "a.removeAll(b)"
             note: "modifies a"}
            {op: "is subset"
             code: "b.containsAll(a)"
             note: "a ⊆ b?"}
        ]
        patterns: [
            {name: "deduplicate"
             code: "new ArrayList<>(new HashSet<>(list))"}
            {name: "has duplicate"
             code: "set.size() != list.size()"}
            {name: "intersection count"
             code: "a.stream().filter(b::contains).count()"}
        ]
    }
}

# ─── Strings ──────────────────────────────────────────────

# String, StringBuilder, char operations
export def "kb java strings" [] {
    {
        string_ops: [
            {op: "length"
             code: "s.length()"
             time: "O(1)"}
            {op: "charAt"
             code: "s.charAt(i)"
             time: "O(1)"}
            {op: "substring"
             code: "s.substring(start, end)"
             time: "O(n)"}
            {op: "indexOf"
             code: "s.indexOf(\"sub\")"
             time: "O(n×m)"}
            {op: "contains"
             code: "s.contains(\"sub\")"
             time: "O(n×m)"}
            {op: "equals"
             code: "s.equals(other)"
             time: "O(n)"}
            {op: "compareTo"
             code: "s.compareTo(other)"
             time: "O(n)"}
            {op: "toCharArray"
             code: "s.toCharArray()"
             time: "O(n)"}
            {op: "split"
             code: "s.split(\"regex\")"
             time: "O(n)"}
            {op: "join"
             code: "String.join(\",\", list)"
             time: "O(n)"}
            {op: "trim"
             code: "s.trim()  // or s.strip() (Java 11+)"
             time: "O(n)"}
            {op: "replace"
             code: "s.replace(old, new)"
             time: "O(n)"}
            {op: "toLowerCase"
             code: "s.toLowerCase()"
             time: "O(n)"}
            {op: "startsWith"
             code: "s.startsWith(\"pre\")"
             time: "O(k)"}
            {op: "valueOf"
             code: "String.valueOf(123)"
             time: "O(k)"}
            {op: "format"
             code: "String.format(\"%s=%d\", k, v)"
             time: "O(n)"}
        ]
        char_ops: [
            {op: "is digit"
             code: "Character.isDigit(c)"}
            {op: "is letter"
             code: "Character.isLetter(c)"}
            {op: "is alphanumeric"
             code: "Character.isLetterOrDigit(c)"}
            {op: "to lower"
             code: "Character.toLowerCase(c)"}
            {op: "char → int"
             code: "c - '0'  // digit value"}
            {op: "int → char"
             code: "(char)(i + '0')"}
            {op: "a=0..25"
             code: "c - 'a'  // letter index"}
        ]
        stringbuilder: [
            {op: "create"
             code: "StringBuilder sb = new StringBuilder()"}
            {op: "append"
             code: "sb.append(\"text\")"
             time: "O(1) amortized"}
            {op: "insert"
             code: "sb.insert(i, \"text\")"
             time: "O(n)"}
            {op: "delete"
             code: "sb.delete(start, end)"
             time: "O(n)"}
            {op: "reverse"
             code: "sb.reverse()"
             time: "O(n)"}
            {op: "toString"
             code: "sb.toString()"
             time: "O(n)"}
            {op: "setCharAt"
             code: "sb.setCharAt(i, c)"
             time: "O(1)"}
        ]
        gotchas: [
            "== compares references, .equals() compares content"
            "String is IMMUTABLE — every op creates new object"
            "Use StringBuilder in loops (not + concatenation)"
            "substring() was O(1) pre-Java7, now O(n)"
            "s.split(\"\") → array of individual chars"
        ]
    }
}

# ─── Streams ──────────────────────────────────────────────

# Stream API patterns
export def "kb java streams" [] {
    {
        creation: [
            {pattern: "list.stream()"
             note: "from collection"}
            {pattern: "Arrays.stream(arr)"
             note: "from array"}
            {pattern: "Stream.of(1, 2, 3)"
             note: "from values"}
            {pattern: "IntStream.range(0, 10)"
             note: "0..9"}
            {pattern: "IntStream.rangeClosed(1, 10)"
             note: "1..10"}
            {pattern: "Stream.generate(() -> 0)"
             note: "infinite zeros"}
            {pattern: "Stream.iterate(0, n -> n+1)"
             note: "0,1,2,3..."}
        ]
        intermediate: [
            {op: "filter"
             code: ".filter(x -> x > 0)"
             note: "keep matching"}
            {op: "map"
             code: ".map(x -> x * 2)"
             note: "transform"}
            {op: "mapToInt"
             code: ".mapToInt(Integer::intValue)"
             note: "→ IntStream"}
            {op: "flatMap"
             code: ".flatMap(Collection::stream)"
             note: "flatten nested"}
            {op: "sorted"
             code: ".sorted() or .sorted(Comparator.reverseOrder())"
             note: "sort elements"}
            {op: "distinct"
             code: ".distinct()"
             note: "remove dups"}
            {op: "peek"
             code: ".peek(System.out::println)"
             note: "debug"}
            {op: "limit"
             code: ".limit(5)"
             note: "first 5"}
            {op: "skip"
             code: ".skip(3)"
             note: "skip first 3"}
        ]
        terminal: [
            {op: "collect"
             code: ".collect(Collectors.toList())"
             note: "→ List"}
            {op: "toArray"
             code: ".toArray(Integer[]::new)"
             note: "→ array"}
            {op: "forEach"
             code: ".forEach(System.out::println)"
             note: "consume"}
            {op: "reduce"
             code: ".reduce(0, Integer::sum)"
             note: "fold"}
            {op: "count"
             code: ".count()"
             note: "→ long"}
            {op: "min/max"
             code: ".min(Comparator.naturalOrder())"
             note: "→ Optional"}
            {op: "findFirst"
             code: ".findFirst()"
             note: "→ Optional"}
            {op: "anyMatch"
             code: ".anyMatch(x -> x > 0)"
             note: "→ boolean"}
            {op: "allMatch"
             code: ".allMatch(x -> x > 0)"
             note: "→ boolean"}
            {op: "sum (IntStream)"
             code: ".mapToInt(x->x).sum()"
             note: "→ int"}
        ]
        collectors: [
            {op: "toList"
             code: "Collectors.toList()"}
            {op: "toSet"
             code: "Collectors.toSet()"}
            {op: "toMap"
             code: "Collectors.toMap(k->k, v->v)"}
            {op: "joining"
             code: "Collectors.joining(\", \")"}
            {op: "groupingBy"
             code: "Collectors.groupingBy(x -> x.type())"}
            {op: "counting"
             code: "Collectors.groupingBy(x->x, Collectors.counting())"}
            {op: "partitioning"
             code: "Collectors.partitioningBy(x -> x > 0)"}
        ]
        common_patterns: [
            {name: "int[] → List<Integer>"
             code: "Arrays.stream(arr).boxed().collect(Collectors.toList())"}
            {name: "List<Integer> → int[]"
             code: "list.stream().mapToInt(Integer::intValue).toArray()"}
            {name: "filter + collect"
             code: "list.stream().filter(x->x>0).collect(Collectors.toList())"}
            {name: "map to string"
             code: "list.stream().map(String::valueOf).collect(Collectors.joining(\",\"))"}
            {name: "sum of list"
             code: "list.stream().mapToInt(Integer::intValue).sum()"}
            {name: "max of list"
             code: "list.stream().max(Comparator.naturalOrder()).orElse(0)"}
            {name: "freq map"
             code: "stream.collect(Collectors.groupingBy(x->x, Collectors.counting()))"}
            {name: "random list"
             code: "new Random().ints(10,1,100).boxed().collect(Collectors.toList())"}
        ]
    }
}

# ─── Type Conversions ────────────────────────────────────

# Conversions between types (the gotcha zone)
export def "kb java convert" [] {
    {
        array_to_list: [
            {from: "int[]"
             to: "List<Integer>"
             code: "Arrays.stream(a).boxed().collect(Collectors.toList())"
             note: "must box primitives"}
            {from: "Integer[]"
             to: "List<Integer>"
             code: "Arrays.asList(a)"
             note: "returns fixed-size list!"}
            {from: "Integer[]"
             to: "List<Integer>"
             code: "new ArrayList<>(Arrays.asList(a))"
             note: "mutable copy"}
            {from: "String[]"
             to: "List<String>"
             code: "Arrays.asList(a)"
             note: "fixed-size list"}
        ]
        list_to_array: [
            {from: "List<Integer>"
             to: "Integer[]"
             code: "list.toArray(new Integer[0])"}
            {from: "List<Integer>"
             to: "int[]"
             code: "list.stream().mapToInt(Integer::intValue).toArray()"}
            {from: "List<String>"
             to: "String[]"
             code: "list.toArray(new String[0])"}
        ]
        number_conversions: [
            {from: "String"
             to: "int"
             code: "Integer.parseInt(s)"}
            {from: "String"
             to: "Integer"
             code: "Integer.valueOf(s)"}
            {from: "int"
             to: "String"
             code: "String.valueOf(n)  // or Integer.toString(n)"}
            {from: "char"
             to: "int (digit)"
             code: "c - '0'"}
            {from: "int"
             to: "char"
             code: "(char)(n + '0')"}
            {from: "char"
             to: "String"
             code: "String.valueOf(c)"}
            {from: "int"
             to: "long"
             code: "(long) n  // implicit widening"}
            {from: "double"
             to: "int"
             code: "(int) d   // truncates!"}
        ]
        string_conversions: [
            {from: "char[]"
             to: "String"
             code: "new String(chars)"}
            {from: "String"
             to: "char[]"
             code: "s.toCharArray()"}
            {from: "int[]"
             to: "String"
             code: "Arrays.toString(a)  // \"[1, 2, 3]\""}
            {from: "List"
             to: "String"
             code: "list.toString()  // or String.join(\",\", list)"}
        ]
        gotchas: [
            "Arrays.asList(int[]) → List<int[]> NOT List<Integer>"
            "Arrays.asList() returns FIXED-SIZE list (no add/remove)"
            "Integer.parseInt vs Integer.valueOf: primitive vs object"
            "autoboxing: int↔Integer automatic but costs perf"
            "(int) 3.9 = 3 (truncation, not rounding)"
        ]
    }
}

# ─── Threads ──────────────────────────────────────────────

# Threading basics and concurrency
export def "kb java threads" [] {
    {
        creation: [
            {pattern: "new Thread(() -> { ... }).start()"
             note: "lambda runnable"}
            {pattern: "Thread t = new Thread(runnable); t.start()"
             note: "explicit"}
            {pattern: "class MyThread extends Thread { public void run() {...} }"
             note: "extend Thread"}
            {pattern: "class MyRun implements Runnable { public void run() {...} }"
             note: "implement Runnable"}
        ]
        executor_service: [
            {pattern: "ExecutorService es = Executors.newFixedThreadPool(4)"
             note: "fixed pool"}
            {pattern: "ExecutorService es = Executors.newCachedThreadPool()"
             note: "dynamic pool"}
            {pattern: "ExecutorService es = Executors.newSingleThreadExecutor()"
             note: "single thread"}
            {pattern: "es.submit(callable)  → Future<T>"
             note: "submit with return"}
            {pattern: "es.execute(runnable)"
             note: "fire and forget"}
            {pattern: "es.shutdown()"
             note: "always shutdown!"}
        ]
        synchronization: [
            {mechanism: "synchronized block"
             code: "synchronized(lockObj) { ... }"
             use: "mutual exclusion"}
            {mechanism: "synchronized method"
             code: "public synchronized void m() { ... }"
             use: "instance-level lock"}
            {mechanism: "volatile"
             code: "volatile boolean flag"
             use: "visibility guarantee"}
            {mechanism: "AtomicInteger"
             code: "AtomicInteger count = new AtomicInteger(0)"
             use: "lock-free counter"}
            {mechanism: "ReentrantLock"
             code: "Lock l = new ReentrantLock(); l.lock(); try{...} finally{l.unlock();}"
             use: "explicit lock control"}
        ]
        concurrent_collections: [
            {type: "ConcurrentHashMap"
             replaces: "HashMap"
             note: "thread-safe, no full lock"}
            {type: "CopyOnWriteArrayList"
             replaces: "ArrayList"
             note: "read-heavy, write-rare"}
            {type: "BlockingQueue"
             replaces: "Queue"
             note: "producer-consumer"}
            {type: "ConcurrentLinkedQueue"
             replaces: "Queue"
             note: "non-blocking queue"}
        ]
        patterns: [
            {name: "producer-consumer"
             code: "BlockingQueue<T> q; q.put(item); q.take()"}
            {name: "future result"
             code: "Future<T> f = es.submit(callable); T result = f.get()"}
            {name: "completable future"
             code: "CompletableFuture.supplyAsync(() -> compute()).thenApply(r -> transform(r))"}
            {name: "countdown latch"
             code: "CountDownLatch l = new CountDownLatch(n); l.countDown(); l.await()"}
        ]
        gotchas: [
            "always shutdown ExecutorService (use try-finally)"
            "synchronized on 'this' vs dedicated lock object"
            "volatile ≠ atomic: volatile int++ is NOT thread-safe"
            "deadlock: never nest locks in different order"
            "prefer Executors over raw Thread creation"
        ]
    }
}

# ─── File I/O ─────────────────────────────────────────────

# Common I/O patterns
export def "kb java io" [] {
    {
        reading: [
            {pattern: "Files.readString(Path.of(\"file.txt\"))"
             note: "entire file → String (Java 11+)"}
            {pattern: "Files.readAllLines(Path.of(\"file.txt\"))"
             note: "→ List<String>"}
            {pattern: "Files.lines(Path.of(\"file.txt\"))"
             note: "→ Stream<String> (lazy)"}
            {pattern: "new BufferedReader(new FileReader(\"file.txt\"))"
             note: "classic buffered read"}
            {pattern: "new Scanner(new File(\"file.txt\"))"
             note: "tokenized reading"}
        ]
        writing: [
            {pattern: "Files.writeString(path, content)"
             note: "write string (Java 11+)"}
            {pattern: "Files.write(path, lines)"
             note: "write List<String>"}
            {pattern: "new PrintWriter(new FileWriter(\"f.txt\"))"
             note: "classic write"}
            {pattern: "new BufferedWriter(new FileWriter(\"f.txt\", true))"
             note: "append mode"}
        ]
        path_ops: [
            {op: "create path"
             code: "Path p = Path.of(\"dir\", \"file.txt\")"}
            {op: "exists"
             code: "Files.exists(p)"}
            {op: "create dir"
             code: "Files.createDirectories(p)"}
            {op: "delete"
             code: "Files.deleteIfExists(p)"}
            {op: "list dir"
             code: "Files.list(dir).forEach(...)"}
            {op: "walk tree"
             code: "Files.walk(dir).filter(Files::isRegularFile)"}
        ]
        gotchas: [
            "always use try-with-resources for AutoCloseable"
            "Files.readString loads ENTIRE file into memory"
            "Files.lines() must be closed (use try-with-resources)"
            "Prefer java.nio.file over java.io.File"
        ]
    }
}

# ─── Sorting ──────────────────────────────────────────────

# Sorting and comparator patterns
export def "kb java sort" [] {
    {
        basic: [
            {op: "sort array"
             code: "Arrays.sort(arr)"}
            {op: "sort list"
             code: "Collections.sort(list)"}
            {op: "sort reverse"
             code: "Arrays.sort(arr, Collections.reverseOrder())"}
            {op: "sort list reverse"
             code: "list.sort(Comparator.reverseOrder())"}
        ]
        comparators: [
            {pattern: "Comparator.comparingInt(x -> x.field)"
             note: "by int field"}
            {pattern: "Comparator.comparing(X::getName)"
             note: "by method ref"}
            {pattern: "Comparator.comparing(X::getA).thenComparing(X::getB)"
             note: "multi-key"}
            {pattern: "(a, b) -> a.val - b.val"
             note: "lambda ascending"}
            {pattern: "(a, b) -> b.val - a.val"
             note: "lambda descending"}
            {pattern: "Comparator.comparingInt(X::getVal).reversed()"
             note: "reversed"}
        ]
        priority_queue: [
            {pattern: "PriorityQueue<Integer> pq = new PriorityQueue<>()"
             note: "min-heap"}
            {pattern: "new PriorityQueue<>(Collections.reverseOrder())"
             note: "max-heap"}
            {pattern: "new PriorityQueue<>((a,b) -> a.dist - b.dist)"
             note: "custom comparator"}
            {pattern: "pq.offer(val); pq.poll(); pq.peek()"
             note: "add, remove-min, view-min"}
        ]
        gotchas: [
            "(a,b)->a-b can overflow for large ints, use Integer.compare(a,b)"
            "Arrays.sort(int[]) uses dual-pivot quicksort (not stable)"
            "Arrays.sort(Object[]) uses TimSort (stable)"
            "PriorityQueue is NOT sorted iteration — only poll() is ordered"
        ]
    }
}

# ─── Random ───────────────────────────────────────────────

# Random number generation patterns
export def "kb java random" [] {
    {
        patterns: [
            {pattern: "new Random().nextInt(100)"
             note: "0..99"}
            {pattern: "new Random().nextInt(max - min) + min"
             note: "min..max-1"}
            {pattern: "ThreadLocalRandom.current().nextInt(1, 101)"
             note: "1..100 (thread-safe)"}
            {pattern: "new Random().ints(10, 1, 100).boxed().collect(Collectors.toList())"
             note: "10 random ints in [1,100) → List"}
            {pattern: "new Random().nextDouble()"
             note: "0.0..1.0"}
            {pattern: "Math.random()"
             note: "0.0..1.0 (simple)"}
            {pattern: "Collections.shuffle(list)"
             note: "random permutation"}
            {pattern: "Collections.shuffle(list, new Random(42))"
             note: "reproducible shuffle"}
        ]
    }
}

# ─── Imports ──────────────────────────────────────────────

# Common import groupings for quick copy
export def "kb java imports" [] {
    {
        collections: [
            "import java.util.*;"
            "import java.util.stream.*;"
            "import java.util.function.*;"
        ]
        io: [
            "import java.io.*;"
            "import java.nio.file.*;"
        ]
        concurrency: [
            "import java.util.concurrent.*;"
            "import java.util.concurrent.atomic.*;"
            "import java.util.concurrent.locks.*;"
        ]
        leetcode_template: [
            "import java.util.*;"
            "import java.util.stream.*;"
        ]
        full_practice: [
            "import java.util.*;"
            "import java.util.stream.*;"
            "import java.util.function.*;"
            "import java.time.*;"
        ]
    }
}

# ─── Snippets ─────────────────────────────────────────────

# Copyable practice code blocks
export def "kb java snippet" [topic: string] {
    let snippets = {
        array_basics: "import java.util.*;
public class Prac {
    static void p(int[] a) { System.out.println(Arrays.toString(a)); }
    static void p(String m, int[] a) { System.out.print(m + \": \"); p(a); }
    public static void main(String[] args) {
        int[] a = {5, 3, 1, 4, 2};
        p(\"original\", a);
        Arrays.sort(a);
        p(\"sorted\", a);
        int idx = Arrays.binarySearch(a, 3);
        System.out.println(\"found 3 at: \" + idx);
        int[] copy = Arrays.copyOf(a, a.length);
        Arrays.fill(copy, 0);
        p(\"filled\", copy);
    }
}"
        list_basics: "import java.util.*;
import java.util.stream.*;
public class Prac {
    public static void main(String[] args) {
        List<Integer> list = new ArrayList<>(Arrays.asList(5,3,1,4,2));
        System.out.println(\"list: \" + list);
        list.add(6);
        list.add(0, 0);
        list.remove(Integer.valueOf(3));
        list.sort(Comparator.naturalOrder());
        System.out.println(\"sorted: \" + list);
        Collections.reverse(list);
        System.out.println(\"reversed: \" + list);
    }
}"
        map_basics: "import java.util.*;
public class Prac {
    public static void main(String[] args) {
        Map<String, Integer> freq = new HashMap<>();
        String[] words = {\"apple\",\"banana\",\"apple\",\"cherry\",\"banana\",\"apple\"};
        for (String w : words) freq.merge(w, 1, Integer::sum);
        System.out.println(\"freq: \" + freq);
        freq.forEach((k, v) -> System.out.println(k + \" → \" + v));
        System.out.println(\"apple count: \" + freq.getOrDefault(\"apple\", 0));
    }
}"
        stream_basics: "import java.util.*;
import java.util.stream.*;
public class Prac {
    public static void main(String[] args) {
        int[] arr = {1, 2, 3, 4, 5};
        List<Integer> list = Arrays.stream(arr).boxed().collect(Collectors.toList());
        System.out.println(\"list: \" + list);
        int sum = list.stream().mapToInt(Integer::intValue).sum();
        System.out.println(\"sum: \" + sum);
        List<Integer> evens = list.stream().filter(x -> x % 2 == 0).collect(Collectors.toList());
        System.out.println(\"evens: \" + evens);
        String joined = list.stream().map(String::valueOf).collect(Collectors.joining(\", \"));
        System.out.println(\"joined: \" + joined);
        Random rand = new Random();
        List<Integer> randoms = rand.ints(10, 1, 100).boxed().collect(Collectors.toList());
        System.out.println(\"randoms: \" + randoms);
    }
}"
        thread_basics: "import java.util.concurrent.*;
public class Prac {
    public static void main(String[] args) throws Exception {
        ExecutorService es = Executors.newFixedThreadPool(3);
        for (int i = 0; i < 5; i++) {
            final int id = i;
            es.submit(() -> {
                System.out.println(\"Task \" + id + \" on \" + Thread.currentThread().getName());
            });
        }
        Future<Integer> f = es.submit(() -> { Thread.sleep(100); return 42; });
        System.out.println(\"Future result: \" + f.get());
        es.shutdown();
        es.awaitTermination(5, TimeUnit.SECONDS);
    }
}"
    }

    let result = ($snippets | get -i $topic)
    if ($result | is-empty) {
        let keys = ($snippets | columns | str join ", ")
        print $"Unknown snippet: ($topic)"
        print $"Available: ($keys)"
    } else {
        print $result
    }
}
