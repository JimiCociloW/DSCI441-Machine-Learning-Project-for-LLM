#---- (song_lyrics Dataset)
setwd("C:/Lehigh University Graduate Program/Lehigh Courses/2024 Fall/CSE 449 Big Data/Project/song_lyrics")

song_lyrics = read.csv("song_lyrics.csv")

str(song_lyrics)

# Check for missing values in each variable
missing_values <- song_lyrics %>%
  summarise_all(~ sum(is.na(.)))

print(missing_values)

song_lyrics$lyrics[1]

unique(song_lyrics$tag)
table(song_lyrics$tag)

# Since 'misc' means 'non-music genre', 
# and I only want to analyze the lyrics of songs,
# I will remove all rows where song_lyrics$tag == 'misc'
song_lyrics_filtered <- song_lyrics %>% filter(tag != "misc")
head(song_lyrics_filtered)

unique(song_lyrics_filtered$year)
max(song_lyrics_filtered$year, na.rm = TRUE)

unique(song_lyrics_filtered$language_cld3)

unique(song_lyrics_filtered$language_ft)

unique(song_lyrics_filtered$language)

# Filter rows where features are not empty
# All remaining songs have other artists contributing
song_lyrics_filtered <- song_lyrics_filtered %>% filter(features != "{}")

# Preprocess the data
## Restrict the time range from 1960 to 2019
filtered_song_lyrics <- song_lyrics_filtered %>%
  filter(
    language_cld3 == "en",
    language_ft == "en",
    language == "en",
    year >= 1960,
    year <= 2019
  )

unique(filtered_song_lyrics$year)
max(filtered_song_lyrics$year, na.rm = TRUE)
min(filtered_song_lyrics$year, na.rm = TRUE)

## Select only songs where the language is "en"
filtered_song_lyrics <- filtered_song_lyrics %>%
  filter(language_cld3 == "en" & language_ft == "en" & language == "en")

unique(filtered_song_lyrics$language_cld3)
unique(filtered_song_lyrics$language_ft)
unique(filtered_song_lyrics$language)

str(filtered_song_lyrics)

## Remove low-importance columns
filtered_song_lyrics <- filtered_song_lyrics %>%
  select(-id, -language_cld3, -language_ft, -language, -features, -views)
str(filtered_song_lyrics)

# Count the number of entries for each year
year_counts <- filtered_song_lyrics %>% count(year)
print(year_counts)

# Random Sampling
# Randomly select a subset of rows from the dataset while preserving distribution.
# This reduces the dataset size while maintaining diversity.
# Randomly sample 25% of the rows
sampled_lyrics <- filtered_song_lyrics %>% sample_frac(0.25)

# Count the number of entries for each year
year_counts_1 <- sampled_lyrics %>% count(year)
print(year_counts_1)

# Clean data before export: Handle newline characters and special characters in R
sampled_lyrics$lyrics <- gsub("\\n", " ", sampled_lyrics$lyrics)
sampled_lyrics$lyrics <- gsub("\\[.*?\\]", "", sampled_lyrics$lyrics)  # Remove content inside square brackets

sampled_lyrics$lyrics[1]

## Check and identify special characters in the data
# title ----
# Combine all title characters into a single string
all_titles <- paste(sampled_lyrics$title, collapse = " ")

# Identify non-alphanumeric and non-standard punctuation characters
unique_specials <- unique(unlist(strsplit(all_titles, "")))
special_characters <- unique_specials[!grepl("[a-zA-Z0-9[:space:][:punct:]]", unique_specials)]

# Print special characters
print(special_characters)

# Use regular expressions to remove all non-standard characters
# Remove any character that is not a letter, number, space, or standard punctuation
sampled_lyrics$title <- gsub("[^[:alnum:][:space:][:punct:]]", "", sampled_lyrics$title)
sampled_lyrics$title <- gsub("[\\p{C}\\p{So}]+", "", sampled_lyrics$title, perl = TRUE)

# Manually clean known special characters
sampled_lyrics$title <- gsub("â€™", "'", sampled_lyrics$title)
sampled_lyrics$title <- gsub("“|”", "\"", sampled_lyrics$title)
sampled_lyrics$title <- gsub("[^\x20-\x7E]", "", sampled_lyrics$title) 

# Re-check for special characters in titles
all_titles <- paste(sampled_lyrics$title, collapse = " ")
unique_specials <- unique(unlist(strsplit(all_titles, "")))
special_characters <- unique_specials[!grepl("[a-zA-Z0-9[:space:][:punct:]]", unique_specials)]
print(special_characters)

# tag ----
# Combine all tag characters into a single string
all_tags <- paste(sampled_lyrics$tag, collapse = " ")

# Identify non-alphanumeric and non-standard punctuation characters
unique_specials <- unique(unlist(strsplit(all_tags, "")))
special_characters <- unique_specials[!grepl("[a-zA-Z0-9[:space:][:punct:]]", unique_specials)]

# Print special characters
print(special_characters)

# artist ----
# Combine all artist characters into a single string
all_artist <- paste(sampled_lyrics$artist, collapse = " ")

# Identify non-alphanumeric and non-standard punctuation characters
unique_specials <- unique(unlist(strsplit(all_artist, "")))
special_characters <- unique_specials[!grepl("[a-zA-Z0-9[:space:][:punct:]]", unique_specials)]

# Print special characters
print(special_characters)

# lyrics ----
# Combine all lyrics characters into a single string
all_lyrics <- paste(sampled_lyrics$lyrics, collapse = " ")

# Identify non-alphanumeric and non-standard punctuation characters
unique_specials <- unique(unlist(strsplit(all_lyrics, "")))
special_characters <- unique_specials[!grepl("[a-zA-Z0-9[:space:][:punct:]]", unique_specials)]

# Print special characters
print(special_characters)

# Use regular expressions to remove all non-standard characters
# Remove any character that is not a letter, number, space, or standard punctuation
sampled_lyrics$lyrics <- gsub("[^[:alnum:][:space:][:punct:]]", "", sampled_lyrics$lyrics)
sampled_lyrics$lyrics <- gsub("[\\p{C}\\p{So}]+", "", sampled_lyrics$lyrics, perl = TRUE)

# Manually clean known special characters
sampled_lyrics$lyrics <- gsub("â€™", "'", sampled_lyrics$lyrics)
sampled_lyrics$lyrics <- gsub("“|”", "\"", sampled_lyrics$lyrics)
sampled_lyrics$lyrics <- gsub("[^\x20-\x7E]", "", sampled_lyrics$lyrics) 

# Re-check for special characters in lyrics
all_lyrics <- paste(sampled_lyrics$lyrics, collapse = " ")
unique_specials <- unique(unlist(strsplit(all_lyrics, "")))
special_characters <- unique_specials[!grepl("[a-zA-Z0-9[:space:][:punct:]]", unique_specials)]
print(special_characters)

## Check missing values
sum(is.na(sampled_lyrics))
summary(sampled_lyrics)

missing_values <- sampled_lyrics %>%
  summarise_all(~ sum(is.na(.)))

print(missing_values)

## Save the sampled_lyrics as a .csv file
# write.csv(sampled_lyrics, file = "filtered_song_lyrics.csv", row.names = FALSE)

write.csv(sampled_lyrics, "filtered_song_lyrics.csv", row.names = FALSE, fileEncoding = "UTF-8", quote = TRUE)
