library (tidyverse)

Moneypenny <- read.csv('Moneypenny.csv')

Moneypenny %>% 
  ggplot(aes(fct_reorder(film, n), `weighted.degree.position`, group = 1,
             label = `weighted.degree.position`)) +
  geom_line(color = '#20B2AA') +
  geom_point(color = '#008B8B')+
  scale_y_reverse()+
  labs(x = '',
       y = '',
       title = 'Как менялось место Манипенни по показателю weighted degree')+
  theme_light() +
  theme(plot.title = element_text(size = 10), 
        axis.text.x = element_text(angle = 50, vjust = 1, hjust = 1))

Moneypenny %>% 
  ggplot(aes(fct_reorder(film, n), `closeness.centrality.position`, group = 1,
             label = `closeness.centrality.position`)) +
  geom_line(color = '#B0C4DE') +
  geom_point(color = '#4682B4')+
  scale_y_reverse()+
  labs(x = '',
       y = '',
       title = 'Как менялось место Манипенни по показателю closeness centrality')+
  theme_light() +
  theme(plot.title = element_text(size = 10), 
        axis.text.x = element_text(angle = 50, vjust = 1, hjust = 1))

Moneypenny %>% 
  ggplot(aes(fct_reorder(film, n), `degree`, group = 1,
             label = `degree`)) +
  geom_line(color = '#ffa000') +
  geom_point(color = '#f5770a')+
  labs(x = '',
       y = '',
       title = 'Как менялось количество ребер у Манипенни')+
  theme_light() +
  theme(plot.title = element_text(size = 10), 
        axis.text.x = element_text(angle = 50, vjust = 1, hjust = 1))


