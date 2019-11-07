#|--------------------------------------------------------------------------|
#|              Handling and Processing Strings                             |
#|               Character Strings - Chapter 2                              |
#|   String Manipulation + stringr - Chapter 3, 4                           |
#|                           RegEx - Chapter 5                              |
#|--------------------------------------------------------------------------|

# ================= String Manipulation ====================================
# How to create

(x <- "This is my first character!") # double quotes 
class(x)
typeof(x)

(x <- 'This is R my second string') # single quotes
class(x)

(x <- "Why do we need the 'python'?")
(x <- 'Why do we need the "python"?')

# Something went wrong
"Why call langauge "python" ? "
'Why call langauge 'python' ? '

# \escaping character

(x <- 'Why do we need the \'python\'?')
is.character(x)

# Paste() and its arguments 
## Takes or more R objects, conver them to character and then concatenates them to character (one or more)

paste("Life of", pi)

x <- 1:26
(a <- LETTERS[x[1:13]])
(b <- letters[x[14:26]])
(char1 <- paste(x, c(a, b)) )
paste(x, c(a, b), sep = " - is - ") # optional
(char2 <- paste(x, c(a, b), sep = " - is - ", collapse = " , ")) # optional
length(char1)
length(char2)

# ------------------ Basic Sting manipulations --------------
# ---------------------  Base -------------------------------

# for single character
nchar("Here are 16 chars:)")
nchar(char2)

# for character vector
nchar(char1)
month.name
nchar(month.name)

toupper("Here are 16 chars:)")
tolower(toupper("Here are 16 chars:)"))

chartr(old = "is", new = "as", char2) # the size should be equal

# Substring + replacement based on the positions
x <- "Lusine Zilfimian"
substr(x, start = 8, stop = 7 + 5)
substring(x, first = 8)
substr(x, start = 14, stop = 14) <- "y"  
x

# Abbreviations 
x <- c("Lusin ", " Lusine ", "Lusine Zilfimian", "Lusine Zilfi", "Lus - ", "Lusine 1995")
(abb1 <- abbreviate(x, minlength = 4))
(abb2 <- abbreviate(x, minlength = 4, strict = T))

unique(abb1)
unique(abb2)

# ----------------- StingR --------------------------------
# All functions start with str_
# All functions take a vector of strings as the first argument

library(stringr)
str_sub("Joe Satriani", start = 5)
str_sub("Joe Satriani", start = 5, end = 5+4)
str_sub("Joe Satriani", start = -8, end = -4)

# Str_function

(geners <- c("Action, Adventure, Comedy",
  "Comedy",
  "Comedy, Drama, Drama, Romance", 
  "Crime, Drama, History"))

str_replace(string = geners, pattern = ",", replacement = " &")
sub(x = geners, pattern = ",", replacement = " &") # from base
gsub(x = geners, pattern = ",", replacement = " &") # from base
str_replace_all(string = geners, pattern = ",", replacement = " &")

str_detect(string = geners,  pattern = "Drama")
str_subset(string = geners,  pattern = "Drama")
str_count(string = geners, pattern = "Drama")
str_extract(string = geners, pattern = "Drama")
str_extract_all(string = geners, pattern = "Drama")
str_extract_all(string = geners, pattern = "Drama", simplify = T)

# Let's consider the example 
movies <- read.csv('movies3.csv', stringsAsFactors = F)
View(movies)

# Time to think
# How many romcom movies are there?


# Split string into pieces
str_split(geners, ",")
(gen_m <- str_split(geners, ",", simplify = T))

# -------------------- Regular Expressions -------------------------

# 1. Literal characters which are characters that match themselves
# 2. Metacharacters - any character that is not a literal character 
# 3. Sequences 
# 4. Character classes
# 5. Quantifiers
# 6. POSIX character classes

# ----------- Literal and Metacharacters ---------------------------

str <-c("Lusine1995^", "Say$1995-02(", "David.", "M*77", "M&95", "1995.27")
str_subset(string = str,  pattern = "Lusine") # literal 
str_subset(string = str,  pattern = ".") # meta
str_subset(string = str,  pattern = "\\.") # literal
str_subset(string = str,  pattern = "^M") # meta
str_subset(string = str,  pattern = "\\^") # meta
str_subset(string = str,  pattern = "\\$") # meta
str_subset(string = str,  pattern = "M?") # meta
str_subset(string = str,  pattern = "M*") # meta
str_subset(string = str,  pattern = "M+") # meta
