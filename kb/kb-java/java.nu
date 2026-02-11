# ────────────────────────────────────────────────────────
# Nu-Brain: Java Fundamentals (kb java)
# Max 3 cols — fits 80 char terminal
# ────────────────────────────────────────────────────────

# ─── Overview ──────────────────────────────────────────

# Show all java subcommands
export def "kb java" [] {
    print $"
── kb java ─────────────────────────────────────────
  kb java arrays            Array creation & ops
  kb java lists             ArrayList operations
  kb java maps              HashMap operations
  kb java sets              HashSet operations
  kb java strings           String & StringBuilder
  kb java streams           Stream API patterns
  kb java convert           Type conversions
  kb java threads           Threading basics
  kb java io                File I/O patterns
  kb java sort              Sorting patterns
  kb java random            Random number gen
  kb java imports           Common import groups
  kb java snippet <topic>   Copyable code blocks
  kb java concept           Interview concepts \(28\)
  kb java concept <topic>   Deep-dive a concept
────────────────────────────────────────────────────"
}

# ─── Arrays ────────────────────────────────────────────

# Primitive and Object array operations
export def "kb java arrays" [] {
    print "─── Creation ───────────────────────────────────"
    print [
        [what                     code];
        ["fixed size"             "int[] a = new int[5]"]
        ["literal"                "int[] a = {1, 2, 3, 4, 5}"]
        ["wrapper"                "Integer[] a = new Integer[5]"]
        ["2D array"               "int[][] m = new int[3][4]"]
        ["2D literal"             "int[][] m = {{1,2},{3,4}}"]
    ]

    print "─── Access ─────────────────────────────────────"
    print [
        [op             code              time];
        ["read"         "a[i]"            "O(1)"]
        ["write"        "a[i] = val"      "O(1)"]
        ["length"       "a.length"        "O(1)"]
        ["2D rows"      "m.length"        "O(1)"]
        ["2D cols"      "m[0].length"     "O(1)"]
    ]

    print "─── Utilities ──────────────────────────────────"
    print [
        [op              code                            time];
        ["fill"          "Arrays.fill(a, 0)"             "O(n)"]
        ["sort"          "Arrays.sort(a)"                "O(nlogn)"]
        ["sort range"    "Arrays.sort(a, from, to)"      "O(klogk)"]
        ["bsearch"       "Arrays.binarySearch(a, key)"   "O(logn)"]
        ["copy"          "Arrays.copyOf(a, newLen)"      "O(n)"]
        ["copy range"    "Arrays.copyOfRange(a, fr, to)" "O(k)"]
        ["equals"        "Arrays.equals(a, b)"           "O(n)"]
        ["toString"      "Arrays.toString(a)"            "O(n)"]
        ["deep str"      "Arrays.deepToString(m)"        "O(n*m)"]
    ]

    print $"─── Gotchas ────────────────────────────────────
  • sort\(int[]\) = quicksort \(unstable\)
  • sort\(Object[]\) = mergesort \(stable\)
  • binarySearch needs sorted array
  • copyOf pads 0/null if newLen > old
  • int[] cannot cast to Integer[]
────────────────────────────────────────────────────"
}

# ─── Lists (ArrayList) ────────────────────────────────

# ArrayList and LinkedList operations
export def "kb java lists" [] {
    print "─── Creation ───────────────────────────────────"
    print $"
  new ArrayList<>\(\)                     empty, cap 10
  new ArrayList<>\(100\)                  pre-sized
  new ArrayList<>\(Arrays.asList\(1,2,3\)\)  from varargs
  List.of\(1, 2, 3\)                      immutable \(9+\)
  Collections.nCopies\(5, 0\)             5 zeros, immut
────────────────────────────────────────────────────"

    print "─── Operations ─────────────────────────────────"
    print [
        [op              code                             time];
        ["append"        "l.add(val)"                     "O(1)*"]
        ["insert"        "l.add(i, val)"                  "O(n)"]
        ["get"           "l.get(i)"                       "O(1)"]
        ["set"           "l.set(i, val)"                  "O(1)"]
        ["rm by idx"     "l.remove(i)"                    "O(n)"]
        ["rm by val"     "l.remove(Integer.valueOf(v))"   "O(n)"]
        ["size"          "l.size()"                       "O(1)"]
        ["contains"      "l.contains(val)"                "O(n)"]
        ["indexOf"       "l.indexOf(val)"                 "O(n)"]
        ["subList"       "l.subList(from, to)"            "O(1)"]
        ["sort"          "l.sort(Comparator.natural..())" "O(nlogn)"]
        ["reverse"       "Collections.reverse(l)"         "O(n)"]
        ["shuffle"       "Collections.shuffle(l)"         "O(n)"]
        ["addAll"        "l.addAll(otherList)"            "O(m)"]
    ]

    print "─── Iteration ──────────────────────────────────"
    print $"
  for \(int x : l\) \{ ... \}                  for-each
  for \(int i=0; i<l.size\(\); i++\)           index
  Iterator<Integer> it = l.iterator\(\);     iterator
  l.stream\(\).forEach\(x -> ...\)              stream
────────────────────────────────────────────────────"

    print $"─── Gotchas ────────────────────────────────────
  • l.remove\(3\) removes INDEX 3, not value 3
  • use l.remove\(Integer.valueOf\(3\)\) for value
  • subList is a VIEW — modifying it modifies parent
  • List.of\(\) returns IMMUTABLE list
  • ConcurrentModificationException in for-each
────────────────────────────────────────────────────"
}

# ─── Maps ──────────────────────────────────────────────

