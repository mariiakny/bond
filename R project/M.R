library (tidyverse)

M <- read.csv('M.csv')

M %>% 
  ggplot(aes(fct_reorder(film, n), `weighted.degree.position`, group = 1,
             label = `weighted.degree.position`)) +
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
  ggplot(aes(fct_reorder(film, n), `closeness.centrality.position`, group = 1,
             label = `closeness.centrality.position`)) +
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
  ggplot(aes(fct_reorder(film, n), `betweenness.centrality.position`, group = 1,
             label = `betweenness.centrality.position`)) +
  geom_line(color = '#DC143C') +
  geom_point(color = '#8B0000')+
  scale_y_reverse()+
  labs(x = '',
       y = '',
       title = 'Как менялось место М по показателю betweenness centrality')+
  theme_light() +
  theme(plot.title = element_text(size = 10), 
        axis.text.x = element_text(angle = 50, vjust = 1, hjust = 1))

M %>% 
  ggplot(aes(fct_reorder(film, n), `degree`, group = 1,
             label = `degree`)) +
  geom_line(color = '#ffa000') +
  geom_point(color = '#f5770a')+
  labs(x = '',
       y = '',
       title = 'Как менялось количество ребер у M')+
  theme_light() +
  theme(plot.title = element_text(size = 10), 
        axis.text.x = element_text(angle = 50, vjust = 1, hjust = 1))

M %>% 
  ggplot(aes(fct_reorder(film, n), `communication.with.bond.percent`, group = 1,
             label = `communication.with.bond.percent`)) +
  geom_line(color = '#548042') +
  geom_point(color = '#3C5C30')+
  labs(x = '',
       y = '',
       title = 'Как менялся процент коммуникации М с Бондом от общего количества взаимодействий М')+
  theme_light() +
  theme(plot.title = element_text(size = 10), 
        axis.text.x = element_text(angle = 50, vjust = 1, hjust = 1))


M %>% 
  ggplot(aes(fct_reorder(film, n), `bond.communication.percent`, group = 1,
             label = `bond.communication.percent`)) +
  geom_line(color = '#E35AE6') +
  geom_point(color = '#AE45B0')+
  labs(x = '',
       y = '',
       title = 'Как менялся процент коммуникации Бонда с М от общего количества взаимодействий Бонда')+
  theme_light() +
  theme(plot.title = element_text(size = 10), 
        axis.text.x = element_text(angle = 50, vjust = 1, hjust = 1))

