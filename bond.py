from operator import itemgetter


class Film(object):
    def __init__(self, title, translated_title, year, director, characters):
        self.title = title
        self.translated_title = translated_title
        self.year = year
        self.director = director
        self.characters = characters

    def in_film(self):
        return sorted(self.characters)

    def count_characters(self):
        return len(self.characters)

    def common_characters(self, *films):
        c_c = set(self.in_film())
        for film in films:
            c_c &= set(film.in_ilm())
        return list(c_c)

    def all_information(self):
        return dict(self.__dict__.items())

    def get_character(self, name):
        for char in find_character(name):
            if char.film == self.title:
                return char

    def get_all_characters(self):
        char_list = []
        for name in self.characters:
            char_list.append(self.get_character(name))
        return char_list


class Character(object):
    def __init__(self, name, film, gender, degree, weighted_degree, norm_weighted_degree, closeness_centrality,
                 betweenness_centrality, interactions, films):
        self.name = name
        self.film = film
        self.gender = gender
        self.degree = degree
        self.weighted_degree = weighted_degree
        self.norm_weighted_degree = norm_weighted_degree
        self.closeness_centrality = closeness_centrality
        self.betweenness_centrality = betweenness_centrality
        self.interactions = interactions
        self.films = films

    def most_communicated(self):
        """Сортирует связи с другими персонажами в порядке убывания силы связи"""
        interactions = sorted(self.interactions, key=itemgetter(1), reverse=True)
        return interactions

    def get_same_characters(self):
        same_character_list = find_character(self.name)
        for char in same_character_list:
            if char == self:
                same_character_list.remove(char)
                break
        return same_character_list

    def find_interaction_with(self, name):
        interactions = self.interactions
        for pair in interactions:
            if pair[0].name == name:
                return pair

    def all_information(self):
        """Возвращает все поля, но поле с взаимодействиями возвращает как объекты класса"""
        return dict(self.__dict__.items())


def get_data_from_csv(file_name):
    with open(file_name, 'r', encoding='UTF-8') as file:
        text = [line.strip() for line in file.readlines()]
        data = [line.split(';') for line in text]
        return data


def get_character_list(data):
    characters_list = [data[i][0] for i in range(1, len(data))]
    return characters_list


def get_main_characters(character_list):
    sorted_characters = sorted(character_list, key=lambda x: x.weighted_degree, reverse=True)
    return sorted_characters


def get_proper_names(character_list):
    names = []
    for char in character_list:
        if not char.name.islower():
            names.append(char)
    return names


def fill_character(data, film, file_name, films_characters_list):
    with open(file_name, 'r', encoding='UTF-8') as file:
        text = [line.strip() for line in file.readlines()]
        edges = [line.split(',') for line in text]
    characters = []
    for i in range(1, len(data)):
        name = data[i][1]
        film_title = film
        gender = data[i][2]
        degree = float(data[i][3])
        weighted_degree = float(data[i][4])
        norm_weighted_degree = float(data[i][5])
        closeness_centrality = float(data[i][6])
        betweenness_centrality = float(data[i][7])
        interactions = []
        films = []

        char = Character(name, film_title, gender, degree, weighted_degree, norm_weighted_degree, closeness_centrality,
                         betweenness_centrality, interactions, films)
        characters.append(char)
    for char in characters:
        for j in range(1, len(edges)):
            if char.name == edges[j][0]:
                edges[j][0] = char
            elif char.name == edges[j][1]:
                edges[j][1] = char
    for char in characters:
        interactions = []
        for j in range(1, len(edges)):
            if char == edges[j][0]:
                interactions.append([edges[j][1], int(edges[j][6])])
            if char == edges[j][1]:
                interactions.append([edges[j][0], int(edges[j][6])])
        char.interactions = interactions
    films_characters_list.append(characters)
    return characters


def fill_film(data, film_list, film_character_list):
    for line in data:
        nodes = get_data_from_csv(line[4])
        film = Film(line[0], line[1], line[2], line[3], get_character_list(nodes))
        film_list.append(film)
        fill_character(nodes, film.title, line[4].replace('nodes', 'edges').replace('.csv', '_ed.csv'), film_character_list)


def find_film(title):
    global all_films
    for film in all_films:
        if film.title == title:
            return film


def find_character(name):
    global all_films_characters
    char_list = []
    for film in all_films_characters:
        for char in film:
            if char.name == name:
                char_list.append(char)
    return char_list


def find_other_films():
    """Перебирает всех персонажей и создает им атрибут для записи других фильмов в которых появлялся персонаж"""
    global all_films_characters
    for film in all_films_characters:
        for char in film:
            films = []
            name = char.name
            char_list = find_character(name)
            if char_list:
                for other_char in char_list:
                    if char.film != other_char.film:
                        films.append(other_char.film)
                char.films = films


def percent_of_communication(person, another_person_name):
    return round(person.find_interaction_with(another_person_name)[1] / person.weighted_degree, 2)


def find_percent_of_communication_with_bond(person_name):
    person = find_character(person_name)[0]
    person.bond = percent_of_communication(person, 'James Bond')
    james_bond = person.find_interaction_with('James Bond')[0]
    return [person.bond, percent_of_communication(james_bond, person_name)]


all_films_characters = []
all_films = []
fill_film(get_data_from_csv('film_information.csv'), all_films, all_films_characters)
find_other_films()


