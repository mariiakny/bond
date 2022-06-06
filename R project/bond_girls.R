library (tidyverse)


bond_girls <- read.csv('Bond_girl.csv')

bond_girls %>% 
  ggplot(aes(fct_reorder(name, n), `weighted.degree.position`, group = 1,
             label = `weighted.degree.position`)) +
  geom_line(color = '#20B2AA') +
  geom_point(color = '#008B8B')+
  scale_y_reverse()+
  labs(x = '',
       y = '',
       title = 'Как менялось место девушек Бонда по показателю weighted degree')+
  theme_light() +
  theme(plot.title = element_text(size = 10), 
        axis.text.x = element_text(angle = 50, vjust = 1, hjust = 1))

bond_girls %>% 
  ggplot(aes(fct_reorder(name, n), `closeness.centrality.position`, group = 1,
             label = `closeness.centrality.position`)) +
  geom_line(color = '#B0C4DE') +
  geom_point(color = '#4682B4')+
  scale_y_reverse()+
  labs(x = '',
       y = '',
       title = 'Как менялось место девушек Бонда по показателю closeness centrality')+
  theme_light() +
  theme(plot.title = element_text(size = 10), 
        axis.text.x = element_text(angle = 50, vjust = 1, hjust = 1))

bond_girls %>% 
  ggplot(aes(fct_reorder(name, n), `betweenness.centrality.position`, group = 1,
             label = `betweenness.centrality.position`)) +
  geom_line(color = '#DC143C') +
  geom_point(color = '#8B0000')+
  scale_y_reverse()+
  labs(x = '',
       y = '',
       title = 'Как менялось место девушек Бонда по показателю betweenness centrality')+
  theme_light() +
  theme(plot.title = element_text(size = 10), 
        axis.text.x = element_text(angle = 50, vjust = 1, hjust = 1))

bond_girls %>% 
  ggplot(aes(fct_reorder(name, n), `degree`, group = 1,
             label = `degree`)) +
  geom_line(color = '#ffa000') +
  geom_point(color = '#f5770a')+
  labs(x = '',
       y = '',
       title = 'Как менялось количество ребер у девушек Бонда')+
  theme_light() +
  theme(plot.title = element_text(size = 10), 
        axis.text.x = element_text(angle = 50, vjust = 1, hjust = 1))

bond_girls %>% 
  ggplot(aes(fct_reorder(name, n), `communication.with.bond.percent`, group = 1,
             label = `communication.with.bond.percent`)) +
  geom_line(color = '#548042') +
  geom_point(color = '#3C5C30')+
  labs(x = '',
       y = '',
       title = 'Как менялся процент коммуникации девушек с Бондом от общего количества взаимодействий')+
  theme_light() +
  theme(plot.title = element_text(size = 10), 
        axis.text.x = element_text(angle = 50, vjust = 1, hjust = 1))

bond_girls %>% 
  ggplot(aes(fct_reorder(name, n), `bond.communication.percent`, group = 1,
             label = `bond.communication.percent`)) +
  geom_line(color = '#E35AE6') +
  geom_point(color = '#AE45B0')+
  labs(x = '',
       y = '',
       title = 'Как менялся процент коммуникации Бонда с девушками от общего количества взаимодействий')+
  theme_light() +
  theme(plot.title = element_text(size = 10), 
        axis.text.x = element_text(angle = 50, vjust = 1, hjust = 1))