# HashMap, TreeMap, LinkedHashMap
export def "kb java maps" [] {
    print "─── Creation ───────────────────────────────────"
    print $"
  new HashMap<>\(\)          unordered
  new TreeMap<>\(\)          sorted by key
  new LinkedHashMap<>\(\)    insertion order
  Map.of\(\"a\",1, \"b\",2\)    immutable \(9+\)
────────────────────────────────────────────────────"

    print "─── Operations ─────────────────────────────────"
    print [
        [op               code                              time];
        ["put"            "m.put(k, v)"                     "O(1)"]
        ["get"            "m.get(k)"                        "O(1)"]
        ["getOrDefault"   "m.getOrDefault(k, 0)"            "O(1)"]
        ["containsKey"    "m.containsKey(k)"                "O(1)"]
        ["containsVal"    "m.containsValue(v)"              "O(n)"]
        ["remove"         "m.remove(k)"                     "O(1)"]
        ["size"           "m.size()"                        "O(1)"]
        ["putIfAbsent"    "m.putIfAbsent(k, v)"             "O(1)"]
    ]

    print "─── Power Methods ──────────────────────────────"
    print [
        [op              code];
        ["freq counter"  "m.merge(k, 1, Integer::sum)"]
        ["compute"       "m.compute(k, (key,v) -> v+1)"]
        ["adj list"      "m.computeIfAbsent(k, k->new ArrayList<>())"]
        ["two sum"       "m.put(nums[i], i)  // val→idx"]
        ["char freq"     "for(char c:s.toCharArray()) m.merge(c,1,Integer::sum)"]
    ]

    print "─── Iteration ──────────────────────────────────"
    print $"
  for \(var e : m.entrySet\(\)\) \{ e.getKey\(\); e.getValue\(\); \}
  for \(String k : m.keySet\(\)\) \{ m.get\(k\); \}
  for \(int v : m.values\(\)\) \{ ... \}
  m.forEach\(\(k, v\) -> ...\)
────────────────────────────────────────────────────"

    print "─── HashMap vs TreeMap vs LinkedHashMap ────────"
    print [
        [type             order         time];
        ["HashMap"        "none"        "O(1)  general use"]
        ["TreeMap"        "sorted"      "O(logn) range queries"]
        ["LinkedHashMap"  "insertion"   "O(1)  LRU cache"]
    ]
}

# ─── Sets ──────────────────────────────────────────────

# HashSet, TreeSet, LinkedHashSet
export def "kb java sets" [] {
    print "─── Creation ───────────────────────────────────"
    print $"
  new HashSet<>\(\)                        unordered
  new TreeSet<>\(\)                        sorted
  new LinkedHashSet<>\(\)                  insertion order
  Set.of\(1, 2, 3\)                        immutable \(9+\)
  new HashSet<>\(Arrays.asList\(1,2,3\)\)    from collection
────────────────────────────────────────────────────"

    print "─── Operations ─────────────────────────────────"
    print [
        [op          code                time];
        ["add"       "s.add(val)"        "O(1) → bool"]
        ["remove"    "s.remove(val)"     "O(1) → bool"]
        ["contains"  "s.contains(val)"   "O(1) → bool"]
        ["size"      "s.size()"          "O(1)"]
        ["isEmpty"   "s.isEmpty()"       "O(1)"]
        ["clear"     "s.clear()"         "O(n)"]
    ]

    print "─── Set Math ───────────────────────────────────"
    print [
        [op              code                 note];
        ["union"         "a.addAll(b)"        "modifies a"]
        ["intersection"  "a.retainAll(b)"     "modifies a"]
        ["difference"    "a.removeAll(b)"     "modifies a"]
        ["is subset"     "b.containsAll(a)"   "a ⊆ b?"]
    ]

    print "─── Patterns ───────────────────────────────────"
    print $"
  dedup:  new ArrayList<>\(new HashSet<>\(list\)\)
  hasDup: set.size\(\) != list.size\(\)
  count:  a.stream\(\).filter\(b::contains\).count\(\)
────────────────────────────────────────────────────"
}

# ─── Strings ──────────────────────────────────────────

# String, StringBuilder, char operations
export def "kb java strings" [] {
    print "─── String Ops ─────────────────────────────────"
    print [
        [op            code                         time];
        ["length"      "s.length()"                 "O(1)"]
        ["charAt"      "s.charAt(i)"                "O(1)"]
        ["substring"   "s.substring(start, end)"    "O(n)"]
        ["indexOf"     "s.indexOf(\"sub\")"           "O(nm)"]
        ["contains"    "s.contains(\"sub\")"          "O(nm)"]
        ["equals"      "s.equals(other)"            "O(n)"]
        ["compareTo"   "s.compareTo(other)"         "O(n)"]
        ["toCharArr"   "s.toCharArray()"            "O(n)"]
        ["split"       "s.split(\"regex\")"           "O(n)"]
        ["join"        "String.join(\",\", list)"    "O(n)"]
        ["trim"        "s.trim()  // strip() 11+"   "O(n)"]
        ["replace"     "s.replace(old, new)"        "O(n)"]
        ["toLower"     "s.toLowerCase()"            "O(n)"]
        ["startsWith"  "s.startsWith(\"pre\")"        "O(k)"]
        ["valueOf"     "String.valueOf(123)"        "O(k)"]
    ]

    print "─── Char Ops ───────────────────────────────────"
    print [
        [op                code];
        ["is digit"        "Character.isDigit(c)"]
        ["is letter"       "Character.isLetter(c)"]
        ["is alnum"        "Character.isLetterOrDigit(c)"]
        ["to lower"        "Character.toLowerCase(c)"]
        ["char → int"      "c - '0'   // digit value"]
        ["int → char"      "(char)(i + '0')"]
        ["letter idx"      "c - 'a'   // 0..25"]
    ]

    print "─── StringBuilder ──────────────────────────────"
    print [
        [op           code                     time];
        ["create"     "new StringBuilder()"    ""]
        ["append"     "sb.append(\"text\")"      "O(1)*"]
        ["insert"     "sb.insert(i, \"text\")"   "O(n)"]
        ["delete"     "sb.delete(start, end)"  "O(n)"]
        ["reverse"    "sb.reverse()"           "O(n)"]
        ["toString"   "sb.toString()"          "O(n)"]
        ["setCharAt"  "sb.setCharAt(i, c)"     "O(1)"]
    ]

    print $"─── Gotchas ────────────────────────────────────
  • == compares REFERENCES, .equals\(\) compares CONTENT
  • String is IMMUTABLE — every op creates new object
  • Use StringBuilder in loops \(not + concat\)
  • substring\(\) is O\(n\) since Java 7 \(was O\(1\)\)
  • s.split\(\"\"\) → array of individual chars
────────────────────────────────────────────────────"
}

# ─── Streams ──────────────────────────────────────────

# Stream API patterns
export def "kb java streams" [] {
    print "─── Creation ───────────────────────────────────"
    print [
        [code                              note];
        ["list.stream()"                   "from collection"]
        ["Arrays.stream(arr)"              "from array"]
        ["Stream.of(1, 2, 3)"             "from values"]
        ["IntStream.range(0, 10)"          "0..9"]
        ["IntStream.rangeClosed(1, 10)"    "1..10"]
        ["Stream.generate(() -> 0)"        "infinite"]
        ["Stream.iterate(0, n -> n+1)"     "0,1,2..."]
    ]

    print "─── Intermediate (lazy) ────────────────────────"
    print [
        [op          code];
        ["filter"    ".filter(x -> x > 0)"]
        ["map"       ".map(x -> x * 2)"]
        ["mapToInt"  ".mapToInt(Integer::intValue)"]
        ["flatMap"   ".flatMap(Collection::stream)"]
        ["sorted"    ".sorted(Comparator.reverseOrder())"]
        ["distinct"  ".distinct()"]
        ["peek"      ".peek(System.out::println)"]
        ["limit"     ".limit(5)"]
        ["skip"      ".skip(3)"]
    ]

    print "─── Terminal ───────────────────────────────────"
    print [
        [op           code                              ret];
        ["collect"    ".collect(Collectors.toList())"    "List"]
        ["toArray"    ".toArray(Integer[]::new)"         "T[]"]
        ["forEach"    ".forEach(System.out::println)"    "void"]
        ["reduce"     ".reduce(0, Integer::sum)"         "T"]
        ["count"      ".count()"                         "long"]
        ["min/max"    ".min(Comparator.naturalOrder())"  "Opt"]
        ["findFirst"  ".findFirst()"                     "Opt"]
        ["anyMatch"   ".anyMatch(x -> x > 0)"            "bool"]
        ["sum"        ".mapToInt(x->x).sum()"            "int"]
    ]

    print "─── Collectors ─────────────────────────────────"
    print [
        [op             code];
        ["toList"       "Collectors.toList()"]
        ["toSet"        "Collectors.toSet()"]
        ["toMap"        "Collectors.toMap(k->k, v->v)"]
        ["joining"      "Collectors.joining(\", \")"]
        ["groupingBy"   "Collectors.groupingBy(x -> x.type())"]
        ["counting"     "Collectors.groupingBy(x->x, counting())"]
        ["partition"    "Collectors.partitioningBy(x -> x>0)"]
    ]

    print "─── Common Recipes ─────────────────────────────"
    print $"
  int[] → List:
    Arrays.stream\(arr\).boxed\(\).collect\(toList\(\)\)

  List → int[]:
    list.stream\(\).mapToInt\(Integer::intValue\).toArray\(\)

  filter + collect:
    list.stream\(\).filter\(x->x>0\).collect\(toList\(\)\)

  join as string:
    list.stream\(\).map\(String::valueOf\)
        .collect\(joining\(\",\"\)\)

  sum:
    list.stream\(\).mapToInt\(Integer::intValue\).sum\(\)

  freq map:
    stream.collect\(groupingBy\(x->x, counting\(\)\)\)

  random list:
    new Random\(\).ints\(10,1,100\).boxed\(\)
        .collect\(toList\(\)\)
────────────────────────────────────────────────────"
}

# ─── Type Conversions ────────────────────────────────

# The gotcha zone
export def "kb java convert" [] {
    print "─── Array ↔ List ────────────────────────────────"
    print [
        [conversion          code];
        ["int[]→List<Int>"   "Arrays.stream(a).boxed().collect(toList())"]
        ["Integer[]→List"    "Arrays.asList(a)  // FIXED-SIZE!"]
        ["Integer[]→List"    "new ArrayList<>(Arrays.asList(a))"]
        ["List→Integer[]"    "list.toArray(new Integer[0])"]
        ["List→int[]"        "list.stream().mapToInt(x->x).toArray()"]
        ["List→String[]"     "list.toArray(new String[0])"]
    ]

    print "─── Number Conversions ─────────────────────────"
    print [
        [conversion         code];
        ["String→int"       "Integer.parseInt(s)"]
        ["String→Integer"   "Integer.valueOf(s)"]
        ["int→String"       "String.valueOf(n)"]
        ["char→digit"       "c - '0'"]
        ["digit→char"       "(char)(n + '0')"]
        ["char→String"      "String.valueOf(c)"]
        ["double→int"       "(int) d   // truncates!"]
    ]

    print "─── String Conversions ─────────────────────────"
    print [
        [conversion         code];
        ["char[]→String"    "new String(chars)"]
        ["String→char[]"    "s.toCharArray()"]
        ["int[]→String"     "Arrays.toString(a)  // \"[1,2,3]\""]
        ["List→String"      "String.join(\",\", list)"]
    ]

    print $"─── Gotchas ────────────────────────────────────
  • Arrays.asList\(int[]\) → List<int[]> NOT List<Int>
  • Arrays.asList\(\) → FIXED-SIZE \(no add/remove\)
  • parseInt → primitive, valueOf → object
  • autoboxing int↔Integer costs perf
  • \(int\) 3.9 = 3 \(truncation, not rounding\)
────────────────────────────────────────────────────"
}

# ─── Threads ──────────────────────────────────────────

# Threading basics and concurrency
export def "kb java threads" [] {
    print "─── Thread Creation ────────────────────────────"
    print $"
  new Thread\(\(\) -> \{ ... \}\).start\(\)          lambda
  Thread t = new Thread\(runnable\); t.start\(\)  explicit
  class MyT extends Thread \{ void run\(\)\{\} \}  extend
  class MyR implements Runnable \{ void run\(\) \} impl
────────────────────────────────────────────────────"

    print "─── ExecutorService ────────────────────────────"
    print [
        [what               code];
        ["fixed pool"       "Executors.newFixedThreadPool(4)"]
        ["cached pool"      "Executors.newCachedThreadPool()"]
        ["single"           "Executors.newSingleThreadExecutor()"]
        ["submit"           "es.submit(callable) → Future<T>"]
        ["fire+forget"      "es.execute(runnable)"]
        ["shutdown"         "es.shutdown()  // ALWAYS!"]
    ]

    print "─── Synchronization ────────────────────────────"
    print [
        [mechanism          code];
        ["sync block"       "synchronized(lockObj) { ... }"]
        ["sync method"      "public synchronized void m() {}"]
        ["volatile"         "volatile boolean flag"]
        ["atomic"           "AtomicInteger c = new AtomicInteger(0)"]
        ["reentrant"        "Lock l = new ReentrantLock()"]
    ]

    print "─── Concurrent Collections ─────────────────────"
    print [
        [type                    replaces     note];
        ["ConcurrentHashMap"     "HashMap"    "per-bin lock"]
        ["CopyOnWriteArrayList"  "ArrayList"  "read-heavy"]
        ["BlockingQueue"         "Queue"      "prod-consumer"]
        ["ConcurrentLinkedQueue" "Queue"      "non-blocking"]
    ]

    print $"─── Gotchas ────────────────────────────────────
  • always shutdown ExecutorService \(try-finally\)
  • volatile ≠ atomic: volatile int++ NOT safe
  • deadlock: never nest locks in different order
  • prefer Executors over raw Thread creation
────────────────────────────────────────────────────"
}

# ─── File I/O ─────────────────────────────────────────

# Common I/O patterns
export def "kb java io" [] {
    print "─── Reading ────────────────────────────────────"
    print [
        [what               code];
        ["entire file"      "Files.readString(Path.of(\"f\"))  // 11+"]
        ["all lines"        "Files.readAllLines(Path.of(\"f\"))"]
        ["lazy stream"      "Files.lines(Path.of(\"f\"))  // close!"]
        ["buffered"         "new BufferedReader(new FileReader(\"f\"))"]
        ["scanner"          "new Scanner(new File(\"f\"))"]
    ]

    print "─── Writing ────────────────────────────────────"
    print [
        [what               code];
        ["write string"     "Files.writeString(path, content)  // 11+"]
        ["write lines"      "Files.write(path, lines)"]
        ["print writer"     "new PrintWriter(new FileWriter(\"f\"))"]
        ["append"           "new BufferedWriter(new FileWriter(\"f\",true))"]
    ]

    print "─── Path Ops ───────────────────────────────────"
    print [
        [op             code];
        ["create"       "Path p = Path.of(\"dir\", \"file.txt\")"]
        ["exists"       "Files.exists(p)"]
        ["mkdir"        "Files.createDirectories(p)"]
        ["delete"       "Files.deleteIfExists(p)"]
        ["list dir"     "Files.list(dir).forEach(...)"]
        ["walk tree"    "Files.walk(dir).filter(Files::isRegularFile)"]
    ]

    print $"─── Gotchas ────────────────────────────────────
  • ALWAYS try-with-resources for AutoCloseable
  • readString loads ENTIRE file into memory
  • Files.lines\(\) MUST be closed
  • Prefer java.nio.file over java.io.File
────────────────────────────────────────────────────"
}

# ─── Sorting ──────────────────────────────────────────

# Sorting and comparator patterns
export def "kb java sort" [] {
    print "─── Basic Sort ─────────────────────────────────"
    print [
        [what               code];
        ["sort array"       "Arrays.sort(arr)"]
        ["sort list"        "Collections.sort(list)"]
        ["reverse arr"      "Arrays.sort(arr, reverseOrder())"]
        ["reverse list"     "list.sort(Comparator.reverseOrder())"]
    ]

    print "─── Comparator Patterns ────────────────────────"
    print $"
  by field:    Comparator.comparingInt\(x -> x.field\)
  by method:   Comparator.comparing\(X::getName\)
  multi-key:   comparing\(X::getA\).thenComparing\(X::getB\)
  lambda asc:  \(a, b\) -> a.val - b.val
  lambda desc: \(a, b\) -> b.val - a.val
  reversed:    comparingInt\(X::getVal\).reversed\(\)
────────────────────────────────────────────────────"

    print "─── PriorityQueue ──────────────────────────────"
    print [
        [what             code];
        ["min-heap"       "new PriorityQueue<>()"]
        ["max-heap"       "new PriorityQueue<>(reverseOrder())"]
        ["custom"         "new PriorityQueue<>((a,b)->a.d-b.d)"]
        ["ops"            "pq.offer(v); pq.poll(); pq.peek()"]
    ]

    print $"─── Gotchas ────────────────────────────────────
  • \(a,b\)->a-b OVERFLOWS! use Integer.compare\(a,b\)
  • sort\(int[]\) = dual-pivot quicksort \(unstable\)
  • sort\(Object[]\) = TimSort \(stable\)
  • PQ iteration NOT ordered — only poll\(\) is
────────────────────────────────────────────────────"
}

# ─── Random ───────────────────────────────────────────

# Random number generation
export def "kb java random" [] {
    print [
        [what                   code];
        ["0..99"                "new Random().nextInt(100)"]
        ["min..max-1"           "new Random().nextInt(max-min)+min"]
        ["1..100 safe"          "ThreadLocalRandom.current().nextInt(1,101)"]
        ["list of 10"           "new Random().ints(10,1,100).boxed()...toList()"]
        ["0.0..1.0"             "new Random().nextDouble()"]
        ["simple"               "Math.random()  // 0.0..1.0"]
        ["shuffle"              "Collections.shuffle(list)"]
        ["reproducible"         "Collections.shuffle(list, new Random(42))"]
    ]
}

# ─── Imports ──────────────────────────────────────────

# Common import groupings
export def "kb java imports" [] {
    print $"
─── Collections ────────────────────────────────────
  import java.util.*;
  import java.util.stream.*;
  import java.util.function.*;

─── I/O ────────────────────────────────────────────
  import java.io.*;
  import java.nio.file.*;

─── Concurrency ────────────────────────────────────
  import java.util.concurrent.*;
  import java.util.concurrent.atomic.*;
  import java.util.concurrent.locks.*;

─── LeetCode Template ──────────────────────────────
  import java.util.*;
  import java.util.stream.*;

─── Full Practice ──────────────────────────────────
  import java.util.*;
  import java.util.stream.*;
  import java.util.function.*;
  import java.time.*;
────────────────────────────────────────────────────"
}

# ─── Snippets ─────────────────────────────────────────

# Copyable practice code blocks
export def "kb java snippet" [topic: string] {
    let snippets = {
        array_basics: $"import java.util.*;
public class Prac \{
    static void p\(int[] a\) \{
        System.out.println\(Arrays.toString\(a\)\);
    \}
    static void p\(String m, int[] a\) \{
        System.out.print\(m + \": \"\); p\(a\);
    \}
    public static void main\(String[] args\) \{
        int[] a = \{5, 3, 1, 4, 2\};
        p\(\"original\", a\);
        Arrays.sort\(a\);
        p\(\"sorted\", a\);
        int idx = Arrays.binarySearch\(a, 3\);
        System.out.println\(\"found 3 at: \" + idx\);
        int[] copy = Arrays.copyOf\(a, a.length\);
        Arrays.fill\(copy, 0\);
        p\(\"filled\", copy\);
    \}
\}"
        list_basics: $"import java.util.*;
import java.util.stream.*;
public class Prac \{
    public static void main\(String[] args\) \{
        List<Integer> l =
            new ArrayList<>\(Arrays.asList\(5,3,1,4,2\)\);
        System.out.println\(\"list: \" + l\);
        l.add\(6\); l.add\(0, 0\);
        l.remove\(Integer.valueOf\(3\)\);
        l.sort\(Comparator.naturalOrder\(\)\);
        System.out.println\(\"sorted: \" + l\);
        Collections.reverse\(l\);
        System.out.println\(\"reversed: \" + l\);
    \}
\}"
        map_basics: $"import java.util.*;
public class Prac \{
    public static void main\(String[] args\) \{
        Map<String,Integer> freq = new HashMap<>\(\);
        String[] w = \{\"apple\",\"banana\",\"apple\",
                      \"cherry\",\"banana\",\"apple\"\};
        for \(String s : w\)
            freq.merge\(s, 1, Integer::sum\);
        System.out.println\(\"freq: \" + freq\);
        freq.forEach\(\(k,v\) ->
            System.out.println\(k + \" → \" + v\)\);
    \}
\}"
        stream_basics: $"import java.util.*;
import java.util.stream.*;
public class Prac \{
    public static void main\(String[] args\) \{
        int[] arr = \{1, 2, 3, 4, 5\};
        List<Integer> l = Arrays.stream\(arr\)
            .boxed\(\).collect\(Collectors.toList\(\)\);
        System.out.println\(\"list: \" + l\);
        int sum = l.stream\(\)
            .mapToInt\(Integer::intValue\).sum\(\);
        System.out.println\(\"sum: \" + sum\);
        List<Integer> evens = l.stream\(\)
            .filter\(x -> x % 2 == 0\)
            .collect\(Collectors.toList\(\)\);
        System.out.println\(\"evens: \" + evens\);
        List<Integer> rands = new Random\(\)
            .ints\(10,1,100\).boxed\(\)
            .collect\(Collectors.toList\(\)\);
        System.out.println\(\"randoms: \" + rands\);
    \}
\}"
        thread_basics: $"import java.util.concurrent.*;
public class Prac \{
    public static void main\(String[] args\)
            throws Exception \{
        ExecutorService es =
            Executors.newFixedThreadPool\(3\);
        for \(int i = 0; i < 5; i++\) \{
            final int id = i;
            es.submit\(\(\) -> System.out.println\(
                \"Task \"+id+\" on \"
                +Thread.currentThread\(\).getName\(\)\)\);
        \}
        Future<Integer> f = es.submit\(\(\) -> \{
            Thread.sleep\(100\); return 42;
        \}\);
        System.out.println\(\"Future: \" + f.get\(\)\);
        es.shutdown\(\);
        es.awaitTermination\(5, TimeUnit.SECONDS\);
    \}
\}"
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

# ══════════════════════════════════════════════════════
# CONCEPTS — Interview-grade Java internals
# ══════════════════════════════════════════════════════

# List all concept topics
export def "kb java concept" [] {
    print [
        [topic              area           freq];
        ["reentrant_lock"   "concurrency"  "★★★"]
        ["volatile"         "concurrency"  "★★★"]
        ["threadlocal"      "concurrency"  "★★☆"]
        ["completable"      "concurrency"  "★★★"]
        ["memory_model"     "concurrency"  "★★☆"]
        ["equals_hashcode"  "core"         "★★★"]
        ["immutability"     "core"         "★★★"]
        ["string_pool"      "core"         "★★★"]
        ["generics"         "core"         "★★★"]
        ["optional"         "core"         "★★☆"]
        ["functional"       "core"         "★★★"]
        ["comparable"       "core"         "★★☆"]
        ["fail_fast"        "collections"  "★★☆"]
        ["concurrent_map"   "collections"  "★★★"]
        ["gc"               "jvm"          "★★☆"]
        ["classloader"      "jvm"          "★★☆"]
        ["singleton"        "patterns"     "★★★"]
        ["builder"          "patterns"     "★★☆"]
        ["try_resources"    "core"         "★★☆"]
        ["sealed"           "modern"       "★★☆"]
        ["deadlock"         "concurrency"  "★★★"]
        ["exceptions"       "core"         "★★★"]
        ["autoboxing"       "core"         "★★★"]
        ["pass_by_value"    "core"         "★★★"]
        ["abstract_iface"   "core"         "★★★"]
        ["serialization"    "core"         "★★☆"]
        ["reflection"       "jvm"          "★★☆"]
        ["weak_refs"        "jvm"          "★★☆"]
    ]
}

# ─── Concurrency Concepts ────────────────────────────

# ReentrantLock — why, when, how vs synchronized
export def "kb java concept reentrant_lock" [] {
    print $"
═══ ReentrantLock ══════════════════════════════════
Explicit lock with more control than synchronized.

─── Why Over synchronized ──────────────────────────
  • tryLock\(\)          non-blocking attempt
  • tryLock\(timeout\)   bounded wait
  • lockInterruptibly\(\) respond to interrupts
  • fairness policy     FIFO ordering option
  • multiple Conditions \(vs single wait/notify\)
  • lock/unlock across different scopes

─── Reentrant = Same thread can re-acquire ─────────
  Method A\(\) locks → calls B\(\) which also locks
  Internal counter: lock\(\)→count++ unlock\(\)→count--
  Without this: self-deadlock on recursive calls
────────────────────────────────────────────────────"

    print "─── API ────────────────────────────────────────"
    print [
        [method                    behavior];
        ["lock()"                  "blocks until acquired"]
        ["unlock()"                "release — MUST be in finally"]
        ["tryLock()"               "non-blocking → boolean"]
        ["tryLock(time, unit)"     "bounded blocking"]
        ["lockInterruptibly()"     "throws if interrupted"]
        ["newCondition()"          "create Condition"]
        ["isHeldByCurrentThread()" "check ownership"]
        ["getHoldCount()"          "reentrant depth"]
    ]

    print $"
─── Correct Pattern ────────────────────────────────
  Lock l = new ReentrantLock\(\);
  l.lock\(\);
  try \{
      // critical section
  \} finally \{
      l.unlock\(\);   // ← ALWAYS in finally
  \}

─── tryLock Pattern ────────────────────────────────
  if \(l.tryLock\(1, TimeUnit.SECONDS\)\) \{
      try \{ /* work */ \}
      finally \{ l.unlock\(\); \}
  \} else \{
      // fallback — lock not acquired
  \}

─── Condition Pattern ──────────────────────────────
  Condition notEmpty = l.newCondition\(\);
  // producer: l.lock\(\); notEmpty.signal\(\); unlock\(\)
  // consumer: l.lock\(\); notEmpty.await\(\);  unlock\(\)

─── Fair vs Unfair ─────────────────────────────────
  new ReentrantLock\(\)       unfair \(default, fast\)
  new ReentrantLock\(true\)   fair \(FIFO, ~2x slower\)
────────────────────────────────────────────────────"

    print "─── vs synchronized ────────────────────────────"
    print [
        [feature         synced             reentrant];
        ["scope"         "block/method"     "any scope"]
        ["tryLock"       "no"               "yes"]
        ["timeout"       "no"               "yes"]
        ["interrupt"     "no"               "yes"]
        ["fairness"      "no"               "configurable"]
        ["conditions"    "1 (wait/notify)"  "multiple"]
        ["risk"          "auto-release"     "must finally!"]
    ]

    print $"
─── Interview Tips ─────────────────────────────────
  • Default to synchronized — simpler, auto-release
  • ReentrantLock when NEED tryLock/timeout/fair
  • Forgetting unlock\(\) in finally = deadlock
  • ReadWriteLock: multi readers, exclusive writer
  • StampedLock \(8+\) for optimistic reads
════════════════════════════════════════════════════"
}

# volatile — visibility vs atomicity
export def "kb java concept volatile" [] {
    print $"
═══ volatile ═══════════════════════════════════════
Guarantees VISIBILITY and ORDERING, NOT atomicity.

─── Guarantees ─────────────────────────────────────
  • Write → visible to ALL threads immediately
  • Happens-before: write hb subsequent read
  • Prevents instruction reordering

─── Does NOT Guarantee ─────────────────────────────
  • Atomicity: volatile int x; x++ is NOT safe
    \(x++ = read + write + store = 3 steps\)
  • Mutual exclusion — no locking

─── When to Use ────────────────────────────────────
  ✓ Boolean flags \(stop/shutdown signals\)
  ✓ One writer, many readers
  ✓ Double-checked locking \(singleton\)
  ✓ Publishing immutable objects

  ✗ Compound ops \(check-then-act\)
  ✗ Read-modify-write \(counter++\)
  ✗ Multiple vars that must stay consistent

─── Examples ───────────────────────────────────────
  Flag:
    volatile boolean running = true;
    // T1: running = false;
    // T2: while \(running\) \{...\}  ← sees it

  Broken counter:
    volatile int count = 0;
    // A: count++ \(read 5, write 6\)
    // B: count++ \(read 5, write 6\) ← LOST UPDATE
    // Fix: use AtomicInteger

  DCL Singleton:
    private static volatile Singleton instance;
    if \(instance == null\) \{
        synchronized \(Singleton.class\) \{
            if \(instance == null\)
                instance = new Singleton\(\);
        \}
    \}
────────────────────────────────────────────────────"

    print "─── volatile vs Atomic vs synchronized ─────────"
    print [
        [need              use                example];
        ["visibility"      "volatile"         "boolean flag"]
        ["single atomic"   "AtomicInteger"    "counter++"]
        ["compound"        "synced/Lock"      "check-then-act"]
    ]

    print $"
─── Interview Tips ─────────────────────────────────
  • volatile = VISIBILITY, not ATOMICITY
  • Prevents reordering \(memory barrier\)
  • Without it: threads cache stale values
  • volatile long/double → atomic r/w
    \(64-bit ops normally NOT atomic on 32-bit\)
════════════════════════════════════════════════════"
}

# ThreadLocal — per-thread isolated storage
export def "kb java concept threadlocal" [] {
    print $"
═══ ThreadLocal ════════════════════════════════════
Each thread gets its own independent copy.

─── When ───────────────────────────────────────────
  • Per-thread context \(user session, txn ID\)
  • Non-thread-safe objects in pools \(SDF\)
  • Avoid passing params through deep stacks
────────────────────────────────────────────────────"

    print "─── API ────────────────────────────────────────"
    print [
        [method                              note];
        ["ThreadLocal.withInitial(()->SDF)" "create"]
        ["tl.get()"                          "thread's val"]
        ["tl.set(value)"                     "set for thread"]
        ["tl.remove()"                       "MUST in pools!"]
    ]

    print $"
─── Pattern ────────────────────────────────────────
  private static final ThreadLocal<SDF> df =
      ThreadLocal.withInitial\(\(\)
          -> new SimpleDateFormat\(\"yyyy-MM-dd\"\)\);

  // In any thread:
  String date = df.get\(\).format\(new Date\(\)\);
  // In thread pool — CRITICAL:
  try \{ use df.get\(\) \}
  finally \{ df.remove\(\); \}   // ← prevent leak!

─── Danger ─────────────────────────────────────────
  Thread pools reuse threads → values persist
  = memory leak if you don't remove\(\)

─── Interview Tips ─────────────────────────────────
  • Q: SimpleDateFormat not thread-safe, fix?
  • A: ThreadLocal, or DateTimeFormatter \(8+ immut\)
  • Memory leak in pools is THE follow-up
  • InheritableThreadLocal → passes to child threads
════════════════════════════════════════════════════"
}

# CompletableFuture — async composition
export def "kb java concept completable" [] {
    print $"
═══ CompletableFuture ══════════════════════════════
Composable async computation \(Java 8+\).
Future.get\(\) blocks — CF chains without blocking.
────────────────────────────────────────────────────"

    print "─── Creation ───────────────────────────────────"
    print [
        [code                                  note];
        ["CF.supplyAsync(() -> compute())"     "async+ret"]
        ["CF.runAsync(() -> doWork())"         "async void"]
        ["CF.completedFuture(value)"           "already done"]
    ]

    print "─── Chaining ───────────────────────────────────"
    print [
        [op                    type         note];
        ["thenApply(fn)"       "T→U"        "map"]
        ["thenApplyAsync(fn)"  "T→U"        "map (fork)"]
        ["thenAccept(c)"       "T→void"     "consume"]
        ["thenRun(r)"          "void→void"  "after done"]
        ["thenCompose(fn)"     "T→CF<U>"    "flatMap"]
    ]

    print "─── Combining ──────────────────────────────────"
    print [
        [op                        note];
        ["thenCombine(other, fn)"  "when both done"]
        ["allOf(cf1, cf2, cf3)"    "wait all → CF<Void>"]
        ["anyOf(cf1, cf2, cf3)"    "first wins"]
    ]

    print "─── Error Handling ─────────────────────────────"
    print [
        [op                             note];
        ["exceptionally(ex -> fb)"      "catch + recover"]
        ["handle((res, ex) -> ...)"     "both paths"]
        ["whenComplete((res,ex)->...)"  "side effect"]
    ]

    print $"
─── Full Pattern ───────────────────────────────────
  CompletableFuture
    .supplyAsync\(\(\) -> fetchFromDB\(\)\)
    .thenApply\(data -> transform\(data\)\)
    .thenCombine\(
        CF.supplyAsync\(\(\) -> fetchFromAPI\(\)\),
        \(db, api\) -> merge\(db, api\)
    \)
    .exceptionally\(ex -> fallback\)
    .thenAccept\(result -> respond\(result\)\);

─── Interview Tips ─────────────────────────────────
  • thenApply = map, thenCompose = flatMap
  • Async → ForkJoinPool.commonPool\(\) by default
  • allOf + stream to collect all results
  • Prefer over raw Future — no blocking get\(\)
════════════════════════════════════════════════════"
}

# Java Memory Model — happens-before
export def "kb java concept memory_model" [] {
    print $"
═══ Java Memory Model ═════════════════════════════
Rules for when writes are visible to other threads.
Without JMM: threads see stale/reordered values.
────────────────────────────────────────────────────"

    print "─── Happens-Before Rules ───────────────────────"
    print [
        [rule              meaning];
        ["program order"   "within thread: earlier hb later"]
        ["monitor lock"    "unlock() hb next lock() same mon"]
        ["volatile"        "write hb subsequent read same var"]
        ["thread start"    "t.start() hb any action in t"]
        ["thread join"     "all in t hb t.join() returns"]
        ["transitivity"    "A hb B, B hb C → A hb C"]
    ]

    print $"
─── In Practice ────────────────────────────────────
  • No hb → compiler/CPU may reorder
  • Fields set before volatile write →
    visible after volatile read
  • Fields set before unlock →
    visible after lock
  • final fields visible after constructor

─── Interview Tips ─────────────────────────────────
  • hb = GUARANTEE of visibility, not timing
  • A hb B means A's effects VISIBLE to B
  • Follow-up: how does DCL singleton work?
    volatile prevents reordering of
    constructor + field assignment
════════════════════════════════════════════════════"
}

# ─── Core Concepts ────────────────────────────────────

# equals() and hashCode() contract
export def "kb java concept equals_hashcode" [] {
    print $"
═══ equals\(\) & hashCode\(\) Contract ═════════════════
  • a.equals\(b\) → hashCodes MUST be equal
  • hashCodes differ → NOT equal
  • hashCodes same → MAY or MAY NOT be equal
  • Violating this BREAKS HashMap, HashSet

─── equals\(\) Rules ─────────────────────────────────
  reflexive:   a.equals\(a\) == true
  symmetric:   a.equals\(b\) == b.equals\(a\)
  transitive:  a=b, b=c → a=c
  consistent:  multiple calls → same result
  null:        a.equals\(null\) == false

─── Correct Pattern ────────────────────────────────
  @Override
  public boolean equals\(Object o\) \{
      if \(this == o\) return true;
      if \(o == null || getClass\(\) != o.getClass\(\)\)
          return false;
      Person p = \(Person\) o;
      return age == p.age
          && Objects.equals\(name, p.name\);
  \}

  @Override
  public int hashCode\(\) \{
      return Objects.hash\(name, age\);
  \}

─── What Breaks ────────────────────────────────────
  • Override equals w/o hashCode → HashMap fails
  • Mutable fields in hashCode → lost in HashSet
  • instanceof vs getClass → symmetry breaks

─── Interview Tips ─────────────────────────────────
  • ALWAYS override BOTH together
  • Objects.hash\(\), Objects.equals\(\) — null-safe
  • Record classes auto-generate correct impl
  • HashMap: hashCode → bucket, equals → entry
  • Immutable objects = safe hash keys
════════════════════════════════════════════════════"
}

# Immutability
export def "kb java concept immutability" [] {
    print $"
═══ Immutability ═══════════════════════════════════
State cannot change after construction.

─── Why ────────────────────────────────────────────
  • Thread-safe without synchronization
  • Safe as HashMap keys
  • Safe to share/cache freely
  • Easier to reason about

─── Recipe ─────────────────────────────────────────
  1. Class is final
  2. All fields private final
  3. No setters
  4. Deep copy mutable fields in constructor
  5. Return copies from getters

─── Pattern ────────────────────────────────────────
  public final class Money \{
      private final int amount;
      private final String currency;
      private final List<String> tags;

      public Money\(int a, String c, List<String> t\) \{
          this.amount = a;
          this.currency = c;
          this.tags = List.copyOf\(t\);  // defensive!
      \}
      public List<String> getTags\(\) \{
          return tags;  // already immutable
      \}
  \}

─── Record Shortcut \(16+\) ──────────────────────────
  record Money\(int amount, String currency,
               List<String> tags\) \{
      Money \{ tags = List.copyOf\(tags\); \}
  \}

─── stdlib Examples ────────────────────────────────
  String, Integer/Long, LocalDate/Instant
  List.of\(\), Map.of\(\), Set.of\(\)  \(Java 9+\)

─── Interview Tips ─────────────────────────────────
  • String immutable → safe HashMap key
  • records = compact immutable classes
  • List.of\(\) vs unmodifiableList: of\(\) = truly immut
  • Immutability = simplest concurrency strategy
════════════════════════════════════════════════════"
}

# String Pool
export def "kb java concept string_pool" [] {
    print "═══ String Pool ════════════════════════════════"
    print "JVM pool of unique String literals in heap."
    print ""
    print [
        [code                             result];
        ["String a = \"hello\""             "pool ref (reused)"]
        ["String b = \"hello\""             "a==b TRUE (same ref)"]
        ["String c = new String(\"hello\")" "NEW obj on heap"]
        ["a == c"                          "FALSE (diff objs)"]
        ["a.equals(c)"                     "TRUE (same content)"]
        ["c.intern()"                      "returns pool ref"]
        ["a == c.intern()"                 "TRUE"]
    ]

    print $"
─── Why It Matters ─────────────────────────────────
  • Memory: one copy per literal
  • Explains == vs .equals\(\)
  • intern\(\) reduces memory for repeats

─── Interview Tips ─────────────────────────────────
  • Q: How many objects in new String\(\"abc\"\)?
    A: Up to 2 \(pool + heap\)
  • ALWAYS use .equals\(\) for strings
  • Pool moved PermGen → Heap in Java 7
  • intern\(\) can cause leaks if overused
════════════════════════════════════════════════════"
}

# Generics — type erasure, PECS
export def "kb java concept generics" [] {
    print $"
═══ Generics ═══════════════════════════════════════

─── Type Erasure ───────────────────────────────────
  Generics exist at COMPILE-TIME only.
  List<String> and List<Integer> = same at runtime.

  Cannot: new T\(\), new T[], instanceof T, List<int>
  Can:    List<Integer> \(autoboxing\)
────────────────────────────────────────────────────"

    print "─── Wildcards ──────────────────────────────────"
    print [
        [syntax              name       use];
        ["<?>"               "unbnd"    "read-only, type irrelevant"]
        ["<? extends T>"     "upper"    "PRODUCER — read T from it"]
        ["<? super T>"       "lower"    "CONSUMER — write T to it"]
    ]

    print $"
─── PECS: Producer Extends, Consumer Super ─────────
  List<? extends Number> nums  → read Number
  List<? super Integer> dest   → write Integer

  // Collections.copy:
  static <T> void copy\(
      List<? super T> dest,     // CONSUMER
      List<? extends T> src     // PRODUCER
  \)

─── Bounded Types ──────────────────────────────────
  <T extends Comparable<T>>    must be comparable
  <T extends A & B>            must impl both
  <T extends Number>           Number or subclass

─── Interview Tips ─────────────────────────────────
  • Erasure = no generic type at runtime
  • PECS = THE wildcard answer
  • List<Dog> NOT subtype of List<Animal>
  • List<? extends Animal> readable as Animal
  • Bridge methods for type erasure
════════════════════════════════════════════════════"
}

# Optional
export def "kb java concept optional" [] {
    print $"
═══ Optional ═══════════════════════════════════════
May or may not hold a value \(Java 8+\).
────────────────────────────────────────────────────"

    print "─── Creation ───────────────────────────────────"
    print [
        [code                        note];
        ["Optional.of(value)"        "NPE if null!"]
        ["Optional.ofNullable(val)"  "may be empty"]
        ["Optional.empty()"          "no value"]
    ]

    print "─── Operations ─────────────────────────────────"
    print [
        [op                       note];
        ["isPresent()"            "check"]
        ["isEmpty()  // 11+"      "check"]
        ["get()"                  "throws if empty!"]
        ["orElse(default)"        "value or default"]
        ["orElseGet(supplier)"    "lazy default"]
        ["orElseThrow()"          "value or NSE"]
        ["map(fn)"                "transform if present"]
        ["flatMap(fn)"            "unwrap nested Opt"]
        ["filter(pred)"           "keep if matches"]
        ["ifPresent(consumer)"    "act if present"]
    ]

    print $"
─── Good ───────────────────────────────────────────
  opt.map\(x -> transform\(x\)\).orElse\(default\)
  opt.filter\(x -> x.valid\(\)\).ifPresent\(this::use\)

─── Bad ────────────────────────────────────────────
  ✗ Optional as param → overload instead
  ✗ Optional as field → null + Opt getter
  ✗ isPresent\(\)+get\(\) → use orElse/map
  ✗ Optional.of\(\) on nullable → ofNullable

─── Interview Tips ─────────────────────────────────
  • Opt for RETURN types, not fields/params
  • Never call get\(\) without checking
  • orElse\(\) evaluates; orElseGet\(\) is lazy
  • findFirst/findAny return Optional
════════════════════════════════════════════════════"
}

# Functional interfaces
export def "kb java concept functional" [] {
    print $"
═══ Functional Interfaces ═════════════════════════
ONE abstract method → lambda-able.
────────────────────────────────────────────────────"

    print "─── Core Interfaces ────────────────────────────"
    print [
        [name                 signature         use];
        ["Function<T,R>"      "R apply(T)"      "transform"]
        ["Predicate<T>"       "bool test(T)"    "filter"]
        ["Consumer<T>"        "void accept(T)"  "effect"]
        ["Supplier<T>"        "T get()"         "factory"]
        ["BiFunction<T,U,R>"  "R apply(T,U)"    "two args"]
        ["UnaryOp<T>"         "T apply(T)"      "same type"]
        ["BinaryOp<T>"        "T apply(T,T)"    "reduce"]
        ["Comparator<T>"      "int cmp(T,T)"    "ordering"]
    ]

    print "─── Method References ──────────────────────────"
    print [
        [type           syntax            example];
        ["static"       "Class::method"   "Integer::parseInt"]
        ["instance"     "obj::method"     "out::println"]
        ["arbitrary"    "Class::instM"    "String::toLowerCase"]
        ["constructor"  "Class::new"      "ArrayList::new"]
    ]

    print $"
─── Interview Tips ─────────────────────────────────
  • @FunctionalInterface: optional but good
  • Lambda captures effectively final vars only
  • Predicate: .and\(\) .or\(\) .negate\(\)
  • Function:  .andThen\(\) .compose\(\)
════════════════════════════════════════════════════"
}

# Comparable vs Comparator
export def "kb java concept comparable" [] {
    print $"
═══ Comparable vs Comparator ══════════════════════

─── Comparable ─────────────────────────────────────
  Comparable<T> — compareTo\(T other\)
  Implemented BY class. THE natural order \(one\).

  class Student implements Comparable<Student> \{
      public int compareTo\(Student o\) \{
          return Integer.compare\(this.gpa, o.gpa\);
      \}
  \}

─── Comparator ─────────────────────────────────────
  Comparator<T> — compare\(T a, T b\)
  External lambda/class. Custom order \(unlimited\).

  Comparator.comparing\(Student::getName\)
  comparingInt\(Student::getGpa\).reversed\(\)
  byGpa.thenComparing\(Student::getName\)
────────────────────────────────────────────────────"

    print "─── Side by Side ───────────────────────────────"
    print [
        [aspect        comparable         comparator];
        ["defines"     "class itself"      "external"]
        ["how many"    "ONE natural"       "unlimited"]
        ["method"      "compareTo(o)"      "compare(a,b)"]
        ["package"     "java.lang"         "java.util"]
        ["sort"        "sort(list)"        "sort(list,comp)"]
    ]

    print $"
─── Interview Tips ─────────────────────────────────
  • Comparable=natural\(ONE\), Comparator=custom\(MANY\)
  • TreeMap/TreeSet use Comparable by default
  • Integer.compare\(a,b\) not a-b \(overflow!\)
  • Comparator.comparing\(\) = modern idiomatic
════════════════════════════════════════════════════"
}

# ─── Collections Concepts ────────────────────────────

# Fail-fast vs fail-safe
export def "kb java concept fail_fast" [] {
    print $"
═══ Fail-Fast vs Fail-Safe Iterators ═════════════

─── Fail-Fast ──────────────────────────────────────
  Throws ConcurrentModificationException if
  collection modified during iteration.
  Who: ArrayList, HashMap, HashSet
  How: internal modCount checked on next\(\)

  // BROKEN:
  for \(String s : list\)
      list.remove\(s\);  // ConcurrentModException!

─── Fail-Safe ──────────────────────────────────────
  Works on copy or lock — no exception.
  Who: ConcurrentHashMap, CopyOnWriteArrayList
  Cost: may not reflect latest changes

─── Safe Removal ───────────────────────────────────
  // Iterator:
  Iterator<String> it = list.iterator\(\);
  while \(it.hasNext\(\)\)
      if \(it.next\(\).equals\(\"b\"\)\) it.remove\(\);

  // removeIf \(8+\) — cleanest:
  list.removeIf\(s -> s.equals\(\"b\"\)\);

  // stream:
  list = list.stream\(\)
      .filter\(s -> !s.equals\(\"b\"\)\)
      .collect\(toList\(\)\);

─── Interview Tips ─────────────────────────────────
  • fail-fast is best-effort, not guaranteed
  • for-each = Iterator under the hood
  • ConcurrentHashMap: weakly consistent
  • removeIf\(\) is cleanest modern approach
════════════════════════════════════════════════════"
}

# ConcurrentHashMap internals
export def "kb java concept concurrent_map" [] {
    print $"
═══ ConcurrentHashMap ═════════════════════════════
Thread-safe HashMap — no full-table lock.

─── How ────────────────────────────────────────────
  Java 7:  16 segments, each own lock
  Java 8+: CAS + synchronized per bin \(node\)
  = fine-grained locking → high concurrency
────────────────────────────────────────────────────"

    print "─── vs Hashtable ───────────────────────────────"
    print [
        [aspect       hashtable             concurrent];
        ["locking"    "single (whole table)" "per-bin"]
        ["null k/v"   "no"                   "no"]
        ["perf"       "poor contention"      "excellent"]
        ["iterator"   "fail-fast"            "weakly consistent"]
    ]

    print "─── Atomic Operations ──────────────────────────"
    print [
        [method                        note];
        ["putIfAbsent(k, v)"           "atomic check+put"]
        ["computeIfAbsent(k, fn)"      "atomic if missing"]
        ["compute(k, bifn)"            "atomic update"]
        ["merge(k, v, remapping)"      "atomic merge"]
    ]

    print $"
─── Interview Tips ─────────────────────────────────
  • Size is estimated during concurrent mod
  • No null keys or values \(unlike HashMap\)
  • Use atomic methods — get+put has race cond
  • synchronizedMap = single lock — worse
════════════════════════════════════════════════════"
}

# ─── JVM Concepts ────────────────────────────────────

# Garbage Collection
export def "kb java concept gc" [] {
    print $"
═══ Garbage Collection ════════════════════════════
Auto memory — reclaims unreachable objects.
────────────────────────────────────────────────────"

    print "─── Heap Structure ─────────────────────────────"
    print [
        [area          contains              gc];
        ["Young Gen"   "Eden + S0 + S1"      "Minor (fast)"]
        ["Old Gen"     "survived N cycles"    "Major (slow)"]
        ["Metaspace"   "class metadata"       "at threshold"]
    ]

    print $"
─── Object Lifecycle ───────────────────────────────
  1. Allocated in Eden
  2. Survives minor GC → Survivor
  3. Survives N cycles → promoted to Old Gen
  4. Unreachable → collected
────────────────────────────────────────────────────"

    print "─── Collectors ─────────────────────────────────"
    print [
        [name          type             use];
        ["Serial"      "single-thread"  "small apps"]
        ["Parallel"    "multi-thread"   "throughput"]
        ["G1"          "region-based"   "default (9+)"]
        ["ZGC"         "low-latency"    "sub-ms (15+)"]
        ["Shenandoah"  "low-latency"    "concurrent compact"]
    ]

    print $"
─── Interview Tips ─────────────────────────────────
  • finalize\(\) deprecated → Cleaner/try-w-resources
  • System.gc\(\) = HINT, not command
  • Memory leak = unintentional strong references
  • WeakReference → collected when no strong refs
  • G1 default since Java 9
════════════════════════════════════════════════════"
}

# ClassLoader
export def "kb java concept classloader" [] {
    print $"
═══ ClassLoader ═══════════════════════════════════
Loads .class into JVM — delegation hierarchy.
────────────────────────────────────────────────────"

    print "─── Hierarchy ──────────────────────────────────"
    print [
        [level  name           loads];
        [1      "Bootstrap"    "java.lang.* core (native)"]
        [2      "Platform"     "javax.* extensions"]
        [3      "Application"  "classpath: your code+libs"]
        [4      "Custom"       "plugins, hot reload"]
    ]

    print $"
─── Delegation Model ───────────────────────────────
  1. Child asks parent to load first
  2. Parent tries \(recurse up to Bootstrap\)
  3. Parent fails → child tries itself
  4. All fail → ClassNotFoundException

─── Interview Tips ─────────────────────────────────
  • Delegation: core classes can't be overridden
  • Same class + diff classloader = diff class!
  • Tomcat: custom classloaders per webapp
  • JDBC: contextClassLoader breaks delegation
════════════════════════════════════════════════════"
}

# ─── Design Patterns ─────────────────────────────────

# Singleton — all the ways
export def "kb java concept singleton" [] {
    print $"
═══ Singleton ═════════════════════════════════════
Exactly one instance in the JVM.

─── 1. Eager \(simple, thread-safe\) ─────────────────
  private static final S INST = new S\(\);
  private S\(\) \{\}
  public static S get\(\) \{ return INST; \}
  ⊕ simple  ⊖ created even if unused

─── 2. Lazy + synchronized ─────────────────────────
  public static synchronized S get\(\) \{
      if \(inst == null\) inst = new S\(\);
      return inst;
  \}
  ⊕ lazy  ⊖ synced every call — slow

─── 3. Double-Checked Locking ─────────────────────
  private static volatile S inst;
  public static S get\(\) \{
      if \(inst == null\) \{
          synchronized \(S.class\) \{
              if \(inst == null\)
                  inst = new S\(\);
          \}
      \}
      return inst;
  \}
  ⊕ lazy, fast after init  ⊖ needs volatile

─── 4. Enum \(★ recommended\) ────────────────────────
  public enum S \{
      INSTANCE;
      public void doWork\(\) \{ ... \}
  \}
  ⊕ thread-safe, serial-safe, simple
  ⊖ cannot extend classes

─── 5. Bill Pugh \(Holder\) ──────────────────────────
  private static class Holder \{
      static final S INST = new S\(\);
  \}
  public static S get\(\) \{ return Holder.INST; \}
  ⊕ lazy, safe, no sync  ⊖ more code

─── Interview Tips ─────────────────────────────────
  • Enum = Effective Java's recommendation
  • Bill Pugh: class loading = lazy + safe
  • DCL requires volatile — without = BROKEN
  • Reflection breaks all except Enum
  • Serialization breaks all except Enum
════════════════════════════════════════════════════"
}

# Builder pattern
export def "kb java concept builder" [] {
    print $"
═══ Builder Pattern ═══════════════════════════════
Step-by-step construction of complex objects.

─── When ───────────────────────────────────────────
  • 4+ constructor params
  • Many optional params
  • Immutable objects with complex setup
  • Fluent readable construction

─── Pattern ────────────────────────────────────────
  public class Config \{
      private final String host;
      private final int port;
      private final boolean ssl;

      private Config\(Builder b\) \{
          this.host = b.host;
          this.port = b.port;
          this.ssl = b.ssl;
      \}

      public static class Builder \{
          private final String host;  // required
          private int port = 8080;    // opt+default
          private boolean ssl = false;

          public Builder\(String host\) \{
              this.host = host;
          \}
          public Builder port\(int p\) \{
              this.port = p; return this;
          \}
          public Builder ssl\(boolean s\) \{
              this.ssl = s; return this;
          \}
          public Config build\(\) \{
              return new Config\(this\);
          \}
      \}
  \}

  // Usage:
  Config c = new Config.Builder\(\"localhost\"\)
      .port\(443\).ssl\(true\).build\(\);

─── Interview Tips ─────────────────────────────────
  • Required in Builder ctor, optional via methods
  • Result should be immutable \(final fields\)
  • Lombok @Builder auto-generates this
════════════════════════════════════════════════════"
}

# ─── Modern Java ─────────────────────────────────────

# try-with-resources
export def "kb java concept try_resources" [] {
    print $"
═══ try-with-resources ════════════════════════════
Auto-close AutoCloseable resources \(Java 7+\).

─── Before \(ugly\) ──────────────────────────────────
  BufferedReader br = null;
  try \{
      br = new BufferedReader\(new FileReader\(\"f\"\)\);
  \} catch \(IOException e\) \{ ... \}
  finally \{
      if \(br != null\)
          try \{ br.close\(\); \}
          catch \(IOException e\) \{\}
  \}

─── After \(clean\) ──────────────────────────────────
  try \(var br = new BufferedReader\(
          new FileReader\(\"f\"\)\)\) \{
      // auto-closed on exit
  \} catch \(IOException e\) \{ ... \}

─── Multiple ───────────────────────────────────────
  try \(
      var in  = new FileInputStream\(\"a\"\);
      var out = new FileOutputStream\(\"b\"\)
  \) \{
      // both closed in REVERSE order
  \}

─── Interview Tips ─────────────────────────────────
  • Closed in REVERSE declaration order
  • Close exceptions → suppressed
  • Less error-prone than manual finally
  • Java 9+: effectively final vars in try\(\)
════════════════════════════════════════════════════"
}

# Sealed classes
export def "kb java concept sealed" [] {
    print $"
═══ Sealed Classes \(Java 17+\) ═════════════════════
Restrict who can extend/implement a type.

─── Why ────────────────────────────────────────────
  • Exhaustive pattern matching \(switch\)
  • No surprise subclasses
  • Algebraic data types in Java

─── Syntax ─────────────────────────────────────────
  public sealed interface Shape
      permits Circle, Rectangle, Triangle \{\}

  public record Circle\(double r\)
      implements Shape \{\}
  public record Rectangle\(double w, double h\)
      implements Shape \{\}
  public final class Triangle
      implements Shape \{...\}

─── Subclass Modifiers ─────────────────────────────
  sealed       must specify permits
  non-sealed   open for extension
  final        no more subclasses

─── Pattern Matching \(21+\) ─────────────────────────
  double area\(Shape s\) \{
      return switch \(s\) \{
          case Circle c    -> PI * c.r\(\) * c.r\(\);
          case Rectangle r -> r.w\(\) * r.h\(\);
          case Triangle t  -> t.area\(\);
          // no default — compiler: exhaustive!
      \};
  \}

─── Interview Tips ─────────────────────────────────
  • sealed + records = algebraic data types
  • Permits: same package/module
  • Compiler-checked exhaustive switch
  • Subs must be: final, sealed, or non-sealed
════════════════════════════════════════════════════"
}

# ─── Concurrency Concepts (continued) ────────────────

# Deadlock — detect, prevent, avoid
export def "kb java concept deadlock" [] {
    print $"
═══ Deadlock ══════════════════════════════════════
Two+ threads blocked forever, each waiting for
a lock the other holds.

─── Four Conditions (ALL required) ─────────────────
  1. Mutual exclusion  — resource not sharable
  2. Hold and wait     — hold one, wait for another
  3. No preemption     — can't force release
  4. Circular wait     — A→B→C→A

  Break ANY one → deadlock impossible.

─── Classic Example ────────────────────────────────
  // Thread 1:
  synchronized \(lockA\) \{
      synchronized \(lockB\) \{ ... \}
  \}
  // Thread 2:
  synchronized \(lockB\) \{
      synchronized \(lockA\) \{ ... \}  // DEADLOCK!
  \}

─── Prevention Strategies ─────────────────────────
  1. Lock ordering — always acquire in same order
     if \(System.identityHashCode\(a\) < ...b\)
         lock a first, then b

  2. tryLock with timeout \(ReentrantLock\)
     if \(l1.tryLock\(1, SECONDS\)\) \{
         if \(l2.tryLock\(1, SECONDS\)\) \{...
         \} else \{ l1.unlock\(\); \}  // back off
     \}

  3. Single lock — coarser but safe
     synchronized \(singleLock\) \{ ... \}

  4. Lock-free — Atomic*, ConcurrentHashMap
     No locks → no deadlock

─── Detection ──────────────────────────────────────
  • jstack <pid>        dump thread states
  • jconsole             GUI, detect deadlocks
  • ThreadMXBean API     programmatic detection
    ThreadMXBean.findDeadlockedThreads\(\)

─── Livelock ───────────────────────────────────────
  Threads not blocked but make no progress.
  Both keep backing off and retrying in sync.
  Fix: add random backoff delay.

─── Starvation ─────────────────────────────────────
  Thread never gets lock \(unfair scheduling\).
  Fix: ReentrantLock\(true\) — fair lock.

─── Interview Tips ─────────────────────────────────
  • Name all 4 conditions — break any one
  • Lock ordering is the #1 practical fix
  • tryLock is the ReentrantLock advantage
  • Know the difference: deadlock vs livelock
    vs starvation
  • Dining philosophers: classic illustration
════════════════════════════════════════════════════"
}

# ─── Core Concepts (continued) ───────────────────────

# Exceptions — checked vs unchecked
export def "kb java concept exceptions" [] {
    print $"
═══ Exceptions ════════════════════════════════════

─── Hierarchy ──────────────────────────────────────
  Throwable
  ├── Error            ← JVM, don't catch
  │   ├── OutOfMemoryError
  │   ├── StackOverflowError
  │   └── ...
  └── Exception
      ├── IOException        ← CHECKED
      ├── SQLException       ← CHECKED
      ├── ...
      └── RuntimeException   ← UNCHECKED
          ├── NullPointerException
          ├── IndexOutOfBoundsException
          ├── IllegalArgumentException
          ├── IllegalStateException
          ├── ClassCastException
          ├── ArithmeticException
          └── UnsupportedOperationException
────────────────────────────────────────────────────"

    print "─── Checked vs Unchecked ───────────────────────"
    print [
        [aspect          checked              unchecked];
        ["extends"       "Exception"          "RuntimeException"]
        ["compile"       "must handle/declare" "optional"]
        ["when"          "recoverable"        "programming bug"]
        ["examples"      "IO, SQL, Parse"     "NPE, IOOB, IAE"]
        ["declaration"   "throws in sig"      "not required"]
    ]

    print $"
─── Best Practices ─────────────────────────────────
  ✓ Catch specific exceptions, not Exception
  ✓ Prefer unchecked for programming errors
  ✓ Use try-with-resources for cleanup
  ✓ Include cause: new MyEx\(msg, cause\)
  ✓ Log or rethrow — never swallow silently
  ✓ Custom exceptions for domain errors

  ✗ Don't use exceptions for flow control
  ✗ Don't catch Error \(OOM, SOF\)
  ✗ Don't catch + ignore: catch\(Ex e\) \{\}
  ✗ Don't throw Exception — too broad

─── Multi-catch \(Java 7+\) ─────────────────────────
  try \{ ... \}
  catch \(IOException | SQLException e\) \{
      // handle both — e is effectively final
  \}

─── Custom Exception ───────────────────────────────
  public class OrderException extends RuntimeException \{
      private final String orderId;
      public OrderException\(String id, String msg\) \{
          super\(msg\);
          this.orderId = id;
      \}
  \}

─── Interview Tips ─────────────────────────────────
  • Checked = compiler forces handling
  • Unchecked = programmer's fault
  • Error: JVM-level, don't catch
  • finally runs ALWAYS \(even after return\)
  • try-with-resources > finally for cleanup
  • Multi-catch: types can't be related
════════════════════════════════════════════════════"
}

# Autoboxing — Integer cache, == pitfalls
export def "kb java concept autoboxing" [] {
    print $"
═══ Autoboxing / Unboxing ═════════════════════════
Auto-conversion between primitives and wrappers.

─── The Basics ─────────────────────────────────────
  int → Integer      autoboxing   \(auto wrap\)
  Integer → int      unboxing     \(auto unwrap\)

  Integer x = 5;           // autobox: valueOf\(5\)
  int y = x;               // unbox:   intValue\(\)
  int z = x + 3;           // unbox, add, result int

─── Integer Cache \(THE interview trap\) ─────────────
  Integer.valueOf\(\) caches -128 to 127.

  Integer a = 127;
  Integer b = 127;
  a == b              → TRUE  \(same cached object\)

  Integer c = 128;
  Integer d = 128;
  c == d              → FALSE \(different objects!\)

  c.equals\(d\)         → TRUE  \(always use this\)

─── All Wrapper Caches ─────────────────────────────"

    print [
        [type        cached_range];
        ["Integer"   "-128 to 127"]
        ["Long"      "-128 to 127"]
        ["Short"     "-128 to 127"]
        ["Byte"      "-128 to 127 (all)"]
        ["Character" "0 to 127"]
        ["Boolean"   "TRUE, FALSE (all)"]
        ["Float"     "none"]
        ["Double"    "none"]
    ]

    print $"
─── Performance Traps ──────────────────────────────
  // SLOW — autoboxing in loop:
  Long sum = 0L;
  for \(long i = 0; i < 1_000_000; i++\)
      sum += i;   // unbox, add, rebox every iteration!
  // Fix: use primitive long sum = 0L;

  // SLOW — unnecessary boxing:
  List<Integer> list = ...;
  int total = 0;
  for \(Integer i : list\)
      total += i;   // unbox each — acceptable here
  // But avoid boxing if you can stay primitive

─── NPE Traps ─────────────────────────────────────
  Integer x = null;
  int y = x;          // NPE! unboxing null
  if \(x > 0\) \{ ... \}   // NPE! unboxing for compare

  // Safe pattern:
  if \(x != null && x > 0\) \{ ... \}

─── == vs equals ───────────────────────────────────
  int a = 5, b = 5;
  a == b                   → TRUE  \(primitives\)

  Integer a = 5, b = 5;
  a == b                   → TRUE  \(cached\)

  Integer a = 200, b = 200;
  a == b                   → FALSE \(not cached!\)
  a.equals\(b\)              → TRUE  \(always safe\)

  // RULE: ALWAYS use .equals\(\) for wrappers

─── Interview Tips ─────────────────────────────────
  • valueOf\(\) uses cache, new Integer\(\) does not
    \(new Integer deprecated since Java 9\)
  • == on Integer works ONLY in cache range
  • Unboxing null = NullPointerException
  • Autoboxing in tight loops = perf killer
  • Map<String,Integer>.get\(\) returns Integer—
    unbox can NPE if key missing
════════════════════════════════════════════════════"
}

# Pass-by-value — Java's only passing mechanism
export def "kb java concept pass_by_value" [] {
    print $"
═══ Pass-by-Value ═════════════════════════════════
Java is ALWAYS pass-by-value. Always. Period.

─── What Gets Passed ──────────────────────────────
  Primitives: the VALUE is copied
  Objects:    the REFERENCE is copied
              \(not the object itself\)

─── Primitives — Value Copy ────────────────────────
  void increment\(int x\) \{ x++; \}

  int a = 5;
  increment\(a\);
  // a is still 5 — x was a COPY

─── Objects — Reference Copy ───────────────────────
  void addItem\(List<String> list\) \{
      list.add\(\"new\"\);   // modifies original!
  \}

  List<String> myList = new ArrayList<>\(\);
  addItem\(myList\);
  // myList now has \"new\" — we modified via ref

  BUT:
  void replace\(List<String> list\) \{
      list = new ArrayList<>\(\);   // rebinds LOCAL ref
  \}

  replace\(myList\);
  // myList UNCHANGED — we only rebound the copy

─── The Key Distinction ────────────────────────────
  • You CAN modify the object via the reference
  • You CANNOT make the caller's variable point
    to a different object

  Pass-by-reference would let you do:
    swap\(a, b\)  → a and b actually swapped
  Java CANNOT do this. The swap only affects
  local copies of the references.

─── Swap Proof ─────────────────────────────────────
  void swap\(Integer a, Integer b\) \{
      Integer temp = a;
      a = b;
      b = temp;
  \}
  Integer x = 1, y = 2;
  swap\(x, y\);
  // x=1, y=2 — UNCHANGED. QED pass-by-value.

─── String Confusion ───────────────────────────────
  void change\(String s\) \{
      s = \"new\";   // creates new String, rebinds local
  \}
  String s = \"old\";
  change\(s\);
  // s is still \"old\"
  // String is immutable AND ref is a copy

─── Interview Tips ─────────────────────────────────
  • \"Java is pass-by-value\" is THE correct answer
  • For objects: the value IS the reference \(address\)
  • You pass a copy of the pointer, not the object
  • Prove with swap: if pass-by-ref, swap would work
  • Immutable objects \(String, Integer\) look like
    pass-by-value for everything because you can't
    modify them via the reference either
════════════════════════════════════════════════════"
}

# Abstract class vs Interface
export def "kb java concept abstract_iface" [] {
    print $"
═══ Abstract Class vs Interface ═══════════════════
────────────────────────────────────────────────────"

    print "─── Side by Side ───────────────────────────────"
    print [
        [aspect              abstract_class      interface];
        ["extend/impl"       "extends (ONE)"     "implements (MANY)"]
        ["constructors"      "yes"               "no"]
        ["state (fields)"    "yes, any"          "static final only"]
        ["methods"           "abstract+concrete"  "abstract+default"]
        ["access mods"       "any"               "public (implicit)"]
        ["inheritance"       "single"            "multiple"]
    ]

    print $"
─── When to Use Which ─────────────────────────────
  Abstract class:
    • IS-A relationship with shared state
    • Common base with constructor logic
    • Template method pattern
    • Partial implementation with fields
    • Controlled evolution \(add methods safely\)

  Interface:
    • CAN-DO capability / contract
    • Multiple inheritance needed
    • Unrelated classes share behavior
    • API boundary / decoupling
    • Functional interface \(1 method → lambda\)

─── Default Methods \(Java 8+\) ─────────────────────
  interface Sortable \{
      default void sort\(\) \{
          // default implementation
          // subclass CAN override
      \}
  \}

  Why added: evolve interfaces without breaking
  all implementors \(backward compatibility\).

─── Diamond Problem ────────────────────────────────
  interface A \{ default void m\(\) \{...\} \}
  interface B \{ default void m\(\) \{...\} \}

  class C implements A, B \{
      // MUST override m\(\) — compiler error otherwise
      public void m\(\) \{
          A.super.m\(\);  // explicitly choose
      \}
  \}

─── Static & Private Methods in Interfaces ────────
  Java 8:  static methods  \(utility in interface\)
  Java 9:  private methods \(share code between
           default methods\)

─── Abstract + Interface Combo ─────────────────────
  interface Drawable \{ void draw\(\); \}
  abstract class Shape implements Drawable \{
      protected int x, y;      // shared state
      Shape\(int x, int y\) \{    // constructor
          this.x = x; this.y = y;
      \}
      // draw\(\) left abstract for subclasses
  \}
  class Circle extends Shape \{
      Circle\(int x, int y\) \{ super\(x, y\); \}
      public void draw\(\) \{ ... \}
  \}

─── Interview Tips ─────────────────────────────────
  • \"IS-A → abstract, CAN-DO → interface\"
  • Default methods ≠ multiple inheritance of state
  • Diamond: compiler forces explicit override
  • Java 8 blurred the line — both can have impl
  • Still can't have instance fields in interface
  • Prefer interface for loose coupling
════════════════════════════════════════════════════"
}

# Serialization
export def "kb java concept serialization" [] {
    print $"
═══ Serialization ═════════════════════════════════
Convert object → byte stream \(and back\).

─── Basics ─────────────────────────────────────────
  class User implements Serializable \{
      private static final long serialVersionUID = 1L;
      private String name;
      private transient String password; // skipped!
      private static int count;          // skipped!
  \}

─── Key Annotations ────────────────────────────────
  Serializable    marker interface, no methods
  transient       field excluded from serialization
  serialVersionUID  version check on deserialize

─── Serialize / Deserialize ────────────────────────
  // Write:
  try \(var oos = new ObjectOutputStream\(
          new FileOutputStream\(\"user.ser\"\)\)\) \{
      oos.writeObject\(user\);
  \}

  // Read:
  try \(var ois = new ObjectInputStream\(
          new FileInputStream\(\"user.ser\"\)\)\) \{
      User u = \(User\) ois.readObject\(\);
  \}

─── serialVersionUID ──────────────────────────────
  • Auto-generated if omitted \(based on class\)
  • ANY class change → different UID → deser fails
  • ALWAYS declare explicitly for stability
  • Convention: private static final long = 1L;

─── transient ──────────────────────────────────────
  • Field not serialized \(becomes null/0 on deser\)
  • Use for: passwords, caches, derived fields,
    non-serializable fields
  • static fields also not serialized

─── Custom Serialization ──────────────────────────
  // Override these in your class:
  private void writeObject\(ObjectOutputStream o\)
      throws IOException \{
      o.defaultWriteObject\(\);
      o.writeInt\(encryptedPassword\);  // custom
  \}
  private void readObject\(ObjectInputStream i\)
      throws IOException, ClassNotFoundException \{
      i.defaultReadObject\(\);
      this.password = decrypt\(i.readInt\(\)\);
  \}

─── Security Risks ─────────────────────────────────
  • Deserialization executes code → attack vector
  • Never deserialize untrusted data
  • Prefer JSON/Protobuf for external data
  • Java 17+: serialization filters

─── Singleton & Serialization ─────────────────────
  // Without this, deserialization creates new obj:
  private Object readResolve\(\) \{
      return INSTANCE;  // preserve singleton
  \}
  // Enum singletons handle this automatically

─── Interview Tips ─────────────────────────────────
  • serialVersionUID: version mismatch = InvalidClassEx
  • transient = not serialized \(null/0 on deser\)
  • static fields not serialized
  • Enum serialization is safe by design
  • Externalizable: full control \(writeExternal\)
  • Modern: prefer JSON \(Jackson/Gson\) over Java ser
════════════════════════════════════════════════════"
}

# Reflection
export def "kb java concept reflection" [] {
    print $"
═══ Reflection ════════════════════════════════════
Inspect and modify classes/objects at runtime.

─── Getting Class Objects ──────────────────────────
  Class<?> c = String.class;           // literal
  Class<?> c = obj.getClass\(\);         // instance
  Class<?> c = Class.forName\(\"java.lang.String\"\);
  // forName: dynamic loading, throws ClassNotFound

─── Inspecting ─────────────────────────────────────
  c.getName\(\)                  fully qualified name
  c.getSimpleName\(\)            just class name
  c.getSuperclass\(\)            parent class
  c.getInterfaces\(\)            implemented ifaces
  c.getModifiers\(\)             public/abstract/etc

─── Fields ─────────────────────────────────────────
  c.getFields\(\)                public only \(+inherited\)
  c.getDeclaredFields\(\)        all \(this class only\)

  Field f = c.getDeclaredField\(\"name\"\);
  f.setAccessible\(true\);       // bypass private!
  Object val = f.get\(obj\);     // read
  f.set\(obj, \"new\"\);           // write

─── Methods ────────────────────────────────────────
  c.getMethods\(\)               public \(+inherited\)
  c.getDeclaredMethods\(\)       all \(this class\)

  Method m = c.getDeclaredMethod\(\"process\",
      String.class, int.class\);
  m.setAccessible\(true\);
  Object result = m.invoke\(obj, \"arg\", 42\);

─── Constructors ───────────────────────────────────
  Constructor<?> con =
      c.getDeclaredConstructor\(String.class\);
  con.setAccessible\(true\);
  Object newObj = con.newInstance\(\"value\"\);

─── Use Cases ──────────────────────────────────────
  • Frameworks: Spring \(DI\), Hibernate \(ORM\)
  • Serialization libraries \(Jackson, Gson\)
  • Testing: access private fields/methods
  • Plugin systems: dynamic class loading
  • Annotation processing at runtime

─── Dangers ────────────────────────────────────────
  • Breaks encapsulation \(private access\)
  • No compile-time type safety
  • Performance: ~50x slower than direct calls
  • Breaks with Java modules \(JPMS, Java 9+\)
  • setAccessible may fail with SecurityManager

─── Annotations + Reflection ──────────────────────
  // Read annotations at runtime:
  if \(m.isAnnotationPresent\(MyAnnotation.class\)\) \{
      MyAnnotation a = m.getAnnotation\(MyAnnotation.class\);
      String val = a.value\(\);
  \}
  // Requires: @Retention\(RetentionPolicy.RUNTIME\)

─── Interview Tips ─────────────────────────────────
  • Reflection = runtime introspection + modification
  • Spring uses it for @Autowired, @Component
  • getDeclared*: all access levels, this class only
  • get*: public only, includes inherited
  • setAccessible\(true\) bypasses private
  • Performance cost: cache Method/Field objects
  • Java modules can block reflective access
════════════════════════════════════════════════════"
}

# Weak, Soft, Phantom References
export def "kb java concept weak_refs" [] {
    print $"
═══ Reference Types ═══════════════════════════════
Control how GC treats object references.
────────────────────────────────────────────────────"

    print "─── Reference Hierarchy ────────────────────────"
    print [
        [type        gc_behavior                   use];
        ["Strong"    "never collected while ref'd"  "default (T obj)"]
        ["Soft"      "collected on low memory"      "memory caches"]
        ["Weak"      "collected on next GC"         "canonicalize maps"]
        ["Phantom"   "collected, enqueued for notif" "cleanup actions"]
    ]

    print $"
─── Strong \(default\) ───────────────────────────────
  Object obj = new Object\(\);
  // GC will NEVER collect while obj is reachable
  // Memory leak if you forget to null/remove

─── WeakReference ──────────────────────────────────
  WeakReference<BigObject> ref =
      new WeakReference<>\(new BigObject\(\)\);

  BigObject obj = ref.get\(\);   // may return null!
  if \(obj != null\) \{
      // use obj — still alive
  \} else \{
      // GC collected it
  \}

  Use case: WeakHashMap
  Map<Key, Value> cache = new WeakHashMap<>\(\);
  // Entries auto-removed when key has no strong refs

─── SoftReference ──────────────────────────────────
  SoftReference<byte[]> cache =
      new SoftReference<>\(new byte[1_000_000]\);

  byte[] data = cache.get\(\);
  if \(data == null\) \{
      data = recompute\(\);  // was GC'd, rebuild
      cache = new SoftReference<>\(data\);
  \}

  • Kept alive as long as memory is sufficient
  • GC clears soft refs BEFORE throwing OOM
  • Ideal for memory-sensitive caches

─── PhantomReference ──────────────────────────────
  ReferenceQueue<Object> queue = new ReferenceQueue<>\(\);
  PhantomReference<Object> ref =
      new PhantomReference<>\(obj, queue\);

  // ref.get\(\) ALWAYS returns null
  // When GC collects obj, ref is enqueued
  // Your cleanup thread polls the queue

  • Replacement for finalize\(\)
  • Cleaner \(Java 9+\) uses this internally

─── GC Collection Order ────────────────────────────
  1. Strong refs keep objects alive
  2. Soft refs cleared before OOM
  3. Weak refs cleared on any GC cycle
  4. Phantom refs enqueued after finalization

─── Common Patterns ────────────────────────────────
  WeakHashMap:
    Entries auto-evict when key unreachable.
    Caution: String literals never GC'd \(pool\).

  SoftReference cache:
    Cache expensive computations.
    JVM decides when to evict based on memory.

  Cleaner \(Java 9+\):
    Cleaner cleaner = Cleaner.create\(\);
    cleaner.register\(obj, \(\) -> releaseResource\(\)\);
    // Runs cleanup action when obj becomes phantom

─── Interview Tips ─────────────────────────────────
  • Strong: default, prevents GC
  • Soft: GC'd under memory pressure \(caches\)
  • Weak: GC'd on next cycle \(WeakHashMap\)
  • Phantom: can't access object, only notification
  • WeakHashMap: keys are weak, not values
  • Prefer Caffeine/Guava cache over manual SoftRef
  • Cleaner replaces deprecated finalize\(\)
════════════════════════════════════════════════════"
}