partners = ['Honey', 'Tania', 'Pussy Galore', 'Dominique', 'Aki', 'Tracy', 'Tiffany', 'Solitaire', 'Goodnight', 'Anya',
            'Holly', 'Melina', 'Octopussy', 'Stacey', 'Kara', 'Pam', 'Natalia', 'Wai Lin', 'Christmas', 'Jinx',
            'Vesper', 'Camille', 'Severine', 'Madeleine']
villain_list = ['Dr. No', 'Grant', 'Kleb', 'Goldfinger', 'Largo', 'Blofeld', 'Kananga', 'Scaramanga', 'Stromberg',
                'Drax',
                'Kristatos', 'Kamal', 'Zorin', 'Koskov', 'Sanchez', 'Alec', 'Carver', 'Elektra', 'Graves (Moon)',
                'Le Chiffre', 'Dominic', 'Silva', 'Safin']

# хочу найти с какими девушками у Джеймса Бонда было больше всего взаимодействий в каждом фильме
jb_list = find_character('James Bond')
jbs_interactions = []
for jb in jb_list:
    communications = jb.most_communicated()
    for i in range(len(communications)):
        if communications[i][0].gender == 'f':
            jbs_interactions.append(communications[i])
            break
jbs_interactions.sort(key=lambda x: x[1], reverse=True)
for i in range(len(jbs_interactions)):
    person = jbs_interactions[i][0]
    # if person.name not in partners:
    #     print('!')
    # print(person.name, jbs_interactions[i][1], person.all_information(), sep='\n')
# print(len(jbs_interactions))

# кто из списка не является девушками Бонда
for i in range(len(jbs_interactions)):
    person = jbs_interactions[i][0]
    # if person.name not in partners:
#         print(person.name, jbs_interactions[i][1], person.all_information(), sep='\n')

# сколько взаимодействий было у Джеймса Бонда с М в разных фильмах
james_bond_list = find_character('James Bond')
james_bond_m_interactions = []
for james_bond in james_bond_list:
    james_bond_m_interactions.append((james_bond.find_interaction_with('M'), james_bond))
for interaction in james_bond_m_interactions:
    m = interaction[0][0]
    m.bond = percent_of_communication(m, 'James Bond')
    james_bond = interaction[1]
    james_bond.m = percent_of_communication(james_bond, 'M')
    #print(m.name, m.film, interaction[0][1], m.bond, james_bond.m)


# какую часть от общей коммуникации в фильме занимает коммуникация с Бондом у девушек
bond_girls = []
bond_relative_interactions_with_girls = []
girls_relative_interactions_with_bond = []
for name in partners:
    bond_girls.extend(find_character(name))
for girl in bond_girls:
    girl.bond = percent_of_communication(girl, 'James Bond')
    main_communication = girl.most_communicated()
    james_bond = main_communication[0][0]
    james_bond.girl = percent_of_communication(james_bond, girl.name)
    # print(girl.name, girl.film, girl.bond, james_bond.girl)

    bond_relative_interactions_with_girls.append(james_bond.girl)
    girls_relative_interactions_with_bond.append(girl.bond)

# print(min(bond_relative_interactions_with_girls),
#       sum(bond_relative_interactions_with_girls)/len(bond_relative_interactions_with_girls),
#       max(bond_relative_interactions_with_girls))
# print(sorted(bond_relative_interactions_with_girls)[len(bond_relative_interactions_with_girls)//2])
# print(min(girls_relative_interactions_with_bond),
#       sum(girls_relative_interactions_with_bond)/len(girls_relative_interactions_with_bond),
#       max(girls_relative_interactions_with_bond))
# print(sorted(girls_relative_interactions_with_bond)[len(girls_relative_interactions_with_bond)//2])


# Кейсы Электры, Номи и М (Скайфолл)
bond_percent = find_percent_of_communication_with_bond('Elektra')
# print('Elektra :', bond_percent[0], 'James Bond', bond_percent[1])

m = find_character('M')[-3]
m.bond = percent_of_communication(m, 'James Bond')
james_bond = m.most_communicated()[0][0]
# print('M :', m.bond, 'James Bond :', percent_of_communication(james_bond, 'M'))

bond_percent = find_percent_of_communication_with_bond('Camille')
# print('Camille :', bond_percent[0], 'James Bond', bond_percent[1])

moneypenny = find_character('Moneypenny')[-3]
moneypenny.bond = percent_of_communication(moneypenny, 'James Bond')
james_bond = moneypenny.most_communicated()[0][0]
# print('Moneypenny :', moneypenny.bond, 'James Bond :', percent_of_communication(james_bond, 'Moneypenny'))

bond_percent = find_percent_of_communication_with_bond('May Day')
# print('May Day :', bond_percent[0], 'James Bond', bond_percent[1])

# какую часть от всех коммуникаций злодея занимает общение с бондом
villains = []
for name in villain_list:
    villains.extend(find_character(name))
for villain in villains:
    # Блофельд встречается во многих фильмах, но не везде он главный злодей, поэтому надо неучитывать лишнее
    if villain.name == 'Blofeld' and villain.film not in ['You Only Live Twice', "On Her Majesty’s Secret Service",
                                                          'Diamonds Are Forever', 'Spectre']:
        villains.remove(villain)
del villains[5]
for villain in villains:
    villain.bond = percent_of_communication(villain, 'James Bond')
    james_bond = villain.find_interaction_with('James Bond')[0]
    james_bond.villain = percent_of_communication(james_bond, villain.name)
    print(villain.name, villain.film, "На Бонда приходится ", villain.bond, "А Бонд тратит", james_bond.villain)
