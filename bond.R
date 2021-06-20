library (tidyverse)

weighted_degree <- c(3, 3, 3, 3, 5, 3, 4, 2, 2, 2, 4, 2, 2)
closeness <- c(4, 3, 7, 2, 5, 3, 5, 3, 4, 2, 8, 2, 3)
betweenness <- c(5, 4, 8, 2, 6, 6, 4, 4, 4, 2, 3, 2, 7)
film <- c("Dr. No", "Goldfinger", "You Only Live Twice", "Diamonds Are Forever",
          "The Man with the Golden Gun",
          "Moonraker",
          "Octopussy",
          "The Living Daylights",
          "GoldenEye",
          "The World Is Not Enough",
          "Casino Royale",
          "Skyfall",
          "Spectre"
)
# weighted_degree
tibble(films = factor(film, levels = film),
       position = weighted_degree) %>% 
  ggplot(aes(films, position, group = 1,
             label = position)) +
  geom_point(color = '#B22222')+
  geom_line(color = '#8B0000')+
  scale_y_reverse() +
  theme_light() +
  labs(x = '',
        y = '',
        title = 'Какое место занимает героиня по показателю 
       weighted degree') +
  theme(plot.title = element_text(family = "Calibri", size = 10), 
        axis.text.x = element_text(angle = 50, vjust = 1, hjust = 1))

  
# closeness centrality
tibble(films = factor(film, levels = film),
       position = closeness) %>% 
  ggplot(aes(films, position, group = 1,
             label = position)) +
  geom_point(color = '#006400')+
  geom_line(color = '#228B22')+
  scale_y_reverse()+
  theme_light() +
  labs(x = '',
       y = '',
       title = 'Какое место занимает героиня по показателю 
       closeness centrality') +
  theme(plot.title = element_text(family = "Calibri", size = 10), 
        axis.text.x = element_text(angle = 50, vjust = 1, hjust = 1))

# betweenness centrality
tibble(films = factor(film, levels = film),
       position = betweenness) %>% 
  ggplot(aes(films, position, group = 1,
             label = position)) +
  geom_point(color = '#000080')+
  geom_line(color = '#1E90FF')+
  scale_y_reverse()+
  theme_light() +
  labs(x = '',
       y = '',
       title = 'Какое место занимает героиня по показателю 
       betweenness centrality') +
  theme(plot.title = element_text(family = "Calibri", size = 10), 
        axis.text.x = element_text(angle = 50, vjust = 1, hjust = 1))

# M
M <- read_csv2('M.csv')
M %>% 
  ggplot(aes(fct_reorder(film, n), `weighted degree position`, group = 1,
             label = `weighted degree position`)) +
  geom_line(color = '#20B2AA') +
  geom_point(color = '#008B8B')+
  scale_y_reverse()+
  labs(x = '',
       y = '',
       title = 'Как менялось место М по показателю weighted degree')+
  theme_light() +
  theme(plot.title = element_text(size = 10), 
        axis.text.x = element_text(angle = 50, vjust = 1, hjust = 1))

M %>% 
  ggplot(aes(fct_reorder(film, n), `closeness centrality position`, group = 1,
             label = `closeness centrality position`)) +
  geom_line(color = '#B0C4DE') +
  geom_point(color = '#4682B4')+
  scale_y_reverse()+
  labs(x = '',
       y = '',
       title = 'Как менялось место М по показателю closeness centrality')+
  theme_light() +
  theme(plot.title = element_text(size = 10), 
        axis.text.x = element_text(angle = 50, vjust = 1, hjust = 1))

M %>% 
  ggplot(aes(fct_reorder(film, n), `betweenness centrality position`, group = 1,
             label = `betweenness centrality position`)) +
  geom_line(color = '#DC143C') +
  geom_point(color = '#8B0000')+
  scale_y_reverse()+
  labs(x = '',
       y = '',
       title = 'Как менялось место М по показателю betweenness centrality')+
  theme_light() +
  theme(plot.title = element_text(size = 10), 
        axis.text.x = element_text(angle = 50, vjust = 1, hjust = 1))
