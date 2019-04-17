
Song_Dup = data.frame()

song_length = seq(500,10000,500)
  
for(i in song_length){
Snowballs = 0
for(j in 1:10000){
maxp = as.numeric(data.frame(song_number = sample(0:i,
       100,
       replace=T)) %>%
  group_by(song_number) %>%
  summarise(plays=n()) %>%
  ungroup() %>%
  summarise(max(plays)))

if(maxp>1){
  Snowballs = Snowballs+1
}
}
Song_Dup_temp = Snowballs/10000

Song_Dup = rbind(Song_Dup,
                 Song_Dup_temp)
}

cbind(song_length,
      Song_Dup)
