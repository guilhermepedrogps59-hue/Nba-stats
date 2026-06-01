/*CREATE DATABASE nba_db

USE nba_db;

/*CREATE TABLE times (
    id_time INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    cidade VARCHAR(50),
    conferencia VARCHAR(20)
);

CREATE TABLE temporadas (
    id_temporada INT PRIMARY KEY AUTO_INCREMENT,
    ano_inicio INT NOT NULL,
    ano_fim INT NOT NULL
);

CREATE TABLE jogadores (
    id_jogador INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    idade INT,
    altura DECIMAL(4,2),
    posicao VARCHAR(20),
    id_time INT,

    CONSTRAINT fk_jogador_time
    FOREIGN KEY (id_time)
    REFERENCES times(id_time)
);

CREATE TABLE partidas (
    id_partida INT PRIMARY KEY AUTO_INCREMENT,

    time_casa INT NOT NULL,
    time_visitante INT NOT NULL,

    pontos_casa INT DEFAULT 0,
    pontos_visitante INT DEFAULT 0,

    data_partida DATE,

    id_temporada INT,

    CONSTRAINT fk_time_casa
    FOREIGN KEY (time_casa)
    REFERENCES times(id_time),

    CONSTRAINT fk_time_visitante
    FOREIGN KEY (time_visitante)
    REFERENCES times(id_time),

    CONSTRAINT fk_partida_temporada
    FOREIGN KEY (id_temporada)
    REFERENCES temporadas(id_temporada)
);

CREATE TABLE estatisticas (
    id_estatistica INT PRIMARY KEY AUTO_INCREMENT,

    id_jogador INT NOT NULL,
    id_partida INT NOT NULL,

    pontos INT DEFAULT 0,
    rebotes INT DEFAULT 0,
    assistencias INT DEFAULT 0,
    roubos INT DEFAULT 0,
    tocos INT DEFAULT 0,

    CONSTRAINT fk_est_jogador
    FOREIGN KEY (id_jogador)
    REFERENCES jogadores(id_jogador),

    CONSTRAINT fk_est_partida
    FOREIGN KEY (id_partida)
    REFERENCES partidas(id_partida)
);

CREATE TABLE ranking (
    id_ranking INT PRIMARY KEY AUTO_INCREMENT,

    id_jogador INT NOT NULL,
    id_temporada INT NOT NULL,

    media_pontos DECIMAL(4,1),
    media_rebotes DECIMAL(4,1),
    media_assistencias DECIMAL(4,1),

    CONSTRAINT fk_ranking_jogador
    FOREIGN KEY (id_jogador)
    REFERENCES jogadores(id_jogador),

    CONSTRAINT fk_ranking_temporada
    FOREIGN KEY (id_temporada)
    REFERENCES temporadas(id_temporada)
);

INSERT INTO times (nome, conferencia) VALUES
('Atlanta Hawks', 'Leste'),
('Boston Celtics', 'Leste'),
('Brooklyn Nets', 'Leste'),
('Charlotte Hornets', 'Leste'),
('Chicago Bulls', 'Leste'),
('Cleveland Cavaliers', 'Leste'),
('Detroit Pistons', 'Leste'),
('Indiana Pacers', 'Leste'),
('Miami Heat', 'Leste'),
('Milwaukee Bucks', 'Leste'),
('New York Knicks', 'Leste'),
('Orlando Magic', 'Leste'),
('Philadelphia 76ers', 'Leste'),
('Toronto Raptors', 'Leste'),
('Washington Wizards', 'Leste'),
('Dallas Mavericks', 'Oeste'),
('Denver Nuggets', 'Oeste'),
('Golden State Warriors', 'Oeste'),
('Houston Rockets', 'Oeste'),
('Los Angeles Clippers', 'Oeste'),
('Los Angeles Lakers', 'Oeste'),
('Memphis Grizzlies', 'Oeste'),
('Minnesota Timberwolves', 'Oeste'),
('New Orleans Pelicans', 'Oeste'),
('Oklahoma City Thunder', 'Oeste'),
('Phoenix Suns', 'Oeste'),
('Portland Trail Blazers', 'Oeste'),
('Sacramento Kings', 'Oeste'),
('San Antonio Spurs', 'Oeste'),
('Utah Jazz', 'Oeste');

INSERT INTO temporadas (ano_inicio, ano_fim) VALUES 
(2024, 2025), -- id_temporada = 1
(2025, 2026); -- id_temporada = 2

INSERT INTO jogadores (nome, idade, altura, posicao, id_time) VALUES 
('Giannis Antetokounmpo', 31, 2.11, 'Ala-Pivô', 10),
('Precious Achiuwa', 26, 2.03, 'Ala-Pivô', 11),
('Steven Adams', 32, 2.11, 'Pivô', 19),
('Bam Adebayo', 28, 2.06, 'Pivô', 9),
('Ochai Agbaji', 26, 1.96, 'Ala', 14),
('Santi Aldama', 25, 2.11, 'Ala-Pivô', 22),
('Trey Alexander', 21, 1.93, 'Armador', 24),
('Nickeil Alexander-Walker', 27, 1.96, 'Ala-Armador', 23),
('Grayson Allen', 30, 1.93, 'Ala-Armador', 26),
('Jarrett Allen', 28, 2.11, 'Pivô', 6),
('Jose Alvarado', 28, 1.83, 'Armador', 24),
('Kyle Anderson', 32, 2.06, 'Ala', 20),
('Alex Antetokounmpo', 24, 2.03, 'Ala', 10),
('Thanasis Antetokounmpo', 33, 2.01, 'Ala', 10),
('Cole Anthony', 26, 1.88, 'Armador', 12),
('OG Anunoby', 28, 2.01, 'Ala', 11),
('Deni Avdija', 25, 2.06, 'Ala', 27),
('Deandre Ayton', 27, 2.13, 'Pivô', 27),
('Marvin Bagley III', 27, 2.08, 'Ala-Pivô', 15),
('Ace Bailey', 19, 2.08, 'Ala', 3),
('LaMelo Ball', 24, 2.01, 'Armador', 4),
('Lonzo Ball', 28, 1.98, 'Armador', 5),
('Paolo Banchero', 23, 2.08, 'Ala-Pivô', 12),
('Desmond Bane', 27, 1.96, 'Ala-Armador', 22),
('Dominick Barlow', 22, 2.06, 'Ala-Pivô', 1),
('Harrison Barnes', 34, 2.03, 'Ala', 29),
('Scottie Barnes', 24, 2.01, 'Ala-Pivô', 14),
('Brooks Barnhizer', 22, 1.98, 'Ala-Armador', 30),
('RJ Barrett', 25, 1.98, 'Ala', 14),
('Charles Bassey', 25, 2.06, 'Pivô', 29),
('Tamar Bates', 22, 1.96, 'Ala-Armador', 8),
('Jamison Battle', 25, 2.01, 'Ala', 14),
('Nicolas Batum', 37, 2.03, 'Ala', 20),
('Bradley Beal', 32, 1.93, 'Ala-Armador', 26),
('Joan Beringer', 19, 2.06, 'Pivô', 14),
('Saddiq Bey', 26, 2.01, 'Ala', 15),
('Goga Bitadze', 26, 2.11, 'Pivô', 12),
('Bismack Biyombo', 33, 2.03, 'Pivô', 22),
('Anthony Black', 22, 2.01, 'Armador', 12),
('Bogdan Bogdanović', 33, 1.96, 'Ala-Armador', 1),
('Adem Bona', 22, 2.08, 'Pivô', 13),
('Devin Booker', 29, 1.96, 'Ala-Armador', 26),
('Chris Boucher', 33, 2.06, 'Ala-Pivô', 14),
('Tony Bradley', 28, 2.08, 'Pivô', 5),
('Malaki Branham', 22, 1.96, 'Ala-Armador', 29),
('Christian Braun', 25, 1.98, 'Ala-Armador', 17),
('Koby Brea', 23, 1.98, 'Ala-Armador', 8),
('Mikal Bridges', 28, 1.98, 'Ala', 11),
('Miles Bridges', 28, 2.01, 'Ala-Pivô', 4),
('Dillon Brooks', 29, 1.98, 'Ala', 19);

INSERT INTO jogadores (nome, idade, altura, posicao, id_time) VALUES 
('Javonte Cooke', 26, 1.98, 'Ala-Armador', 13),
('Sharife Cooper', 24, 1.85, 'Armador', 6),
('Bilal Coulibaly', 21, 2.03, 'Ala', 15),
('Cedric Coward', 23, 1.98, 'Ala', 21),
('Isaiah Crawford', 24, 1.98, 'Ala', 24),
('Cade Cunningham', 24, 1.98, 'Armador', 7),
('Stephen Curry', 38, 1.88, 'Armador', 18),
('Pacôme Dadiet', 20, 2.03, 'Ala', 11),
('Dyson Daniels', 23, 2.01, 'Ala-Armador', 1),
('N\'Faly Dante', 24, 2.11, 'Pivô', 19),
('Anthony Davis', 33, 2.08, 'Pivô', 21),
('JD Davison', 23, 1.85, 'Armador', 2),
('DeMar DeRozan', 36, 1.98, 'Ala', 28),
('RayJ Dennis', 25, 1.88, 'Armador', 20),
('Donte DiVincenzo', 29, 1.93, 'Ala-Armador', 23),
('Moussa Diabaté', 24, 2.08, 'Ala-Pivô', 4),
('Mohamed Diawara', 21, 2.01, 'Ala', 25),
('Gradey Dick', 22, 1.98, 'Ala-Armador', 14),
('Hunter Dickinson', 25, 2.18, 'Pivô', 18),
('Ousmane Dieng', 23, 2.08, 'Ala', 25),
('Rob Dillingham', 21, 1.85, 'Armador', 23),
('Luka Dončić', 27, 2.01, 'Armador', 16),
('Luguentz Dort', 27, 1.93, 'Ala', 25),
('Ayo Dosunmu', 26, 1.96, 'Ala-Armador', 5),
('Andre Drummond', 32, 2.11, 'Pivô', 13),
('Kris Dunn', 32, 1.91, 'Armador', 20),
('Ryan Dunn', 23, 2.03, 'Ala', 26),
('Kevin Durant', 37, 2.11, 'Ala', 26),
('Jalen Duren', 22, 2.08, 'Pivô', 7),
('Egor Dëmin', 20, 2.06, 'Armador', 17),
('Tari Eason', 25, 2.03, 'Ala', 19),
('Zach Edey', 24, 2.24, 'Pivô', 22),
('VJ Edgecombe', 20, 1.96, 'Ala-Armador', 4),
('Anthony Edwards', 24, 1.93, 'Ala-Armador', 23),
('Justin Edwards', 22, 2.03, 'Ala', 13),
('Keon Ellis', 26, 1.91, 'Ala-Armador', 28),
('Joel Embiid', 32, 2.13, 'Pivô', 13),
('Noa Essengue', 19, 2.06, 'Ala-Pivô', 29),
('Tyson Etienne', 26, 1.88, 'Armador', 1),
('Drew Eubanks', 29, 2.08, 'Pivô', 30),
('Tosan Evbuomwan', 25, 2.01, 'Ala', 20),
('Danté Exum', 30, 1.96, 'Armador', 16),
('Jeremiah Fears', 21, 1.91, 'Armador', 12),
('Kyle Filipowski', 22, 2.13, 'Pivô', 30),
('Dorian Finney-Smith', 33, 2.01, 'Ala', 3),
('Cooper Flagg', 19, 2.06, 'Ala', 2),
('Rasheer Fleming', 21, 2.06, 'Ala-Pivô', 13),
('Trentyn Flowers', 21, 2.01, 'Ala', 20),
('Simone Fontecchio', 30, 2.01, 'Ala', 7),
('De\'Aaron Fox', 28, 1.91, 'Armador', 28),
('Enrique Freeman', 25, 2.01, 'Ala-Pivô', 8),
('Johnny Furphy', 21, 2.06, 'Ala', 8),
('Daniel Gafford', 27, 2.08, 'Pivô', 16),
('Myron Gardner', 25, 1.98, 'Ala', 12),
('Darius Garland', 26, 1.85, 'Armador', 6),
('Luka Garza', 27, 2.08, 'Pivô', 23),
('Keyonte George', 22, 1.93, 'Armador', 30),
('Kyshawn George', 22, 2.03, 'Ala', 15),
('Paul George', 36, 2.03, 'Ala', 13),
('Josh Giddey', 23, 2.03, 'Armador', 5),
('Shai Gilgeous-Alexander', 27, 1.98, 'Armador', 25),
('Anthony Gill', 33, 2.03, 'Ala-Pivô', 15),
('Collin Gillespie', 26, 1.85, 'Armador', 26),
('Rudy Gobert', 33, 2.16, 'Pivô', 23),
('Vladislav Goldin', 25, 2.16, 'Pivô', 4),
('Hugo González', 20, 1.98, 'Ala', 29),
('Jordan Goodwin', 27, 1.93, 'Armador', 21),
('Aaron Gordon', 30, 2.03, 'Ala-Pivô', 17),
('Eric Gordon', 37, 1.91, 'Ala-Armador', 13),
('Jerami Grant', 32, 2.01, 'Ala', 27),
('AJ Green', 26, 1.93, 'Ala-Armador', 10),
('Draymond Green', 36, 1.98, 'Ala-Pivô', 18),
('Jalen Green', 24, 1.93, 'Ala-Armador', 19),
('Javonte Green', 32, 1.96, 'Ala', 24),
('Jeff Green', 39, 2.03, 'Ala-Pivô', 19),
('Josh Green', 25, 1.96, 'Ala-Armador', 4),
('Quentin Grimes', 26, 1.96, 'Ala-Armador', 16),
('Mouhamed Gueye', 23, 2.08, 'Ala-Pivô', 1),
('Rui Hachimura', 28, 2.03, 'Ala-Pivô', 21),
('Tyrese Haliburton', 26, 1.96, 'Armador', 8),
('PJ Hall', 24, 2.06, 'Pivô', 17),
('Tim Hardaway Jr.', 34, 1.96, 'Ala-Armador', 7),
('James Harden', 36, 1.96, 'Armador', 20),
('Jaden Hardy', 23, 1.91, 'Armador', 16),
('Elijah Harkless', 26, 1.91, 'Armador', 20),
('Dylan Harper', 20, 1.98, 'Armador', 11),
('Ron Harper Jr.', 26, 1.98, 'Ala', 2),
('Gary Harris', 31, 1.93, 'Ala-Armador', 12),
('Kevon Harris', 28, 1.96, 'Ala-Armador', 20),
('Tobias Harris', 33, 2.03, 'Ala', 7),
('Josh Hart', 31, 1.93, 'Ala', 11),
('Isaiah Hartenstein', 28, 2.13, 'Pivô', 25),
('Sam Hauser', 28, 2.01, 'Ala', 2),
('Jordan Hawkins', 24, 1.96, 'Ala-Armador', 24),
('Jaxson Hayes', 26, 2.13, 'Pivô', 21),
('Nigel Hayes-Davis', 31, 2.03, 'Ala', 16),
('Scoot Henderson', 22, 1.91, 'Armador', 27),
('Taylor Hendricks', 22, 2.06, 'Ala-Pivô', 30);

INSERT INTO jogadores (nome, idade, altura, posicao, id_time) VALUES 
('Chucky Hepburn', 23, 1.88, 'Armador', 7),
('Tyler Herro', 26, 1.96, 'Ala-Armador', 9),
('Buddy Hield', 33, 1.93, 'Ala-Armador', 18),
('Haywood Highsmith', 29, 2.01, 'Ala', 9),
('Aaron Holiday', 29, 1.83, 'Armador', 19),
('Jrue Holiday', 35, 1.93, 'Armador', 2),
('Ronald Holland II', 20, 2.03, 'Ala', 7),
('DaRon Holmes II', 23, 2.08, 'Ala-Pivô', 17),
('Chet Holmgren', 24, 2.16, 'Pivô', 25),
('Al Horford', 39, 2.06, 'Pivô', 2),
('Caleb Houstan', 23, 2.03, 'Ala', 12),
('Jett Howard', 22, 2.03, 'Ala', 12),
('Kevin Huerter', 27, 2.01, 'Ala-Armador', 28),
('Jay Huff', 28, 2.16, 'Pivô', 22),
('Ariel Hukporti', 24, 2.13, 'Pivô', 11),
('De\'Andre Hunter', 28, 2.03, 'Ala', 1),
('CJ Huntley', 24, 2.08, 'Ala-Pivô', 1),
('Bones Hyland', 25, 1.88, 'Armador', 20),
('Oso Ighodaro', 24, 2.08, 'Pivô', 26),
('Joe Ingles', 38, 2.06, 'Ala', 23),
('Brandon Ingram', 28, 2.03, 'Ala', 24),
('Harrison Ingram', 23, 1.98, 'Ala', 29),
('Kyrie Irving', 34, 1.88, 'Armador', 16),
('Jonathan Isaac', 28, 2.08, 'Ala-Pivô', 12),
('Jaden Ivey', 24, 1.93, 'Armador', 7),
('GG Jackson', 21, 2.06, 'Ala-Pivô', 22),
('Isaiah Jackson', 24, 2.08, 'Pivô', 8),
('Quenton Jackson', 24, 1.96, 'Ala-Armador', 8),
('Andre Jackson Jr.', 24, 1.98, 'Ala', 10),
('Jaren Jackson Jr.', 26, 2.11, 'Pivô', 22),
('Trayce Jackson-Davis', 26, 2.06, 'Pivô', 18),
('Kasparas Jakučionis', 20, 1.96, 'Armador', 5),
('Bronny James', 21, 1.88, 'Armador', 21),
('LeBron James', 41, 2.06, 'Ala', 21),
('Sion James', 23, 1.98, 'Ala-Armador', 2),
('Jaime Jaquez Jr.', 25, 1.98, 'Ala', 9),
('Trey Jemison III', 26, 2.11, 'Pivô', 24),
('Daniss Jenkins', 24, 1.93, 'Armador', 7),
('Ty Jerome', 28, 1.96, 'Armador', 6),
('Isaiah Joe', 26, 1.91, 'Ala-Armador', 25),
('AJ Johnson', 21, 1.96, 'Armador', 10),
('Cameron Johnson', 30, 2.03, 'Ala', 3),
('Jalen Johnson', 24, 2.03, 'Ala-Pivô', 1),
('Keldon Johnson', 26, 1.96, 'Ala', 29),
('Keshad Johnson', 25, 2.01, 'Ala', 9),
('Tre Johnson', 20, 1.98, 'Ala-Armador', 16),
('Nikola Jokić', 31, 2.11, 'Pivô', 17),
('Colby Jones', 23, 1.98, 'Ala-Armador', 28),
('Curtis Jones', 24, 1.96, 'Armador', 14),
('Herbert Jones', 27, 2.01, 'Ala', 24),
('Isaac Jones', 25, 2.06, 'Ala-Pivô', 28),
('Kam Jones', 23, 1.96, 'Ala-Armador', 10),
('Spencer Jones', 25, 2.01, 'Ala', 17),
('Tre Jones', 26, 1.85, 'Armador', 29),
('Tyus Jones', 30, 1.85, 'Armador', 26),
('David Jones Garcia', 24, 1.98, 'Ala', 13),
('Derrick Jones Jr.', 29, 1.98, 'Ala', 20),
('DeAndre Jordan', 37, 2.11, 'Pivô', 17),
('Nikola Jović', 22, 2.08, 'Ala-Pivô', 9),
('Johnny Juzang', 25, 1.96, 'Ala-Armador', 30),
('Ryan Kalkbrenner', 24, 2.16, 'Pivô', 11),
('Miles Kelly', 23, 1.98, 'Ala-Armador', 1),
('Luke Kennard', 29, 1.96, 'Ala-Armador', 22),
('Walker Kessler', 24, 2.13, 'Pivô', 30),
('Corey Kispert', 27, 1.98, 'Ala', 15),
('Maxi Kleber', 34, 2.08, 'Ala-Pivô', 16),
('Bobi Klintman', 23, 2.06, 'Ala', 7),
('Dalton Knecht', 25, 1.98, 'Ala', 21),
('Kon Knueppel', 20, 2.01, 'Ala', 2),
('Tyler Kolek', 25, 1.91, 'Armador', 11),
('Christian Koloko', 25, 2.16, 'Pivô', 21),
('John Konchar', 28, 1.96, 'Ala-Armador', 22),
('Luke Kornet', 30, 2.16, 'Pivô', 2),
('Vít Krejčí', 25, 2.03, 'Armador', 1),
('Jonathan Kuminga', 23, 2.01, 'Ala-Pivô', 18),
('Kyle Kuzma', 30, 2.06, 'Ala', 15),
('Jake LaRavia', 24, 2.01, 'Ala', 22),
('Zach LaVine', 31, 1.96, 'Ala-Armador', 5),
('Jock Landale', 30, 2.11, 'Pivô', 19),
('Chaz Lanier', 24, 1.93, 'Ala-Armador', 14),
('Pelle Larsson', 25, 1.96, 'Ala', 9),
('A.J. Lawson', 25, 1.98, 'Ala-Armador', 16),
('Caris LeVert', 31, 1.98, 'Ala-Armador', 6),
('Kawhi Leonard', 34, 2.01, 'Ala', 20),
('E.J. Liddell', 25, 2.01, 'Ala-Pivô', 5),
('Damian Lillard', 35, 1.88, 'Armador', 10),
('Dereck Lively II', 22, 2.16, 'Pivô', 16),
('Isaiah Livers', 27, 1.98, 'Ala', 3),
('Chris Livingston', 22, 1.98, 'Ala', 10),
('Kevon Looney', 30, 2.06, 'Pivô', 18),
('Brook Lopez', 38, 2.16, 'Pivô', 10),
('Caleb Love', 24, 1.93, 'Armador', 19),
('Kevin Love', 37, 2.03, 'Ala-Pivô', 9),
('Kyle Lowry', 40, 1.83, 'Armador', 13),
('Khaman Maluach', 19, 2.18, 'Pivô', 2),
('Sandro Mamukelashvili', 26, 2.08, 'Ala-Pivô', 29),
('Terance Mann', 29, 1.96, 'Ala-Armador', 20),
('Tre Mann', 25, 1.91, 'Armador', 4),
('Lauri Markkanen', 29, 2.13, 'Ala-Pivô', 30),
('Naji Marshall', 28, 2.01, 'Ala', 16),
('Alijah Martin', 24, 1.88, 'Armador', 12),
('Caleb Martin', 30, 1.96, 'Ala', 13),
('Cody Martin', 30, 1.96, 'Ala', 4),
('Tyrese Martin', 26, 1.98, 'Ala-Armador', 3),
('Bennedict Mathurin', 23, 1.96, 'Ala-Armador', 8),
('Karlo Matković', 25, 2.08, 'Pivô', 24),
('Tyrese Maxey', 25, 1.88, 'Armador', 13),
('Chris Mañon', 24, 1.96, 'Ala-Armador', 11),
('Miles McBride', 25, 1.88, 'Armador', 11),
('Jared McCain', 22, 1.91, 'Armador', 13),
('Mac McClung', 27, 1.88, 'Armador', 12),
('CJ McCollum', 34, 1.91, 'Ala-Armador', 24),
('T.J. McConnell', 34, 1.85, 'Armador', 8),
('Kevin McCullar Jr.', 25, 1.98, 'Ala', 11),
('Jaden McDaniels', 25, 2.06, 'Ala', 23),
('Doug McDermott', 34, 1.98, 'Ala', 28),
('Bryce McGowens', 23, 2.01, 'Ala-Armador', 4),
('Jordan McLaughlin', 30, 1.83, 'Armador', 28),
('Liam McNeeley', 20, 2.01, 'Ala', 16);

INSERT INTO jogadores (nome, idade, altura, posicao, id_time) VALUES 
('De\'Anthony Melton', 28, 1.91, 'Armador', 18),
('Sam Merrill', 30, 1.93, 'Ala-Armador', 6),
('Khris Middleton', 34, 2.01, 'Ala', 10),
('Brandon Miller', 23, 2.06, 'Ala', 4),
('Emanuel Miller', 25, 2.01, 'Ala', 16),
('Jordan Miller', 25, 1.96, 'Ala', 20),
('Leonard Miller', 22, 2.08, 'Ala-Pivô', 23),
('Riley Minix', 25, 2.01, 'Ala', 29),
('Josh Minott', 23, 2.03, 'Ala', 23),
('Yves Missi', 22, 2.13, 'Pivô', 24),
('Ajay Mitchell', 23, 1.96, 'Armador', 25),
('Davion Mitchell', 27, 1.83, 'Armador', 14),
('Donovan Mitchell', 29, 1.91, 'Ala-Armador', 6),
('Evan Mobley', 24, 2.11, 'Ala-Pivô', 6),
('Jonathan Mogbo', 24, 2.03, 'Ala-Pivô', 14),
('Malik Monk', 28, 1.91, 'Ala-Armador', 28),
('Moses Moody', 23, 1.96, 'Ala-Armador', 18),
('Wendell Moore Jr.', 24, 1.96, 'Ala-Armador', 7),
('Ja Morant', 26, 1.88, 'Armador', 22),
('Monté Morris', 30, 1.88, 'Armador', 26),
('Trey Murphy III', 25, 2.03, 'Ala', 24),
('Dejounte Murray', 29, 1.96, 'Armador', 24),
('Jamal Murray', 29, 1.93, 'Armador', 17),
('Keegan Murray', 25, 2.03, 'Ala', 28),
('Kris Murray', 25, 2.03, 'Ala', 27),
('Collin Murray-Boyles', 21, 2.01, 'Ala-Pivô', 13),
('Svi Mykhailiuk', 28, 2.01, 'Ala-Armador', 3),
('Pete Nance', 26, 2.08, 'Ala-Pivô', 6),
('Larry Nance Jr.', 33, 2.03, 'Pivô', 1),
('Eli John Ndiaye', 21, 2.05, 'Pivô', 29),
('Andrew Nembhard', 26, 1.91, 'Armador', 8),
('Ryan Nembhard', 23, 1.83, 'Armador', 30),
('Aaron Nesmith', 26, 1.96, 'Ala', 8),
('Asa Newell', 20, 2.06, 'Ala-Pivô', 4),
('Georges Niang', 32, 2.01, 'Ala-Pivô', 6),
('Yanic Konan Niederhäuser', 22, 2.11, 'Pivô', 1),
('Zeke Nnaji', 25, 2.06, 'Ala-Pivô', 17),
('Jusuf Nurkić', 31, 2.13, 'Pivô', 26),
('Royce O\'Neale', 32, 1.98, 'Ala', 26),
('Josh Okogie', 27, 1.93, 'Ala', 26),
('Onyeka Okongwu', 25, 2.08, 'Pivô', 1),
('Isaac Okoro', 25, 1.96, 'Ala-Armador', 6),
('Lachlan Olbrich', 22, 2.08, 'Pivô', 27),
('Kelly Olynyk', 35, 2.11, 'Pivô', 14),
('Kelly Oubre Jr.', 30, 2.01, 'Ala', 13),
('Chris Paul', 41, 1.83, 'Armador', 29),
('Gary Payton II', 33, 1.88, 'Armador', 18),
('Micah Peavy', 24, 2.01, 'Ala-Armador', 19),
('Noah Penda', 21, 2.01, 'Ala', 2),
('Taelon Peter', 23, 1.93, 'Ala-Armador', 12),
('Drew Peterson', 26, 2.06, 'Ala', 2),
('Julian Phillips', 22, 2.03, 'Ala', 5),
('Jalen Pickett', 26, 1.93, 'Armador', 17),
('Scotty Pippen Jr.', 25, 1.85, 'Armador', 22),
('Daeqwon Plowden', 27, 1.98, 'Ala', 1),
('Mason Plumlee', 36, 2.08, 'Pivô', 26),
('Brandin Podziemski', 23, 1.96, 'Ala-Armador', 18),
('Jakob Poeltl', 30, 2.13, 'Pivô', 14),
('Jordan Poole', 26, 1.93, 'Armador', 15),
('Craig Porter Jr.', 26, 1.88, 'Armador', 6),
('Kevin Porter Jr.', 26, 1.93, 'Armador', 20),
('Michael Porter Jr.', 27, 2.08, 'Ala', 17),
('Bobby Portis', 31, 2.08, 'Ala-Pivô', 10),
('Kristaps Porziņģis', 30, 2.21, 'Pivô', 2),
('Quinten Post', 26, 2.13, 'Pivô', 18),
('Drake Powell', 20, 1.98, 'Ala', 11),
('Dwight Powell', 34, 2.08, 'Pivô', 16),
('Norman Powell', 33, 1.93, 'Ala-Armador', 20),
('Taurean Prince', 32, 1.98, 'Ala', 10),
('Payton Pritchard', 28, 1.85, 'Armador', 2),
('Tyrese Proctor', 22, 1.96, 'Armador', 2),
('Olivier-Maxence Prosper', 23, 2.03, 'Ala', 16),
('Derik Queen', 21, 2.08, 'Pivô', 15),
('Neemias Queta', 26, 2.13, 'Pivô', 2),
('Immanuel Quickley', 26, 1.88, 'Armador', 14),
('Julius Randle', 31, 2.03, 'Ala-Pivô', 23),
('Maxime Raynaud', 23, 2.16, 'Pivô', 3),
('Duop Reath', 29, 2.06, 'Pivô', 27),
('Austin Reaves', 27, 1.96, 'Ala-Armador', 21),
('Paul Reed', 26, 2.06, 'Ala-Pivô', 7),
('Antonio Reeves', 25, 1.96, 'Ala-Armador', 24),
('Naz Reid', 26, 2.06, 'Pivô', 23),
('Will Richard', 23, 1.96, 'Ala', 9),
('Nick Richards', 28, 2.11, 'Pivô', 4),
('Jase Richardson', 20, 1.91, 'Armador', 10),
('Will Riley', 20, 2.03, 'Ala', 14),
('Zaccharie Risacher', 21, 2.06, 'Ala', 1),
('Duncan Robinson', 32, 2.01, 'Ala-Armador', 9),
('Mitchell Robinson', 28, 2.13, 'Pivô', 11),
('Orlando Robinson', 25, 2.08, 'Pivô', 19),
('Jeremiah Robinson-Earl', 25, 2.03, 'Ala-Pivô', 24),
('Ryan Rollins', 23, 1.91, 'Armador', 10),
('Jackson Rowe', 29, 2.01, 'Ala-Pivô', 18),
('Terry Rozier', 32, 1.85, 'Armador', 9),
('Rayan Rupert', 21, 1.98, 'Ala', 27),
('D\'Angelo Russell', 30, 1.91, 'Armador', 21),
('Domantas Sabonis', 30, 2.08, 'Pivô', 28),
('Tidjane Salaün', 20, 2.06, 'Ala', 4),
('Hunter Sallis', 23, 1.96, 'Ala-Armador', 4),
('Kobe Sanders', 23, 2.03, 'Armador', 27),
('Gui Santos', 23, 1.98, 'Ala', 18),
('Ben Saraf', 20, 1.98, 'Armador', 30),
('Alex Sarr', 21, 2.13, 'Pivô', 15),
('Marcus Sasser', 25, 1.88, 'Armador', 7),
('Baylor Scheierman', 25, 1.98, 'Ala', 2),
('Dennis Schröder', 32, 1.85, 'Armador', 3),
('Mark Sears', 24, 1.85, 'Armador', 8),
('Alperen Sengun', 23, 2.11, 'Pivô', 19),
('Brice Sensabaugh', 22, 1.96, 'Ala', 30),
('Collin Sexton', 27, 1.91, 'Armador', 30),
('Landry Shamet', 29, 1.93, 'Ala-Armador', 15),
('Terrence Shannon Jr.', 25, 1.98, 'Ala-Armador', 23),
('Day\'Ron Sharpe', 24, 2.06, 'Pivô', 3),
('Shaedon Sharpe', 22, 1.96, 'Ala-Armador', 27),
('Jamal Shead', 23, 1.85, 'Armador', 14),
('Ben Sheppard', 23, 1.98, 'Ala-Armador', 8),
('Reed Sheppard', 21, 1.91, 'Armador', 19),
('Max Shulga', 23, 1.93, 'Ala-Armador', 5),
('Pascal Siakam', 32, 2.03, 'Ala-Pivô', 8),
('Anfernee Simons', 26, 1.91, 'Armador', 27),
('KJ Simpson', 23, 1.85, 'Armador', 4),
('Jericho Sims', 27, 2.08, 'Pivô', 11),
('Javon Small', 23, 1.88, 'Armador', 15),
('Marcus Smart', 32, 1.91, 'Armador', 22),
('Dru Smith', 28, 1.91, 'Armador', 9),
('Jalen Smith', 26, 2.08, 'Pivô', 5),
('Tolu Smith', 25, 2.11, 'Pivô', 7),
('Jabari Smith Jr.', 23, 2.11, 'Ala-Pivô', 19),
('Nick Smith Jr.', 22, 1.93, 'Armador', 4),
('Jeremy Sochan', 23, 2.03, 'Ala-Pivô', 29),
('Thomas Sorber', 20, 2.08, 'Pivô', 13),
('Cam Spencer', 26, 1.93, 'Ala-Armador', 22),
('Pat Spencer', 29, 1.91, 'Armador', 18),
('Isaiah Stevens', 25, 1.83, 'Armador', 9),
('Isaiah Stewart', 25, 2.03, 'Pivô', 7),
('Julian Strawther', 24, 1.98, 'Ala', 17),
('Max Strus', 30, 1.96, 'Ala', 6),
('Jalen Suggs', 24, 1.96, 'Armador', 12),
('Jae\'Sean Tate', 30, 1.93, 'Ala', 19),
('Jayson Tatum', 28, 2.03, 'Ala', 2);

INSERT INTO partidas (time_casa, time_visitante, pontos_casa, pontos_visitante, data_partida, id_temporada) VALUES 
(1, 2, 115, 110, '2025-01-15', 1), -- id_partida = 1 (Lakers venceu Warriors em casa)
(3, 4, 102, 108, '2025-01-20', 1), -- id_partida = 2 (Bucks venceu Celtics fora)
(2, 3, 120, 118, '2025-02-05', 1); -- id_partida = 3 (Warriors venceu Celtics em casa)

-- Estatísticas da Partida : Lakers vs Warriors
INSERT INTO estatisticas (id_jogador, id_partida, pontos, rebotes, assistencias, roubos, tocos) VALUES 
(1, 1, 28, 7, 9, 2, 1),  -- LeBron James na partida 
(2, 1, 24, 12, 3, 1, 4), -- Anthony Davis na partida 
(3, 1, 35, 4, 6, 1, 0);  -- Stephen Curry na partida 

INSERT INTO ranking (id_jogador, id_temporada, media_pontos, media_rebotes, media_assistencias) VALUES 
(1, 1, 25.2, 7.3, 8.1), -- Médias do LeBron na temporada 1
(3, 1, 27.5, 4.5, 6.3), -- Médias do Curry na temporada 1
(5, 1, 30.4, 11.2, 5.8);-- Médias do Giannis na temporada 1

-- JOIN Jogadores + Times

SELECT 
    j.id_jogador,
    j.nome AS jogador,
    j.idade,
    j.altura,
    j.posicao,
    t.nome AS time,
    t.conferencia
FROM jogadores j
INNER JOIN times t
ON j.id_time = t.id_time;


-- =========================================================================
-- JOIN Partidas + Times
-- =========================================================================
SELECT 
    p.id_partida,
    tc.nome AS time_casa,
    tv.nome AS time_visitante,
    p.pontos_casa,
    p.pontos_visitante,
    p.data_partida,
    temp.ano_inicio,
    temp.ano_fim
FROM partidas p
INNER JOIN times tc
ON p.time_casa = tc.id_time
INNER JOIN times tv
ON p.time_visitante = tv.id_time
INNER JOIN temporadas temp
ON p.id_temporada = temp.id_temporada;


-- =========================================================================
-- JOIN Estatísticas + Jogadores + Partidas
-- =========================================================================
SELECT 
    e.id_estatistica,
    j.nome AS jogador,
    p.id_partida,
    e.pontos,
    e.rebotes,
    e.assistencias,
    e.roubos,
    e.tocos
FROM estatisticas e
INNER JOIN jogadores j
ON e.id_jogador = j.id_jogador
INNER JOIN partidas p
ON e.id_partida = p.id_partida;


-- =========================================================================
-- JOIN Ranking + Jogadores + Temporadas
-- =========================================================================
SELECT 
    r.id_ranking,
    j.nome AS jogador,
    temp.ano_inicio,
    temp.ano_fim,
    r.media_pontos,
    r.media_rebotes,
    r.media_assistencias
FROM ranking r
INNER JOIN jogadores j
ON r.id_jogador = j.id_jogador
INNER JOIN temporadas temp
ON r.id_temporada = temp.id_temporada;

SELECT 
    jogadores.nome AS jogador,
    times.nome AS time
FROM jogadores
JOIN times
ON jogadores.id_time = times.id_time;*/


 /*   UPDATE jogadores SET id_time = 16 WHERE nome = 'Cooper Flagg'; -- Mavericks
UPDATE jogadores SET id_time = 21 WHERE nome = 'Dorian Finney-Smith'; -- Lakers
UPDATE jogadores SET id_time = 20 WHERE nome = 'Bogdan Bogdanović'; -- Clippers
UPDATE jogadores SET id_time = 20 WHERE nome = 'Ben Simmons'; -- Clippers
UPDATE jogadores SET id_time = 15 WHERE nome = 'CJ McCollum'; -- Wizards
UPDATE jogadores SET id_time = 14 WHERE nome = 'Brandon Ingram'; -- Raptors
UPDATE jogadores SET id_time = 15 WHERE nome = 'Marcus Smart'; -- Wizards
UPDATE jogadores SET id_time = 21 WHERE nome = 'Jake LaRavia'; -- Lakers
UPDATE jogadores SET id_time = 18 WHERE nome = 'Dennis Schröder'; -- Warriors
UPDATE jogadores SET id_time = 4 WHERE nome = 'Jusuf Nurkić'; -- Hornets
UPDATE jogadores SET id_time = 29 WHERE nome = 'De''Aaron Fox'; -- Spurs
UPDATE jogadores SET id_time = 29 WHERE nome = 'Harrison Barnes'; -- Spurs
UPDATE jogadores SET id_time = 20 WHERE nome = 'Kris Dunn'; -- Clippers
UPDATE jogadores SET id_time = 5 WHERE nome = 'Zach LaVine'; -- Bulls
UPDATE jogadores SET id_time = 28 WHERE nome = 'DeMar DeRozan'; -- Kings
UPDATE jogadores SET id_time = 21 WHERE nome = 'Bronny James'; -- Lakers
UPDATE jogadores SET id_time = 18 WHERE nome = 'Buddy Hield'; -- Warriors
UPDATE jogadores SET id_time = 18 WHERE nome = 'Kyle Anderson'; -- Warriors
UPDATE jogadores SET id_time = 13 WHERE nome = 'Paul George'; -- 76ers
UPDATE jogadores SET id_time = 23 WHERE nome = 'Donte DiVincenzo'; -- Timberwolves
UPDATE jogadores SET id_time = 11 WHERE nome = 'Mikal Bridges'; -- Knicks
UPDATE jogadores SET id_time = 6 WHERE nome = 'Caris LeVert'; -- Cavaliers
UPDATE jogadores SET id_time = 1 WHERE nome = 'Dyson Daniels'; -- Hawks
UPDATE jogadores SET id_time = 19 WHERE nome = 'Dillon Brooks'; -- Rockets
UPDATE jogadores SET id_time = 24 WHERE nome = 'Dejounte Murray'; -- Pelicans
UPDATE jogadores SET id_time = 25 WHERE nome = 'Isaiah Hartenstein'; -- Thunder
UPDATE jogadores SET id_time = 16 WHERE nome = 'Quentin Grimes'; -- Mavericks
UPDATE jogadores SET id_time = 13 WHERE nome = 'Caleb Martin'; -- 76ers
UPDATE jogadores SET id_time = 18 WHERE nome = 'De''Anthony Melton'; -- Warriors
UPDATE jogadores SET id_time = 28 WHERE nome = 'Doug McDermott'; -- Kings
UPDATE jogadores SET id_time = 26 WHERE nome = 'Monte Morris'; -- Suns
UPDATE jogadores SET id_time = 11 WHERE nome = 'Miles McBride'; -- Knicks
UPDATE jogadores SET id_time = 14 WHERE nome = 'Kelly Olynyk'; -- Raptors
UPDATE jogadores SET id_time = 15 WHERE nome = 'Jordan Poole'; -- Wizards
UPDATE jogadores SET id_time = 10 WHERE nome = 'Taurean Prince'; -- Bucks
UPDATE jogadores SET id_time = 2 WHERE nome = 'Neemias Queta'; -- Celtics
UPDATE jogadores SET id_time = 27 WHERE nome = 'Duop Reath'; -- Trail Blazers
UPDATE jogadores SET id_time = 27 WHERE nome = 'Anfernee Simons'; -- Trail Blazers
UPDATE jogadores SET id_time = 7 WHERE nome = 'Tobias Harris'; -- Pistons
UPDATE jogadores SET id_time = 22 WHERE nome = 'Marcus Smart'; -- Grizzlies
UPDATE jogadores SET id_time = 24 WHERE nome = 'Antonio Reeves'; -- Pelicans
UPDATE jogadores SET id_time = 25 WHERE nome = 'Isaiah Joe'; -- Thunder
UPDATE jogadores SET id_time = 25 WHERE nome = 'Ajay Mitchell'; -- Thunder
UPDATE jogadores SET id_time = 2 WHERE nome = 'Baylor Scheierman'; -- Celtics
UPDATE jogadores SET id_time = 2 WHERE nome = 'Payton Pritchard'; -- Celtics
UPDATE jogadores SET id_time = 2 WHERE nome = 'Luke Kornet'; -- Celtics
UPDATE jogadores SET id_time = 10 WHERE nome = 'AJ Green'; -- Bucks
UPDATE jogadores SET id_time = 10 WHERE nome = 'Bobby Portis'; -- Bucks
UPDATE jogadores SET id_time = 17 WHERE nome = 'Russell Westbrook'; -- Nuggets
UPDATE jogadores SET id_time = 17 WHERE nome = 'Christian Braun'; -- Nuggets
UPDATE jogadores SET id_time = 19 WHERE nome = 'Fred VanVleet'; -- Rockets
UPDATE jogadores SET id_time = 21 WHERE nome = 'Austin Reaves'; -- Lakers
UPDATE jogadores SET id_time = 21 WHERE nome = 'Rui Hachimura'; -- Lakers
UPDATE jogadores SET id_time = 23 WHERE nome = 'Naz Reid'; -- Timberwolves
UPDATE jogadores SET id_time = 23 WHERE nome = 'Julius Randle'; -- Timberwolves
UPDATE jogadores SET id_time = 25 WHERE nome = 'Chet Holmgren'; -- Thunder
UPDATE jogadores SET id_time = 25 WHERE nome = 'Isaiah Joe'; -- Thunder
UPDATE jogadores SET id_time = 28 WHERE nome = 'Malik Monk'; -- Kings
UPDATE jogadores SET id_time = 28 WHERE nome = 'Domantas Sabonis'; -- Kings
UPDATE jogadores SET id_time = 29 WHERE nome = 'Chris Paul'; -- Spurs
UPDATE jogadores SET id_time = 30 WHERE nome = 'Lauri Markkanen'; -- Jazz
UPDATE jogadores SET id_time = 30 WHERE nome = 'Walker Kessler'; -- Jazz*/

SELECT
j.nome,
j.idade,
j.posicao,
t.nome AS time,
t.conferencia
FROM jogadores j
JOIN times t
ON j.id_time = t.id_time;