# bond
* В папке visualisation находятся файлы с визуализацией графов из Gephi и графики.
* В папке gephi лежат файлы с проектами в Gephi.
* В папке nodes лежат csv файлы с данными о вершинах сети каждого фильма, а также показатели, посчитанные в Gephi.
* В папке edges лежат csv файлы с данными о ребрах сети каждого фильма и типом коммуникации.
* Файл bond_all.xlsx соответствует гугл-таблице по <code>[ссылке](https://docs.google.com/spreadsheets/d/1rAB35CUga6aaI-hiMEd-yrLaKoRFkXdYLCzOaBQnRlk/edit?usp=sharing)</code> и содержит информацию о характеристике персонажей как узлов сети для всех фильмов.
* Файл bond.xlsx соответствует гугл-таблице по <code>[ссылке](https://docs.google.com/spreadsheets/d/1z6MW96eF04n6cCfLagfSDuMP00PEkOsYDmfTlCd55-4/edit?usp=sharing)</code> и содержит информацию о характеристике М, Манипенни, девушек Бонда и антагонистов как узлов сети.
* В папке R project - файлы и код, с помощью которого делались визуализации для работы.
* В репозитории лежит файл bond.py с кодом для работы с данными о вершинах и ребрах сетей фильмов. Данные считываются из файлов, которые находятся в папках edges и nodes. Информация о персонажах представлена как атрибуты объекта класса: degree, weighted degree, нормированное weighted degree, closeness centrality, betweenness centrality), а также информация о взаимодействиях персонажа и о его или ее появлении в других фильмах. Не требуется дополнительных установок.
